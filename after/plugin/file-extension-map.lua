vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.t", "*.rules", "*.load" },
  callback = function()
    vim.bo.filetype = "perl"
  end,
})

