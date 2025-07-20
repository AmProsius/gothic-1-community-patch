const path = require('path');
const fs = require('fs');
const shell = require('shelljs');
const core = require('@actions/core');

const gh = require('./gh');
const io = require('./io');
const todo = require('./todo');

/**
 * Main executive function
 */
async function main() {
  // Load configuration
  const cfg = await io.getConfig(path.join(__dirname, 'config.json'));

  // Get inputs
  const issueNum = +core.getInput('issue_num');
  const changelogSection = core.getInput('changelog_section');
  let changelogEn = core.getInput('changelog_en');
  let changelogDe = core.getInput('changelog_de');
  let shortname = core.getInput('shortname');

  // Construct variables
  const issueNumPad = issueNum.toString().padStart(G1CP_ID_LENGTH, '0');
  const branchName = `bug${issueNumPad}`;

  // Construct paths
  const templatePath = path.join(...cfg.path.template);
  const scriptPath = path.join(...cfg.path.script);
  const contentSrcPath = path.join(scriptPath, ...cfg.path.contentSrc);
  const testsuiteSrcPath = path.join(scriptPath, ...cfg.path.testsuiteSrc);
  const sessionInitPath = path.join(scriptPath, ...cfg.path.sessionInit);
  const gamesaveInitPath = path.join(scriptPath, ...cfg.path.gamesaveInit);
  const changelogEnPath = path.join(...cfg.path.changelogEn);
  const changelogDePath = path.join(...cfg.path.changelogDe);

  // Get base URL
  const baseUrl = gh.context.payload.repository.html_url.replace(/\/$/, '') + '/';
  const sourceBranch = gh.context.ref.replace("refs/heads/", '');
  const sourceUrl = baseUrl + 'tree/' + sourceBranch + '/';

  // ========================
  // Verify issue and inputs
  // ========================

  // Find issue or pull request by its number
  try {
    var { data: issue } = await gh.octokit.rest.issues.get({
      ...gh.context.repo,
      issue_number: issueNum
    });
  } catch (error) {
    throw `Invalid issue number. ${error.message}`;
  }

  // Check if issue is not closed. if so, end with error
  if (issue.state == 'closed')
    throw 'Only non-closed issues allowed';

  // Check if there is a branch for that fix already
  try {
    await gh.octokit.rest.repos.getBranch({ ...gh.context.repo, branch: branchName, });
    throw `Branch ${branchName} already exists`;
  } catch (error) { }

  // Validate short name
  if (shortname.length > cfg.shortnameMax)
    throw 'Fix shortname is too long';
  else if (!shortname.match(/^[A-Z][a-zA-Z0-9]*$/))
    throw 'Fix shortname can only contain alpha numeric characters, starting with an upper case letter';

  // Create list of labels
  const label_names = issue.labels.map(x => x.name);
  const templateLabels = issue.labels.filter(x => x.color.toLowerCase() === cfg.labelColor);

  // Check if language dependent and add shortname prefix
  const isLangDependent = label_names.includes(cfg.languageLabel);
  let langFlags = [];
  if (isLangDependent) {

    // Get end of issue title
    const spaceSplit = issue.title.trim().split(' ');
    if (spaceSplit.length <= 1)
      throw 'The language(s) is not specified in the title of this language dependent issue';

    // Extract language flags
    const langStr = spaceSplit.slice(-1)[0];
    langFlags = langStr.match(/(?<![A-Za-z])[A-Z]{2}(?![A-Za-z])/g);
    if (!langFlags)
      throw 'The language(s) is not specified in the title of this language dependent issue';

    // Prefix shortname
    langFlags.sort(); // Always same order (alphabetically)
    shortname = langFlags.join('_') + '_' + shortname;
    if (shortname.length > cfg.shortnameMax)
      throw 'Fix shortname is too long with the language flag prefix';
  }

  // Validate template label
  if (templateLabels.length != 1)
    throw `Exactly one template label required. Found ${templateLabels.length} labels.`;
  const category = templateLabels[0].name;
  const categoryLink = templateLabels[0].url.replace(/api\.github/, 'github').replace(/\/repos\//, '/');
  if (category == null)
    throw 'A fix type is required (specified by issue label)';

  // Construct file path from information
  const categoryCamel = category.toLowerCase().replace(/(?:^\w|[A-Z]|\b\w)/g, (w, i) => {
    return i ? w.toUpperCase() : w.toLowerCase();
  }).replace(/[^a-z]+/gi, '');
  let tBasePath = path.join(templatePath, categoryCamel);
  if (!fs.existsSync(tBasePath))
    throw `Template '${category}' not found. Invalid path ${tBasePath}`;

  // Get fix type
  let fixType = null;
  let fixSrcPath = null;
  if (fs.existsSync(path.join(tBasePath, 'session.d'))) {
    fixType = 'session';
    fixSrcPath = path.join(tBasePath, 'session.d');
  } else if (fs.existsSync(path.join(tBasePath, 'gamesave.d'))) {
    fixType = 'gamesave';
    fixSrcPath = path.join(tBasePath, 'gamesave.d');
  } else
    throw `Template '${category}' is invalid. Fix template file not found.`
  cfg.path.fixes.push(fixType[0].toUpperCase() + fixType.slice(1));

  // Check for test
  const testSrcPath = path.join(tBasePath, 'test.d');
  if (!fs.existsSync(testSrcPath))
    throw `Template '${category}' is invalid. Test template file not found.`

  // Check shortname length again (for Revert suffix)
  if (fixType == 'gamesave' && shortname.length + ('Revert').length > cfg.shortnameMax)
    throw 'Fix shortname is too long with the revert suffix';

  core.notice('Issue and inputs successfully verified', { title: 'Parameters verified' });

  // =========================
  // Local file manipulations
  // =========================

  // Construct function and file names
  const shortnameFull = issueNumPad + '_' + shortname; // XXX_Shortname
  const fixFuncName = cfg.funcPrefix + shortnameFull;
  const fixFuncNameRev = fixFuncName + 'Revert'; // Only necessary for gamesave fixType
  const fixFileName = 'fix' + shortnameFull + '.d';
  const testFileName = 'test' + issueNumPad + '.d';

  // Add fix file to Content_G1.src
  const fixFilePath = cfg.path.fixes.join('\\') + '\\' + fixFileName;
  const fixFilePattern = '^' + cfg.path.fixes.join('(\\\\|/)') + '(\\\\|/)fix(?<num>[0-9]{G1CP_ID_LENGTH})';
  await io.addLineToFile(contentSrcPath, fixFilePath, fixFilePattern, issueNum);

  // Add test file to Testsuite.src
  const testFilePath = cfg.path.tests.join('\\') + '\\' + testFileName;
  const testFilePattern = '^' + cfg.path.tests.join('(\\\\|/)') + '(\\\\|/)test(?<num>[0-9]{G1CP_ID_LENGTH})';
  await io.addLineToFile(testsuiteSrcPath, testFilePath, testFilePattern, issueNum);

  // Fix function call (and revert call)
  let fixFuncCall = fixFuncName + '();';
  const fixFuncCallExtra = cfg.shortnameMax + (cfg.funcPrefix + issueNumPad + '_' + '();').length;
  fixFuncCall = fixFuncCall.padEnd(fixFuncCallExtra, ' ');
  fixFuncCall = '        ' + fixFuncCall + `// #${issueNum}`;

  if (fixType == 'session') {
    // Add fix function call to initPatch.d
    await io.addLineToFile(sessionInitPath, fixFuncCall, '^\\s{8}' + cfg.funcPrefix + '(?<num>[0-9]{G1CP_ID_LENGTH})_', issueNum);
  } else {
    // Add fix function call to gamesave.d
    await io.addLineToFile(gamesaveInitPath, fixFuncCall, '^\\s{8}' + cfg.funcPrefix + '(?<num>[0-9]{G1CP_ID_LENGTH})_', issueNum);

    let fixFuncRevCall = fixFuncNameRev + '();';
    fixFuncRevCall = fixFuncRevCall.padEnd(fixFuncCallExtra, ' ');
    fixFuncRevCall = '        ' + fixFuncRevCall + `// #${issueNum}`;

    // Add fix function revert call to gamesave.d
    const pattern = '^\\s{8}' + cfg.funcPrefix + '(?<num>[0-9]{G1CP_ID_LENGTH})_[^\\r\\n]+Revert[^\\r\\n]+$';
    await io.addLineToFile(gamesaveInitPath, fixFuncRevCall, pattern, issueNum);
  }

  // Attempt to infer changelog from issue body
  let changelogEnImposed = '';
  if (changelogEn == '' || changelogEn == cfg.default.changelogEn) {
    if (!issue.body) // No body
      issue.body = '';
    const match = issue.body.match(/[\r\n]\*\*(Changelog|Expected behavior)\*\*[\r\n]{1,2}(?<text>[^\r\n]+)/);
    if (match) {
      changelogEn = match.groups.text;
      changelogEnImposed = ' (imposed by issue description)';
    } else {
      changelogEn = '### TODO ###';
    }
  }

  // Set changelog to empty
  if (changelogDe == '' || changelogDe == cfg.default.changelogDe)
    changelogDe = '### TODO ###';

  // Construct changelog entry prefix
  const clPrefix = `* Fix [#${issueNum}](https://g1cp.org/issues/${issueNum}): `;
  const clSection = '^### ' + changelogSection + '$';
  const clMatch = '^\\* Fix \\[#(?<num>\\d+)\\]';

  // Add changelog entry EN
  if (!isLangDependent || langFlags.includes("EN")) {
    changelogEn = changelogEn.trim();
    if (!changelogEn.endsWith('.'))
      changelogEn += '.';
    const clEntry = clPrefix + changelogEn;
    const line = await io.addLineToFile(changelogEnPath, clEntry, clMatch, issueNum, clSection);
    if (changelogEn.startsWith('### TODO ###'))
      todo.add(changelogEnPath, 'Add an entry in the English changelog.', line+1);
  }

  // Add changelog entry DE
  if (!isLangDependent || langFlags.includes("DE")) {
    changelogDe = changelogDe.trim();
    if (!changelogDe.endsWith('.'))
      changelogDe += '.';
    const clEntry = clPrefix + changelogDe;
    const line = await io.addLineToFile(changelogDePath, clEntry, clMatch, issueNum, clSection);
    if (changelogDe.startsWith('### TODO ###'))
      todo.add(changelogDePath, 'Add an entry in the German changelog.', line+1);
  }

  // Template replacements
  let langCheckCode = '';
  if (isLangDependent)
    langCheckCode = 'G1CP_Testsuite_CheckLang(' + langFlags.map(v => 'G1CP_Lang_' + v).join(' | ') + ');\r\n    ';
  const replacements = new Map([
    ['{ISSUE_NUM}', issueNum],
    ['{ISSUE_NUM_PAD}', issueNumPad],
    ['{SHORTNAME}', shortname],
    ['{LONGNAME}', issue.title.trim()],
    ['{LANGCHECK}', langCheckCode],
  ]);

  // Create fix file from template
  const fixDstPath = path.join(scriptPath, ...cfg.path.fixes, fixFileName);
  await io.replaceInFile(fixSrcPath, fixDstPath, replacements);
  await todo.parse(fixDstPath);

  // Create test file from template
  const testDstPath = path.join(scriptPath, ...cfg.path.tests, testFileName);
  await io.replaceInFile(testSrcPath, testDstPath, replacements);
  await todo.parse(testDstPath);

  core.notice('Local file manipulations successful', { title: 'File operations successful'});

  // =====================
  // Local git operations
  // =====================

  shell.config.fatal = true;
  shell.config.silent = true;

  // Perform local git operations
  try {
    shell.exec(`git checkout -b ${branchName}`, { silent: false });
    shell.exec('git add -A');

    // Print staged files in color
    const staged = shell.exec('git status -s').toString();
    core.info('\u001b[1mFiles:');
    staged.split(/\r?\n/).forEach((line) => {
      let prefix = '';
      if (line.startsWith('M '))
        prefix = '\u001b[33m';
      else if (line.startsWith('A '))
        prefix = '\u001b[32m';
      else if (!line.length)
        return;
      core.info('  ' + prefix + line);
    });

    shell.exec(`git commit -m "Initialize work on #${issueNum}"`);
  } catch (error) {
    throw `Failed to perform local git operations. ${error.message}`;
  }

  core.notice(`Changes committed to local branch ${branchName}`, { title: 'Local git operations successful' });

  /*
   * Up to here no (permanent) changes have been performed on the repository.
   * Any critical error from here on out, will leave the pull request partially initialized.
   */

  // ======================
  // Summary issue comment
  // ======================
  const categoryText = categoryLink ? `[${category}](${categoryLink})` : category;
  const fixApplyLink  = `[${fixFuncName}](${sourceUrl + fixDstPath})`;
  const fixRevertLink = `[${fixFuncNameRev}](${sourceUrl + fixDstPath})`;
  const testLink = `[G1CP_Test_${issueNumPad}](${sourceUrl + testDstPath})`;

  const comment = (
    'Initializing fix files with\r\n' +
    '\r\n' +
    'Name                | Value\r\n' +
    '------------------- | ----------------\r\n' +
    `Fix number          | **#${issueNum}**\r\n` +
    `Fix longname        | **${issue.title.trim()}**\r\n` +
    `Fix shortname       | **${shortname}**\r\n` +
    `Fix apply function  | **${fixApplyLink}**\r\n` +
    `Fix revert function | **${fixType == 'revert' ? fixRevertLink : '-' }**\r\n` +
    `Test function       | **${testLink}**\r\n` +
    `Fix template        | **<kbd>${categoryText}</kbd>**\r\n` +
    `Fix type            | **${fixType}**\r\n` +
    `Language dependent  | **${isLangDependent ? langFlags.join(', ') : 'no'}**\r\n` +
    `Branch name         | **${branchName}**\r\n` +
    `Changelog En        | **${changelogEn}**${changelogEnImposed}\r\n` +
    `Changelog De        | **${changelogDe}**`
  );
  await gh.octokit.rest.issues.createComment({
    ...gh.context.repo,
    issue_number: issueNum,
    body: comment,
  });

  // ==========================
  // File operations completed
  // ==========================
  try {
    shell.exec(`git push -u origin ${branchName}`);
  } catch (error) {
    throw `Failed to push branch ${branchName}. ${error.message}`;
  }

  core.notice(`Pushed branch ${branchName} successfully`, { title: 'Git branch successful' });

  /*
   * No more fatal error from here. The changes have already been made.
   * If something goes wrong now, so be it.
   */

  // ==========================
  // Adjust Github environment
  // ==========================

  // Create pull request from issue
  let prNum = null;
  if (!issue.pull_request) {
    const msg = 'pull request from issue';
    try {
      const response = await gh.octokit.rest.pulls.create({
        ...gh.context.repo,
        head: branchName,
        base: sourceBranch,
        title: `Fix: ${issue.title.trim()}`,
        body: `Closes #${issueNum}.`,
        draft: (gh.context.payload.repository.private ? false : true)
      });
      prNum = response.data.number;
      core.notice(`Created ${msg}`, { title: 'Pull request' });
    } catch (error) {
      core.setFailed(`Failed to create ${msg}. ${error.message}`);
      // Continue anyway
    }
  }

  // Create pull request review or at least comments with TODO items
  if (todo.list.length) {
    core.notice(`Found ${todo.list.length} TODO items for PR ${prNum}.`, { title: 'To-do list' });
    const msg = 'pull request review with to-do list';
    try {
      await gh.octokit.rest.pulls.createReview({
        ...gh.context.repo,
        pull_number: prNum,
        event: 'COMMENT',
        body: 'The following are the remaining necessary adjustments.',
        comments: todo.list
      });
      core.notice(`Added ${msg}`, { title: 'Pull request review' });
    } catch (error) {
      core.setFailed(`Failed to add ${msg}. ${error.message}`);
      // Continue anyway
    }
  }

  // Add link to issue/pull-request
  core.notice(`For summary and details see ${gh.context.payload.repository.html_url}/issues/${issueNum}`,
              { title: 'Pull-request' });
}


function throwErr(error) {
  core.setFailed(error.message ? error.message : error, { title: 'Fatal error' });
}

try {
  main().catch(error => throwErr(error));
} catch (error) {
  throwErr(error);
}
