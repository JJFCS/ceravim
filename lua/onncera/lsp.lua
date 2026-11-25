
--** TODO
-- move the options into the options file?
--**


-- LOAD AND REGISTER PER-SERVER LSP OVERRIDES
vim.lsp.config("lua_ls", require("onncera.lsp.lua_ls"))
vim.lsp.config("clangd", require("onncera.lsp.clangd"))

-- SOME LSP & DIAGNOSTIC SETTINGS
vim.diagnostic.config({ virtual_text = true , update_in_insert = true })


