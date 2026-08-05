local colorscheme = "tokyonight" -- 可选：tokyonight、catppuccin、nordic

return {
  { "LazyVim/LazyVim", opts = { colorscheme = colorscheme } },
  { "AlexvZyl/nordic.nvim", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", opts = { flavour = "mocha" } },
  { "folke/tokyonight.nvim", opts = { style = "storm" } },
}
