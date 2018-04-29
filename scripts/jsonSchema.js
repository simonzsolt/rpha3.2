const fs = require('graceful-fs');
const jsonArr = require('../results/repert_array.json')
const tagNames = require('../results/tag_names.json')
let jsonTagArr = []
// TODO: map '000' key

function toJsonFiles() {
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
}

function toHtmlFile() {

  fs.writeFile(
    './index.html',
    `<head>
      <meta charset="UTF-8"></meta>
    </head>`,
    'utf8',
    (err) => {if (err) console.log(err)}
)

  jsonArr.forEach(record => {
    Object.keys(record)
      .map(key => {

        let value
        if (record[key].length > 1) {
          record[key].forEach(v => {
            value = v.toString()
          })
        } else if (typeof record[key][0] === 'object') {
          record[key].forEach(v => {
            Object.keys(v).forEach(k => {
              value += `
                <td>` + v[k] + `</td>
                <td>` + k + `</td>
                `
            })
          })
        } else {
          value = record[key]
        }

        fs.appendFile(
          './index.html',
          `<table>
  <tr>
  <td>` + tagNames[key] + `</td>
  <td>` + value + `</td>
  </tr>
  </table>`,
          'utf8', (err) => {
            if (err) console.log(err)
          }) // fs
      }) // map
  }) // forEach
}

// toHtmlFile();
toJsonFiles();
