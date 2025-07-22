const fs = require('fs');
const iconvlite = require('iconv-lite');

/**
 * Load configuration at runtime
 *
 * @param     string      path to the configuration file
 * @returns   object      loaded configuration
 */
async function getConfig(filePath) {
  let cfg = null;
  try {
    const data = fs.readFileSync(filePath);
    const dataDec = iconvlite.decode(data, 'win1252');
    cfg = JSON.parse(dataDec);
  } catch (error) {
    throw `Could not load configuration. ${error.message}`;
  }
  return cfg;
}

/**
 * Add a new line to a text file at a specific position. The regex should match neighboring lines and must contain a
 * caption group called 'num'. This integer will be compared with the issue number to insert the new line in the correct
 * position.
 *
 * @param     string      path to the text file
 * @param     string      the text to insert
 * @param     string      regular expression to match neighboring lines
 * @param     integer     number to sort by
 * @param     string      start looking after this match
 * @returns   boolean     false on error, true otherwise
 */
async function addLineToFile(filePath, newLine, regexStr, number, matchAfter) {
  let lines = [];
  try {
    const data = fs.readFileSync(filePath);
    const dataDec = iconvlite.decode(data, 'win1252');
    lines = dataDec.split(/\r?\n/);
  } catch (error) {
    throw `Could not read file ${filePath}. ${error.message}`;
  }

  // Iterate over lines
  let isInBounds = false;
  let lineNum = -1;
  const regex = new RegExp(regexStr);
  const regexAfter = new RegExp(matchAfter);
  const found = lines.some((line, index) => {
    if (!isInBounds && matchAfter) {
      if (line.match(regexAfter))
        isInBounds = true;
      return false;
    }

    const match = line.match(regex);
    if (match) {

      // console.log(match.groups.num + ' :: ' + line);

      isInBounds = true;
      if (+match.groups.num > number) {
        lineNum = index;
        return true;
      } else if (+match.groups.num == number)
        throw `File ${filePath} already has a line for issue ${number} (line ${index+1})`;
    } else if (isInBounds) {
      lineNum = index;
      return true;
    }
  });

  lines.splice(lineNum, 0, newLine);

  if (!found)
    throw `Could not find suitable line in file ${filePath}`;

  try {
    const dataEnc = iconvlite.encode(lines.join('\n'), 'win1252');
    fs.writeFileSync(filePath, dataEnc);
  } catch (error) {
    throw `Could not write to file ${filePath}. ${error.message}`;
  };

  return lineNum;
}

/**
 * Replace all occurrences in a file and save it as a new file to a specified destination
 *
 * @param     string      path to source text file
 * @param     string      path to destination text file (cannot exit)
 * @param     Map         needle-replacement pairs
 * @returns   boolean     false on error, true otherwise
 */
async function replaceInFile(srcPath, dstPath, pairs) {
  let text = '';
  try {
    const data = fs.readFileSync(srcPath);
    text = iconvlite.decode(data, 'win1252');
  } catch (error) {
    throw `Could not read file ${srcPath}. ${error.message}`;
  }

  for (const [needle, replace] of pairs.entries())
    text = text.replaceAll(needle, replace);

  try {
    const dataEnc = iconvlite.encode(text, 'win1252');
    fs.writeFileSync(dstPath, dataEnc);
  } catch (error) {
    throw `Could not write to file ${dstPath}. ${error.message}`;
  };

  return true;
}


module.exports = {
  getConfig,
  addLineToFile,
  replaceInFile,
}
