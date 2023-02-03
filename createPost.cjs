const fs = require( "fs/promises")
const path = require( "path")

async function main() {
    const encoding = "utf8"
    const contentFolder = path.join(__dirname, "content")
    const postsFolderName = "posts"

    try {
      const [node, filename,id] = process.argv

      if (id === undefined) throw new Error("usage: node ./newPost.cjs filename")

      fs.writeFile(path.join(contentFolder, postsFolderName, `[${id}].md`),
          metadataTemplate(toTitle(id), id), { encoding })
      } catch (err) {
        console.error(err)
        process.exit(1)
      }
}

function toTitle(id) {
    return id
        .split("-")
        .map(capitaliza)
        .join(" ")

    function capitaliza(word) {
        return word
            .split("")
            .map((c, i) => i === 0 ? c.toLocaleUpperCase() : c.toLocaleLowerCase())
            .join("")
    }
}

function metadataTemplate(title, id) {
  const template =
`---
title: ${title}
id: ${id}
---

# Title

Body
`

  return template
}

main()
