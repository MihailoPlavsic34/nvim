vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.t", "*.rules", "*.load" },
  callback = function()
    vim.bo.filetype = "perl"
  end,
})


vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.hcl"},
  callback = function()
    vim.bo.filetype = "terraform"
  end,
})

