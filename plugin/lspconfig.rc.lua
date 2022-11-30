local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)

  -- -- format on save
  -- if client.server_capabilities.documentFormattingProvider then
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     group = vim.api.nvim_create_augroup("Format", { clear = true }),
  --     buffer = bufnr,
  --     callback = function() vim.lsp.buf.format() end
  --   })
  -- end

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = {noremap = true, silent = true}
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

local servers = {'julials', 'pyright', 'texlab'}
vim.cmd[[autocmd Filetype julia setlocal omnifunc=v:lua.vim.lsp.omnifunc]]

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup{
    on_attach = on_attach,
    cpatibilities = require('cmp_nvim_lsp').default_capabilities(protocol.make_client_capabilities())
  }
end

--vim.lsp.set_log_level("debug")
