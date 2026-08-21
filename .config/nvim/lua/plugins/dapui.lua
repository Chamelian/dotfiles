return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	opts = {
		layouts = {
			{
				elements = {
					{
						id = "scopes",
						size = 0.25,
					},
					{
						id = "watches",
						size = 0.25,
					},
					{
						id = "breakpoints",
						size = 0.25,
					},
					{
						id = "stacks",
						size = 0.25,
					},
				},
				position = "left",
				size = 30,
			},
			{
				elements = {
					{
						id = "console",
						size = 0.25,
					},
					{
						id = "repl",
						size = 0.75,
					},
				},
				position = "bottom",
				size = 12,
			},
		},
	},
}
