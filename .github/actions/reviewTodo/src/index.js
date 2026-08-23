import path from 'node:path';
import * as core from '@actions/core';

import * as gh from './gh';
import * as io from './io';
import * as todo from './todo';

/**
 * Main executive function
 */
async function main() {
  // Load configuration
  const cfg = await io.getConfig(path.join(__dirname, 'config.json'));

  // Get inputs
  const prNum = +core.getInput('pr_num');

  // Construct paths
  const scriptPath = path.join(...cfg.path.script);
  const changelogEnPath = path.join(...cfg.path.changelogEn);
  const changelogDePath = path.join(...cfg.path.changelogDe);

  // ========================
  // Verify issue and inputs
  // ========================

  // Find issue or pull request by its number
  try {
    var { data: pr } = await gh.octokit.rest.pulls.get({
      ...gh.context.repo,
      pull_number: prNum,
    });
  } catch (error) {
    throw `Invalid pull request number. ${error.message}`;
  }

  // Check if issue is not closed. if so, end with error
  if (pr.state == 'closed')
    throw 'Only non-closed pull requests allowed';

  // Check if there is a branch for that fix already
  try {
    var { data: fileList } = await gh.octokit.rest.pulls.listFiles({
      ...gh.context.repo,
      pull_number: prNum,
    })
  } catch (error) {
    throw `Failed to obtain list of changed files. ${error.message}`;
  }

  console.debug('Print file list');
  fileList.filter(
      (s) => s.filename.startsWith(scriptPath) && s.filename.endsWith('.d')
  ).forEach((s) => console.log(s.filename));

  // ============
  // Review files
  // ============

  console.debug('Parse English changelog');
  todo.parse(changelogEnPath, 'Add an entry in the English changelog.');
  console.debug('Parse German changelog');
  todo.parse(changelogDePath, 'Add an entry in the German changelog.');
  console.debug('Parse all scripts changelog');
  fileList.filter(
    (s) => s.filename.startsWith(scriptPath) && s.filename.endsWith('.d')
  ).forEach((s) => todo.parse(s.filename));

  // ==========================
  // Adjust Github environment
  // ==========================

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
  core.notice(`For summary and details see ${gh.context.payload.repository.html_url}/pull/${prNum}`,
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
