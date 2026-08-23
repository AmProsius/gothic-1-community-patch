import fs from 'node:fs';
import iconvlite from 'iconv-lite';

/**
 * Load configuration at runtime
 *
 * @param     string      path to the configuration file
 * @returns   object      loaded configuration
 */
export async function getConfig(filePath) {
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
