# luaws - lua aws - amazon web services
## lua bridge to aws-cli (a proof of concept)

[![Coverage Status](https://coveralls.io/repos/CriztianiX/luaws/badge.svg?branch=master&service=github)](https://coveralls.io/github/CriztianiX/luaws?branch=master)

To install using luarocks: 
```bash
$ sudo luarocks make
```
At the moment take a look at tboot.lua to see how it works.

### Describe method's structure
You can use getMethodStructure() to gets the available structure.

```lua
local luaws = require("luaws.luaws").new({
  access_key = os.getenv("AWS_ACCESS_KEY"),
  access_secret = os.getenv("AWS_ACCESS_SECRET"),
  region = os.getenv("AWS_REGION")
})
luaws:SQS():getMethodStructure("createQueue")
```



To run test create a file called tboot.sh and complete with your settings
```bash
export AWS_ACCESS_KEY=""
export AWS_ACCESS_SECRET=""
export AWS_REGION=""
export AWS_SWF_DOMAIN=""
export AWS_SWF_TASKLIST=""
export AWS_BUCKET=""
export AWS_QUEUE=""
busted "$@" tboot.lua
```
and run with:

```bash
$ bash tboot.sh
```
