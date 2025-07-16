local M = {}

local fn = vim.fn
local uv = vim.loop
local cmd = vim.cmd

-- 設定 CSCOPE 跟目錄
local cscope_base_dir = uv.fs_realpath(fn.expand("~/CSCOPE/")) or fn.expand("~/CSCOPE")
if not fn.isdirectory(cscope_base_dir) then
  fn.mkdir(cscope_base_dir, "p")
end

local cscope_show_file = cscope_base_dir .. "/cscope_show.txt"

-- 更新 cscope db 顯示
local function update_cscope_show()
  cmd("redir! > " .. cscope_show_file)
  cmd("silent Cscope db show")
  cmd("redir END")
  cmd("redraw!")
end

-- 切回原 buffer
local function switch_to_work_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
      vim.api.nvim_set_current_buf(buf)
      return
    end
  end
end

-- 取得乾淨子資料夾名（用最後一層資料夾）
local function get_subdir_name(path)
  local abs = uv.fs_realpath(fn.expand(path)) or fn.expand(path)
  return fn.fnamemodify(abs, ":t")
end

-- 處理選單動作
local function process_action(action)
  local current_dir = uv.fs_realpath(fn.getcwd())

  if action == -1 or action == 3 then
    cmd("redraw!")
    return
  end

  -- Add
  if action == 1 or action == 4 or action == -12 then
    local input_path = (action == 4 or action == -12)
      and current_dir
      or fn.input("Add?", fn.expand("%:p:h"), "file")

    local abs_target = uv.fs_realpath(fn.expand(input_path)) or fn.expand(input_path)
    local db_path = cscope_base_dir .. "/" .. abs_target

    fn.system("mkdir -p " .. db_path)
    fn.system("touch " .. db_path .. "/compile_commands.json")

    local found = false
    local search_path = db_path
    for _ = 1, 10 do
      if fn.filereadable(search_path .. "/cscope.out") == 1 then
        cmd("silent! Cscope db add " .. search_path)
        found = true
        break
      end
      local parent = fn.fnamemodify(search_path, ":h")
      if parent == search_path then break end
      search_path = parent
    end

    if not found then
      vim.notify("未找到 cscope.out，無法新增資料庫", vim.log.levels.WARN)
    end

    update_cscope_show()
    M.ReloadCscope()

  -- Gen
  elseif action == 0 then
    local gentemp = fn.input("Generate?", fn.expand("%:p:h"), "file")
    local abs_path = uv.fs_realpath(fn.expand(gentemp)) or fn.expand(gentemp)
    local script = uv.fs_realpath(fn.expand("~/.nvim/gencs.sh")) or fn.expand("~/.nvim/gencs.sh")

    if fn.filereadable(script) == 0 then
      vim.notify("找不到 gencs.sh 腳本: " .. script, vim.log.levels.ERROR)
      return
    end

    fn.system(script .. " " .. abs_path)

    local db_path = cscope_base_dir .. "/" .. abs_path

    if fn.filereadable(db_path .. "/cscope.out") == 1 then
      cmd("silent! Cscope db add " .. db_path)
    else
      vim.notify("找不到 cscope.out 檔案於：" .. db_path, vim.log.levels.ERROR)
    end

    update_cscope_show()
    M.ReloadCscope()

  -- Delete
  elseif action == 2 then
    local name = fn.input("Delete?")
    if name ~= "" then
      cmd("Cscope kill " .. name)
      cmd("silent! Cscope reset")
    end
    update_cscope_show()
    M.ReloadCscope()
  end
end

-- 顯示選單
local function show_menu()
  local options = {
    { label = "0) Gen", value = 0 },
    { label = "1) Add", value = 1 },
    { label = "2) Delete", value = 2 },
    { label = "q) Quit", value = -1 },
    { label = "F12) Auto add", value = -12 },
  }

  local db_info = fn.system("cat " .. cscope_show_file)
  print("Cscope DBs:\n" .. db_info .. "-----------")

  vim.ui.select(options, {
    prompt = "Select Cscope Action:",
    format_item = function(item)
      return "  " .. item.label
    end,
  }, function(choice)
    process_action(choice and choice.value or -1)
  end)
end

-- 主函式
function M.ReloadCscope()
  cmd("redraw!")
  update_cscope_show()
  switch_to_work_buf()
  show_menu()
end

-- 快捷鍵
vim.keymap.set("n", "<F12>", M.ReloadCscope, { noremap = true, silent = true })

return M
