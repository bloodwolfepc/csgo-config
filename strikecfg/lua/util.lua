M = {}

M.mkHeader = function(header)
	local out = {}

	for line in (header .. "\n"):gmatch("(.-)\n") do
		out[#out + 1] = "echo |" .. line
	end

	return table.concat(out, "\n")
end

M.render_kv = function(tbl)
	local lines = {}
	for key, value in pairs(tbl) do
		table.insert(lines, tostring(key) .. " = " .. tostring(value))
	end
	return table.concat(lines, "\n")
end

return M
