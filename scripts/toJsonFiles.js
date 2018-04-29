const fs = require('graceful-fs');
const jsonArr = JSON.parse(require('fs').readFileSync('../results/repert_array.json', 'utf8'))
const tagNames = JSON.parse(require('fs').readFileSync('../results/tag_names_utf8.json', 'utf8'))

let jsonTagArr = []
// TODO: map '000' key

jsonArr.forEach(record => {
  let recObj = {}
  Object.keys(record)
    .map(key => {
      recObj[tagNames[key]] = record[key]
    }) // map
  // all values are strings by default
  recObj['$MFN'][0] = JSON.stringify(recObj['$MFN'][0])
  fs.writeFile(
    '../results/json_files/mfn_' + record['000'] + '.json',
    JSON.stringify(recObj),
    'utf8', (err) => {
      if (err) console.log(err)
    }) // fs
}) // forEach
