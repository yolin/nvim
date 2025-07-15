local M = {}

local M = {}

local fn = vim.fn
local cmd = vim.cmd

vim.g.CscopeGenDBRoot = fn.expand("~/CSCOPE/")
vim.g.CscopeShowFile = fn.expand("~/CSCOPE/cscope_show.txt")
vim.g.CscopeGenIndex = 1

-- 更新 Cscope DB 顯示
local function update_cscope_show()
  cmd("redir! > " .. vim.g.CscopeShowFile)
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

-- 遞迴處理選單動作
local function process_action(action)
  if action == nil or action == -1 then
    cmd("redraw!")
    return
  end

  local current_dir = fn.getcwd()
  local i = 1

  if action == 2 or action == 5 or action == -12 then
    if vim.g.CscopeGenIndex == 1 or vim.g.CscopeGenIndex == 4 or action == -12 then
      local path = (vim.g.CscopeGenIndex == 4 or action == -12)
        and current_dir
        or fn.input("Add?", fn.expand("%:p:h"), "file")

      local db_path = vim.g.CscopeGenDBRoot .. path .. "/"
      fn.system("mkdir -p " .. db_path)
      fn.system("touch " .. db_path .. "compile_commands.json")
      fn.chdir(db_path)

      while i < 15 do
        if fn.filereadable(db_path .. "cscope.out") == 1 then
          cmd("silent! Cscope db add " .. db_path)
          break
        else
          db_path = db_path .. "/../"
          fn.chdir("..")
          i = i + 1
        end
      end

      fn.chdir(current_dir)
      update_cscope_show()
      M.ReloadCscope() -- 再次呼叫

    elseif vim.g.CscopeGenIndex == 0 then
      local gentemp = fn.input("Generate?", fn.expand("%:p:h"), "file")
      -- fn.system("~/.nvim/gencs.sh " .. gentemp)
      local script = fn.expand("~/.nvim/gencs.sh")
      if fn.filereadable(script) == 1 then
        fn.system(script .. " " .. gentemp)
      else
      vim.notify("找不到 gencs.sh 腳本: " .. script, vim.log.levels.ERROR)
        end
      local db = vim.g.CscopeGenDBRoot .. gentemp .. "/"
      cmd("silent! Cscope db add " .. db)
      update_cscope_show()
      M.ReloadCscope()

    elseif vim.g.CscopeGenIndex == 2 then
      local name = fn.input("Delete?")
      if name ~= "" then
        cmd("Cscope kill " .. name)
        cmd("silent! Cscope reset")
      end
      update_cscope_show()
      M.ReloadCscope()

    elseif vim.g.CscopeGenIndex == 3 then
      cmd("redraw!")
      return
    end
  else
    cmd("redraw!")
    return
  end
end

-- 顯示選單並處理
local function show_menu()
  local options = {
    { label = "0) Gen", value = 0 },
    { label = "1) Add", value = 1 },
    { label = "2) Delete", value = 2 },
    { label = "q) Quit", value = -1 },
    { label = "F12) Auto add", value = -12 },
  }

  local db_info = fn.system("cat " .. vim.g.CscopeShowFile)
  print("Cscope DBs:\n" .. db_info .. "-----------")

  vim.ui.select(options, {
    prompt = "Select Cscope Action:",
    format_item = function(item)
      return ((vim.g.CscopeGenIndex == item.value) and "> " or "  ") .. item.label
    end,
  }, function(choice)
    if choice then
      vim.g.CscopeGenIndex = choice.value
      process_action(choice.value)
    else
      process_action(-1)
    end
  end)
end

-- 主函式
function M.ReloadCscope()
  cmd("redraw!")
  update_cscope_show()
  switch_to_work_buf()
  show_menu()
end

-- 綁定快捷鍵
vim.keymap.set("n", "<F12>", M.ReloadCscope, { noremap = true, silent = true })

return M
