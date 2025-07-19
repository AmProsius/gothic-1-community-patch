const fs = require('fs');
const iconvlite = require('iconv-lite');

// Global to-do list
const list = [];

/**
 * Add line to the to-do list, which will be turned into pull request review comments
 *
 * @param     string      path to updated file
 * @param     string      review comment
 * @param     integer     start line
 * @param     integer     end line (optional)
 */
function add(path, comment, start_line, end_line) {
  comment = comment.trim();
  if (!comment.endsWith('.'))
    comment += '.';
  if (end_line == null) {
    end_line = start_line + 1;
    start_line -= 1;
  }

  // Check to merge with existing elements
  for (var i = list.length - 1; i >= 0; i--) {
    if (list[i].path != path)
      continue;

    if (list[i].start_line-1 <= start_line && end_line <= list[i].line+1) {
      list[i].body = list[i].body + '\r\n' + comment;

      if (start_line < list[i].start_line)
        list[i].start_line = start_line;
      if (end_line > list[i].line)
        list[i].line = end_line;

      return;
    }
  }

  // Otherwise add new element
  list.push({
    path: path,
    body: comment,
    start_line: start_line,
    start_side: 'RIGHT',
    line: end_line,
    side: 'RIGHT',
  });
}

/**
 * Parse a file to find all mentions of ### TODO ###
 *
 * @param     string      path to updated file
 * @returns   boolean     false on error, true otherwise
 */
async function parse(path) {
  let text = '';
  try {
    const data = fs.readFileSync(path);
    text = iconvlite.decode(data, 'win1252');
  } catch (error) {
    throw `Could not read file ${path}. ${error.message}`;
  }

  const regex = /###\s*TODO:?\s*(?<comment>[^#]*)?###/igm;
  const nl = /\r?\n/g;
  const matches = text.match(nl);
  const numLines = matches ? matches.length : 1;

  while ((match = regex.exec(text)) !== null) {
      let comment = (match.groups.comment || '').trim();
      if (!comment.length)
        comment = 'Adjust this part.';

      // Find lines
      const char_start = match.index;
      const char_end = match.index + match[0].length;
      let m = text.slice(0, char_start).match(nl);
      let line_start = m ? (m.length + 1) : 1;
      m = text.slice(0, char_end).match(nl);
      let line_end = m ? (m.length + 1) : 1;

      // Start and end line cannot be the same
      if (line_end <= line_start) {
        line_start = Math.max(0, line_start-1);
        line_end = Math.min(numLines, line_start+2);
      }

      add(path, comment, line_start, line_end);
  }

  return true;
}


module.exports = {
  list,
  add,
  parse,
};
