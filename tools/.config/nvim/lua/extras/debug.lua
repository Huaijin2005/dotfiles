return {
  -- dap.core: nvim-dap + nvim-dap-ui + nvim-dap-virtual-text + mason-nvim-dap,
  --   绑定 LazyVim 自带 <leader>d* 键位,调试 UI 随会话自动开/关。
  -- editor.overseer: 任务运行器,<leader>oo 运行任务、<leader>ow 任务列表、<leader>ot 任务操作;
  --   其 enable_dap() 在启动调试前可先询问是否运行编译任务。
  { import = "lazyvim.plugins.extras.dap.core" },
  { import = "lazyvim.plugins.extras.editor.overseer" },
}
