import * as core from '@actions/core';
import * as github from '@actions/github';

const token = core.getInput('token');
export const octokit = github.getOctokit(token);
export const context = github.context;
