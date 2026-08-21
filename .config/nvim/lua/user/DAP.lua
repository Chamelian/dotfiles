-- DAP Main Configuration File

local dap, dapui = require("dap"), require("dapui")
local dapDirectory = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/"
dap.listeners.before.attach.dapui_config = function()
	require("nvim-tree.api").tree.close()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	require("nvim-tree.api").tree.close()
	dapui.open()
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "ErrorMsg", linehl = "ErrorMsg", numhl = "" })
-- dap.listeners.before.event_terminated.dapui_config = function()
-- 	dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
-- 	dapui.close()
-- end

-- Python
dap.adapters.debugpy = {
	type = "executable",
	command = dapDirectory .. "debugpy-adapter",
}
dap.configurations.python = {
	{
		type = "debugpy",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			return "/usr/bin/python"
		end,
	},
}
