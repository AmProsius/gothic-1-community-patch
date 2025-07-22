const core = require('@actions/core');
const github = require('@actions/github');

const token = core.getInput('token');
const octokit = github.getOctokit(token);
const context = github.context;

module.exports = {
  octokit,
  context,
}
