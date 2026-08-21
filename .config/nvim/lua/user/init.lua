-- User settings
vim.cmd.colorscheme("catppuccin")

vim.o.number = true
vim.o.relativenumber = true
vim.o.hls = true
vim.o.laststatus = 3

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Keymaps
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>/", "gcc", { remap = true })
vim.keymap.set("v", "<leader>/", "gc", { remap = true })
vim.keymap.set("n", "<leader>n", ":vsplit<CR>")
vim.keymap.set("n", "<leader>t", ":tabnew<CR>")
vim.keymap.set("n", "<leader>w", ":tabclose<CR>")
vim.keymap.set("n", "<leader>e", ":lua require('dapui').close()<CR> <Bar> :NvimTreeToggle<CR>")

-- DAP
vim.keymap.set("n", "<F9>", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<F5>", ":DapContinue<CR>")
vim.keymap.set("n", "<F10>", ":DapStepOver<CR>")
vim.keymap.set("n", "<F11>", ":DapStepInto<CR>")
vim.keymap.set("n", "<S-F5>", ":DapTerminate<CR>")
vim.keymap.set("n", "<leader>d", ":NvimTreeClose<CR> <Bar> :lua require('dapui').toggle()<CR>")

require("user.DAP")

-- Treesitter
require("nvim-treesitter").install({ "rust", "javascript", "typescript", "python", "php", "yaml", "css", "html", "sql" })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "c", "lua", "rust", "javascript", "typescript", "php", "yaml", "css", "html", "sql" },
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- LSP Configuration
vim.lsp.enable({ "lua_ls", "vimls", "basedpyright", "rust_analyzer", "intelephense", "eslint", "ts_ls", "clangd" })
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Lua
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.global.lua", { link = "@variable" })
-- Python
vim.api.nvim_set_hl(0, "@lsp.typemod.property.static.python", { link = "@variable" })
vim.api.nvim_set_hl(0, "@lsp.typemod.class.declaration.python", { link = "@module" })

-- EditorConfig
