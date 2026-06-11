require("ink")

-- Optimize WSL Clipboard via Windows Host Binary
local function configure_wsl_clipboard()
    -- Look for win32yank.exe in the standard Windows paths exposed to WSL
    local win32yank_path = vim.fn.exepath('win32yank.exe')
    
    -- If Windows path exposure is turned off, fallback to checking your C drive mount
    if win32yank_path == '' then
        win32yank_path = '/mnt/c/Program Files/Neovim/bin/win32yank.exe'
    end

    -- Explicitly tell Neovim to pipe text streams across the OS border using the binary
    vim.g.clipboard = {
        name = 'win32yank-wsl',
        copy = {
            ['+'] = win32yank_path .. ' -i --crlf',
            ['*'] = win32yank_path .. ' -i --crlf',
        },
        paste = {
            ['+'] = win32yank_path .. ' -o --lf',
            ['*'] = win32yank_path .. ' -o --lf',
        },
        cache_enabled = 0,
    }
end

-- Execute the clipboard optimization engine
configure_wsl_clipboard()

