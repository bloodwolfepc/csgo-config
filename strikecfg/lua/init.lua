local M = {}

function M.config_builder()
	return {
		modules = {
			preamble = {},
			sound = {},
			keymaps = {},
		},
	}
end

return M
