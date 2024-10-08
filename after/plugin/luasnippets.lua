local ls = require("luasnip")
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

ls.config.set_config{
    history = true,
	-- Update more often, :h events for more info.
	update_events = "TextChanged,TextChangedI",
    enable_autosnippets = true,
}

require("luasnip.loaders.from_vscode").lazy_load()

local session = require("luasnip.session")

local env = session.config.snip_env
local s = env["s"]
local t = env["t"]
local i = env["i"]
local parse = env["parse"]

return {
  s({ trig = "co", name = "Constant", dscr = "Insert a constant" }, {
    t("const "), i(1, "name"), t(" = "), i(2, "value")
  }),

  s({ trig = "pf", name = "Formatted Print", dscr = "Insert a formatted print statement" }, {
    t("fmt.Printf(\"%#v\\n\", "), i(1, "value"), t(")")
  }),

  parse({ trig = "ife", name = "If Err", dscr = "Insert a basic if err not nil statement" }, [[
  if err != nil {
    return err
  }
  ]]),

  parse({ trig = "ifel", name = "If Err Log Fatal", dscr = "Insert a basic if err not nil statement with log.Fatal" }, [[
  if err != nil {
    log.Fatal(err)
  }
  ]]),

  s({ trig = "ifew", name = "If Err Wrapped", dscr = "Insert a if err not nil statement with wrapped error" }, {
    t("if err != nil {"),
    t({ "", "  return fmt.Errorf(\"failed to " }),
    i(1, "message"),
    t(": %w\", err)"),
    t({ "", "}" })
  }),

  parse({ trig = "ma", name = "Main Package", dscr = "Basic main package structure" }, [[
  package main

  import "fmt"

  func main() {
    fmt.Printf("%+v\n", "...")
  }
  ]]),
}
