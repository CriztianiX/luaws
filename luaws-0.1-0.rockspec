package = "luaws"
version = "0.1-0"

source = {
	url = "https://github.com/CriztianiX/luaws"
}

description = {
	summary = "lua bridge to aws-cli",
	maintainer = "Cristian Haunsen <cristianhaunsen@gmail.com>",
	license = "MIT"
}

dependencies = {
	"lua >= 5.1, < 5.4",
	"compat53",
	"middleclass >= 3.1",
	"luafilesystem"
}

build = {
	type = "command"
}
