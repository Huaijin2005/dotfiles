return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    ensure_installed = {
      "bash",
      "lua",
      "json",
      "markdown",
      "markdown_inline",
      "python",
      "vim",
      "c",
      "cpp",
    },
  },
}
