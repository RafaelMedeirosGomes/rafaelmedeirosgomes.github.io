const fs = require( "fs/promises")
const path = require( "path")

async function main() {
    const encoding = "utf8"
    const contentFolder = path.join(__dirname, "content")
    const postsFolderName = "posts"

    try {
        const files = await fs.readdir(path.join(contentFolder, postsFolderName))
        fs.writeFile(path.join(contentFolder, `${postsFolderName}.md`), metadataTemplate(postsFolderName, files), { encoding })
      } catch (err) {
        console.error(err)
        process.exit(1)
      }
}

function metadataTemplate(folderName, fileList) {
  const metadataKey = "allPosts"

  const template = fileList.reduce((acc, cur) => `${acc}\n  - ${folderName}/${cur}`, `---\n${metadataKey}:`).concat("\n---\n")

  return template
}

main()