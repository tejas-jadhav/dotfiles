vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup{
    renderer = {
        indent_markers = {
            enable = true
        }
    }
}

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<Cr>')

