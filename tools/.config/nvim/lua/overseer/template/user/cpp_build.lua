-- 项目级 C/C++ 编译任务:<leader>oo → 选 "cpp build"
-- root = 打开 nvim 时的 cwd(与 LazyVim 惯例一致:在项目根打开 nvim)
-- 分支优先级:cmake configure → cmake build → make → 单文件 g++
return {
  name = "cpp build",
  builder = function()
    local root = vim.fn.getcwd()
    local quickfix = { { "on_output_quickfix", open = true }, "default" }
    local has_cmake = vim.fn.executable("cmake") == 1
    local cmake_lists = vim.fn.filereadable(root .. "/CMakeLists.txt") == 1
    local build_dir = vim.fn.isdirectory(root .. "/build") == 1
    local makefile = vim.fn.filereadable(root .. "/Makefile") == 1
    if has_cmake and cmake_lists and not build_dir then
      -- 首次:配置并导出 compile_commands.json 供 clangd
      return { cmd = { "cmake", "-S", root, "-B", root .. "/build", "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" }, components = quickfix }
    elseif has_cmake and build_dir then
      return { cmd = { "cmake", "--build", root .. "/build" }, components = quickfix }
    elseif makefile then
      return { cmd = { "make" }, components = quickfix }
    else
      -- 单文件场景(练习/刷题):编译当前文件,带调试信息
      return { cmd = { "g++", "-g", "-O0", "-std=c++17", vim.fn.expand("%:p"), "-o", vim.fn.expand("%:p:r") }, components = quickfix }
    end
  end,
  condition = { filetype = { "c", "cpp" } },
}
