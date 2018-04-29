const fs = require('graceful-fs');
const jsonArr = JSON.parse(require('fs').readFileSync('../results/repert_array.json', 'utf8'))
const tagNames = JSON.parse(require('fs').readFileSync('../results/tag_names_utf8.json', 'utf8'))
const targetFile = '../results/index.html'
let jsonTagArr = []
// TODO: map '000' key

fs.writeFile(
  targetFile,
  `<head>
      <meta charset="UTF-8"></meta>
    </head>`,
  'utf8',
  (err) => {
    if (err) console.log(err)
  }
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
        targetFile,
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
