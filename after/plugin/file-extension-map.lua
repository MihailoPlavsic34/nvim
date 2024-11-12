vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.t", "*.rules" },
  callback = function()
    vim.bo.filetype = "perl"
  end,
})

