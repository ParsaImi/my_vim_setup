-- Function to toggle terminal
local Terminal = {}
local terminal_bufnr = nil
local terminal_window = nil

function Terminal.toggle()
    -- If terminal doesn't exist, create it
    if terminal_bufnr == nil or not vim.api.nvim_buf_is_valid(terminal_bufnr) then
        vim.cmd('new | wincmd J | resize 15')
        terminal_window = vim.api.nvim_get_current_win()
        terminal_bufnr = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_win_set_buf(terminal_window, terminal_bufnr)
        vim.fn.termopen(vim.o.shell)
        vim.cmd('startinsert')
    else
        -- Terminal exists, toggle its visibility
        local win = vim.fn.win_findbuf(terminal_bufnr)[1]
        if win == nil then
            -- Terminal is visible, show it
            vim.cmd('new | wincmd J | resize 15')
            terminal_window = vim.api.nvim_get_current_win()
            vim.api.nvim_win_set_buf(terminal_window, terminal_bufnr)
            vim.cmd('startinsert')
        else
            -- Terminal is visible, hide it
            vim.api.nvim_win_hide(win)
        end
    end
end

-- Set up the keymapping for normal mode
vim.keymap.set('n', '<leader>t', Terminal.toggle, { noremap = true, silent = true })

-- Add terminal mode mappings
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Optional: Add these for better terminal experience
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>h', [[<C-\><C-n><C-W>h]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>j', [[<C-\><C-n><C-W>j]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>k', [[<C-\><C-n><C-W>k]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>l', [[<C-\><C-n><C-W>l]], { noremap = true, silent = true })
