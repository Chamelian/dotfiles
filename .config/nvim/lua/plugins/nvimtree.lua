return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = {
		sort = { sorter = "case_sensitive" },
		view = { width = 30, adaptive_size = true },
		renderer = { group_empty = true },
		filters = { dotfiles = false },
	},
}
