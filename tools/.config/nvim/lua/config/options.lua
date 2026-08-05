-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "-" }
vim.opt.wrap = true

-- GUI 字体只对 Neovide 等客户端生效；终端字体由终端模拟器管理。
vim.opt.guifont = {
  "CodeNewRoman Nerd Font",
  "FiraMono Nerd Font",
  "LXGW WenKai Mono GB Screen",
  "LXGW WenKai Mono TC",
  "Noto Sans Mono CJK SC",
  "Noto Sans Mono CJK TC",
}

-- 未使用的远程插件 Provider；不影响对应语言的编辑或 LSP。
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
