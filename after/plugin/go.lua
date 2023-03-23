require 'go'.setup({
  goimport = 'gopls', -- if set to 'gopls' will use golsp format
  gofmt = 'gopls', -- if set to gopls will use golsp format
  max_line_len = 120,
  tag_transform = false,
  test_dir = '',
  comment_placeholder = ' ',
  lsp_cfg = true, -- false: use your own lspconfig
  lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- use on_attach from go.nvim
  dap_debug = true,
})

local protocol = require'vim.lsp.protocol'

vim.cmd("autocmd FileType go nmap <Leader>gc :lua require('go.comment').gen()")
vim.cmd("autocmd FileType go nmap <Leader>ge :GoIfErr<CR>")
vim.cmd("autocmd FileType go nmap <Leader>gtf :GoTestFunc<CR>")
vim.cmd("autocmd FileType go nmap <Leader><Tab> :GoAlt<CR>")
