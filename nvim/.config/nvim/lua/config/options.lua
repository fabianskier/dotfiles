vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local options = {
  -- add in alphabetical order
  backup          = false,
  breakindent     = true,
  clipboard       = "unnamedplus",
  cmdheight       = 2,
  completeopt     = { "menuone", "noselect" },
  conceallevel    = 0,
  cursorline      = true,
  expandtab       = true,
  fileencoding    = "utf-8",
  hlsearch        = true,
  ignorecase      = true,
  guifont         = "monospace:h17",
  mouse           = "a",
  number          = true,
  numberwidth     = 4,
  pumheight       = 10,
  relativenumber  = true,
  scrolloff       = 8,
  shiftwidth      = 2,
  showmode        = false,
  showtabline     = 2,
  sidescrolloff   = 8,
  signcolumn      = "yes",
  smartcase       = true,
  smartindent     = true,
  splitbelow      = true,
  splitright      = true,
  swapfile        = false,
  tabstop         = 2,
  termguicolors   = true,
  timeout         = true,
  timeoutlen      = 300,
  undofile        = true,
  updatetime      = 300,
  writebackup     = false,
  wrap            = false,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]