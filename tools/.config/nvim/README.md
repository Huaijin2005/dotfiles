# Neovim 配置

这是一套基于 [LazyVim](https://www.lazyvim.org/) 的模块化配置。

## 目录职责

- `lua/config/options.lua`：编辑器选项、GUI 字体和 Provider 开关。
- `lua/config/keymaps.lua`：自定义按键。
- `lua/config/autocmds.lua`：自定义自动命令。
- `lua/config/lazy.lua`：lazy.nvim 与 LazyVim 启动配置，通常不需要修改。
- `lua/extras/languages.lua`：启用 LazyVim 官方 language extra。
- `lua/plugins/appearance.lua`：主题及外观插件。
- `lua/plugins/treesitter.lua`：需要确保安装的语法解析器。
- `lua/plugins/lsp.lua`：覆盖 LSP 设置，以及配置没有官方 extra 的服务器和 Mason 工具。

## 切换主题

修改 `lua/plugins/appearance.lua` 顶部的 `colorscheme`，可选值为：

```lua
local colorscheme = "tokyonight" -- 或 catppuccin、nordic
```

## 添加语言支持

优先在 `lua/extras/languages.lua` 中启用 LazyVim 提供的 language extra：

```lua
{ import = "lazyvim.plugins.extras.lang.python" }
```

`lua/config/lazy.lua` 会按照“LazyVim 核心 → Extras → 个人插件”的顺序加载配置。不要在
`lua/plugins/*.lua` 中导入 `lazyvim.plugins.extras.*`，否则会触发 LazyVim 的顺序检查。

如果没有对应 extra，或者需要覆盖 extra 的默认设置，再在 `lua/plugins/lsp.lua` 中扩展
`nvim-lspconfig`：

```lua
{
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      server_name = {},
    },
  },
}
```

只有确实需要额外命令行工具时，才在同一文件中扩展 Mason 的 `ensure_installed`。

## 常用维护命令

- `:Lazy`：查看、安装和更新插件。
- `:Mason`：查看语言服务器、格式化器和调试器。
- `:LazyHealth`：运行 LazyVim 健康检查。
- `:checkhealth`：运行 Neovim 完整健康检查。
