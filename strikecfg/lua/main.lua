local tag = "strikecfg"
local rev = "0.0.1"

local argparse = require("argparse")

local parser = argparse("strikecfg", "Generate CS2 config files")
parser:option("-c --config", "Config file"):default("./config/jancfg/lua/init.lua")

local args = parser:parse()

local function load_module(path, name)
	local chunk = assert(loadfile(path))
	local mod = assert(chunk())
	package.loaded[name] = mod
	return mod
end

local function render_kv(tbl, indent)
	indent = indent or ""
	local lines = {}

	for key, value in pairs(tbl or {}) do
		if type(value) == "table" then
			table.insert(lines, indent .. tostring(key) .. " = {")
			table.insert(lines, render_kv(value, indent .. "  "))
			table.insert(lines, indent .. "}")
		else
			table.insert(lines, indent .. tostring(key) .. " = " .. tostring(value))
		end
	end

	return table.concat(lines, "\n")
end

load_module("./strikecfg/lua/init.lua", "strikecfg")
local cfg = assert(loadfile(args.config))()

local plaintext_order = {
	"echo | " .. tag .. " " .. rev,
	cfg.modules.preamble.header or "",
	render_kv(cfg.modules.sound or {}),
}

local result = table.concat(plaintext_order, "\n")

local out = assert(io.open("./result", "w"))
out:write(result)
out:close()
