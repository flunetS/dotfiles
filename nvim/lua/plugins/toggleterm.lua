return {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = { "ToggleTerm" },
    keys = {
    {
        "<leader>tf",
        function()
        local count = vim.v.count1
        require("toggleterm").toggle(count, 0, LazyVim.root.get(), "float")
        end,
        desc = "ToggleTerm (float root_dir)",
    },
    {
        "<leader>th",
        function()
        local count = vim.v.count1
        require("toggleterm").toggle(count, 15, LazyVim.root.get(), "horizontal")
        end,
        desc = "ToggleTerm (horizontal root_dir)",
    },
    {
        "<leader>tv",
        function()
        local count = vim.v.count1
        require("toggleterm").toggle(count, vim.o.columns * 0.4, LazyVim.root.get(), "vertical")
        end,
        desc = "ToggleTerm (vertical root_dir)",
    },
    {
        "<leader>tn",
        "<cmd>ToggleTermSetName<cr>",
        desc = "Set term name",
    },
    {
        "<leader>ts",
        "<cmd>TermSelect<cr>",
        desc = "Select term",
    },
    {
        "<leader>tt",
        function()
        require("toggleterm").toggle(1, 100, LazyVim.root.get(), "tab")
        end,
        desc = "ToggleTerm (tab root_dir)",
    },
    {
        "<leader>tT",
        function()
        require("toggleterm").toggle(1, 100, vim.loop.cwd(), "tab")
        end,
        desc = "ToggleTerm (tab cwd_dir)",
    },
    },
    opts = {
    -- size can be a number or function which is passed the current terminal
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = [[<c-\>]],
        shell = "powershell",
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        -- shade_terminals = true,
        -- shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        -- start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
        -- persist_size = true,
        direction = "horizontal" or "vertical" or "window" or "float",
        close_on_exit = true, -- close the terminal window when the process exits

        start_in_insert = false,
        shade_terminals = false,
        auto_scroll = true,
        persist_size = false,
        
        float_opts = {
            border = "curved",
            winblend = 0,
        },

        on_create = function(term)
            vim.bo[term.bufnr].filetype = "terminal"
            local win
            
            vim.api.nvim_create_autocmd("BufEnter", {
                buffer = term.bufnr,
                callback = function()
                    win = vim.api.nvim_get_current_win()
                end,
            })

            vim.api.nvim_create_autocmd("TermClose", {
                buffer = term.bufnr,
                once = true,
                callback = function()
                    -- when leaving, open another terminal buffer in the same window
                    local terms = vim
                    .iter(vim.api.nvim_list_bufs())
                    :filter(function(buf)
                        return vim.bo[buf].buftype == "terminal" and buf ~= term.bufnr
                    end)
                    :totable()

                    local win_bufs = vim
                    .iter(vim.api.nvim_list_wins())
                    :map(vim.api.nvim_win_get_buf)
                    :fold({}, function(acc, v)
                        acc[v] = v
                        return acc
                    end)

                    local target
                    for _, t in ipairs(terms) do
                        -- fall back to the first term if no hidden terms are found
                        target = target or t
                        if win_bufs[t] == nil then
                            target = t -- use the first hidden term if found
                            break
                        end
                    end

                    if win and target and vim.api.nvim_buf_is_valid(target) then
                    vim.api.nvim_win_set_buf(win, target)
                    vim.api.nvim_create_autocmd("WinEnter", {
                        once = true,
                        callback = vim.schedule_wrap(function()
                            if win and vim.api.nvim_win_is_valid(win) then
                                vim.api.nvim_set_current_win(win)
                                win = nil
                            end
                        end),
                    })
                    end
                end,
            })
        end,
    },
}