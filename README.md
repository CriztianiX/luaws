# luaws
## lua bridge to aws-cli (a proof of concept)

To install just copy luaws/ folder at you library path

At the moment take a look at tboot.lua to see how it works.
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
bash tboot.sh
```
