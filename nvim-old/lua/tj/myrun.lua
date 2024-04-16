-- Define a function to execute commands based on file extension
 function Run_command_by_extension(mode)
    local file_path = vim.fn.expand('%:p')
    local file_directory = vim.fn.expand('%:p:h')
    local file_extension = vim.fn.expand('%:e')
    local cmd = ""

    if (mode == "i") then FormatSaveInsert() end
    if (mode == "n") then FormatSaveNormal() end

    -- Check if inp.txt exists in the same folder
    local inp_file = file_directory .. '/inp.txt'
    local inp_argument = vim.fn.filereadable(inp_file) == 1 and '< ' .. inp_file or ''

    if file_extension == "cpp" then
        cmd = "g++ " .. file_path .. " -o " .. file_directory .. "/a.out && " .. file_directory .. "/a.out " .. inp_argument
    elseif file_extension == "c" then
        cmd = "gcc " .. file_path .. " -o " .. file_directory .. "/a.out && " .. file_directory .. "/a.out " .. inp_argument
    elseif file_extension == "js" then
        cmd = "node " .. file_path
    elseif file_extension == "py" then
        cmd = "python3 " .. file_path
    -- Add more conditions for other file types as needed
    else
        print("Unsupported file type")
        return
    end

    -- Execute the command using TermExec from toggleterm
    require('toggleterm').exec(cmd)
end

-- Map F10 to save and run the function in insert mode
vim.api.nvim_set_keymap('i', '<F10>', '<Esc>:w<CR>:lua Run_command_by_extension("i")<CR>', { noremap = true, silent = true })

-- Map F10 to run the function in normal mode
vim.api.nvim_set_keymap('n', '<F10>', ':lua Run_command_by_extension("n")<CR>', { noremap = true, silent = true })

