local strikecfg = require("strikecfg")

-- Defines what strikecfg makes available
strikecfg.setup({
	sources = {
		-- Provides a way to access default and jancfg
		-- Ideally I can get configs from git, lua moudle, or local path
	},
	configs = { -- strikecfg will make thesse available from commands
		"default",
		"jancfg",
	},
	defaults = {
		config = "jancfg",
		header = "jancfg",
		termcol = "default",
		echo_before = "Hello World!",
	},
})

-- Overrides form the defaults provided from setup
strikecfg.overrides({
	echo_before = "waffle",
})

-- Allows overriding the default order in which the result is output
strikecfg.result({})
