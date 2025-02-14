function XATS2JS_NODE_readFileSync(path)
{
  const fs = require("fs")
  return fs.readFileSync(path, "utf8")
}
