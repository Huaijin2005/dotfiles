local languages = {
  "bash",
  "lua",
  "json",
  "markdown",
  "markdown_inline",
  "python",
  "vim",
  "c",
  "cpp",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      for _, language in ipairs(languages) do
        if not vim.tbl_contains(opts.ensure_installed, language) then
          table.insert(opts.ensure_installed, language)
        end
      end
    end,
  },
}
