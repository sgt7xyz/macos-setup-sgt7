-- =============================================================================
-- Neovim Configuration with Catppuccin Macchiato Theme
-- =============================================================================

-- Install Catppuccin theme via vim.pack
vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }

-- Catppuccin Macchiato Theme
vim.cmd.colorscheme("catppuccin-macchiato")

-- Line numbers
vim.opt.number = true

-- Tab settings (2 spaces by default)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Status line
vim.opt.laststatus = 2

-- Display whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", space = "·", trail = "·" }

-- Python specific settings (4 spaces)
local python_group = vim.api.nvim_create_augroup("python_settings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = python_group,
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})
