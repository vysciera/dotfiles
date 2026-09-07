local map = vim.keymap.set

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Easier window movement
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Keep selection while indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move selected lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- ------------------------------------------------------------
-- LSP
-- ------------------------------------------------------------

map("n", "gd", vim.lsp.buf.definition, {
  desc = "Go to definition",
})

map("n", "gD", vim.lsp.buf.declaration, {
  desc = "Go to declaration",
})

map("n", "gr", vim.lsp.buf.references, {
  desc = "References",
})

map("n", "gi", vim.lsp.buf.implementation, {
  desc = "Go to implementation",
})

map("n", "K", vim.lsp.buf.hover, {
  desc = "Hover documentation",
})

map("n", "<leader>rn", vim.lsp.buf.rename, {
  desc = "Rename symbol",
})

map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
  desc = "Code action",
})

map("n", "<leader>f", function()
  vim.lsp.buf.format({
    async = true,
  })
end, {
  desc = "Format buffer",
})

map("n", "[d", function()
  vim.diagnostic.jump({
    count = -1,
    float = true,
  })
end, {
  desc = "Previous diagnostic",
})

map("n", "]d", function()
  vim.diagnostic.jump({
    count = 1,
    float = true,
  })
end, {
  desc = "Next diagnostic",
})

map("n", "<leader>d", vim.diagnostic.open_float, {
  desc = "Diagnostic details",
})
