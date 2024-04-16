require'bufferline'.setup({
    options = {
        style_preset = require'bufferline'.style_preset.minimal,
        offsets = {{filetype = "NvimTree", text = "Nvim Tree", text_align = "center"}},
    },

})


vim.cmd[[
nnoremap <silent><TAB> :BufferLineCycleNext<CR>
nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
]]
