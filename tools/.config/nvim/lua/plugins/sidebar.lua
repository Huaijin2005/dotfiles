-- 侧边栏(Snacks Explorer)独立配置
-- 背景:侧边栏由 LazyVim 默认 extra editor.snacks_explorer 启用,
-- 组件是 snacks.nvim 的 explorer(picker 的 sidebar 布局)。
-- 官方配置结构(snacks.nvim docs/explorer.md):
--   组件行为(replace_netrw/trash)→ opts.explorer
--   picker 行为(过滤/排序/布局)→ opts.picker.sources.explorer
return {
  {
    "folke/snacks.nvim",
    -- 在 snacks 以 default=true 定义 picker 高亮之前先定义高亮,
    -- 保证我们的样式不被覆盖(default=true 只填充尚未定义的组)。
    init = function()
      vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { fg = "#565f89", italic = true })
      vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = "#444b6a" })

      -- 自然排序(patch):tree.lua 的 walk 用纯字典序 a.name < b.name,
      -- VSCode 是自然排序(数字按数值),这里用"数字段补零后比较"实现同样效果。
      -- snacks 无此配置项,排序硬编码在 Tree:walk 内,故整体替换该方法。
      local ok, tree = pcall(require, "snacks.explorer.tree")
      if ok then
        local proto = getmetatable(tree)
        local function natcmp(a, b)
          local function pad(s)
            return (s:gsub("%d+", function(d) return ("000000000000"):sub(1, 12 - #d) .. d end))
          end
          return pad(a) < pad(b)
        end
        proto.walk = function(self, node, fn, opts)
          local abort = fn(node)
          if abort ~= nil then
            return abort
          end
          local children = vim.tbl_values(node.children)
          table.sort(children, function(a, b)
            if a.dir ~= b.dir then
              return a.dir
            end
            return natcmp(a.name, b.name)
          end)
          for c, child in ipairs(children) do
            child.last = c == #children
            abort = false
            if child.dir and (child.open or (opts and opts.all)) then
              abort = self:walk(child, fn, opts)
            else
              abort = fn(child)
            end
            if abort then
              return true
            end
          end
          return false
        end
      end
    end,

    opts = {
      picker = {
        sources = {
          explorer = {
            -- 1. 显示 .gitignore 忽略的文件/目录(默认 false 隐藏)。
            --    区分方式:ignored 条目使用 SnacksPickerPathIgnored 高亮
            --    (灰 + 斜体),git 状态列同时显示 ! 图标。
            --    需要临时切换时,explorer 内按 I(toggle ignored)。
            ignored = true,
            -- 2. 显示 . 开头的隐藏文件/目录(默认 false 隐藏)。
            --    区分方式:SnacksPickerPathHidden 高亮(更暗的灰,无斜体,
            --    与 ignored 的斜体灰区分)。
            --    需要临时切换时,explorer 内按 H(toggle hidden)。
            hidden = true,
            -- 2. 排序:目录优先、同级内按名称升序 —— snacks 默认行为
            --    (explorer/tree.lua walk 的 table.sort:先 dir 后 name 字典序),
            --    picker 侧 sort = { fields = { "sort" } } 保持该顺序。
            --    此处显式声明,防止未来全局 picker 配置改动影响。
            sort = { fields = { "sort" } },
            -- 3. 与 VSCode 一致的纯字典序:tree walk 的 name 比较已是 Lua
            --    字符串字节序(10-traceback < 9-gragh,同 VSCode)。
            --    但过滤词输入等路径会走 topk 堆排序,item.sort 全为 nil 时
            --    比较器恒 false,堆内顺序不稳定(可能出现 9 在 10 前)。
            --    这里给每个 item 赋确定的 sort 值:目录前缀 "0"/文件 "1"
            --    + basename,使任何排序路径都得到稳定字典序。
            transform = function(item)
              local name = vim.fn.fnamemodify(item.text, ":t")
              item.sort = (item.dir and "0" or "1") .. name
              return item
            end,
          },
        },
      },
    },
  },
}
