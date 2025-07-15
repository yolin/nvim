require("cscope_maps").setup({
    disable_maps = false, 
    prefix = "<leader>s",
    -- cscope related defaults
    cscope = {
        -- location of cscope db file
        db_file = "~/CSCOPE/cscope.out",
        -- cscope executable
        exec = "cscope", -- "cscope" or "gtags-cscope"
        -- choose your fav picker
        picker = "quickfix", -- "telescope", "fzf-lua" or "quickfix"
        -- size of quickfix window
	qf_window_size = 5, -- any positive integer
        -- position of quickfix window
	qf_window_pos = "bottom", -- "bottom", "right", "left" or "top"
        -- "true" does not open picker for single result, just JUMP
        skip_picker_for_single_result = true, -- "false" or "true" quickfix只有一个结果时直接跳到文件
        -- these args are directly passed to "cscope -f <db_file> <args>"
        db_build_cmd_args = { "-bqkv" },
        -- statusline indicator, default is cscope executable
        statusline_indicator = nil,
        -- try to locate db_file in parent dir(s)
        project_rooter = {
            enable = false, -- "true" or "false"
            -- change cwd to where db_file is located
            change_cwd = false, -- "true" or "false"
        },
    }
})

