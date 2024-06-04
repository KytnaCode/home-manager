local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

-- Go Snippets {{{
ls.add_snippets("go", {
  s("main", {
    t({ "func main() {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("phello", {
    t('println("Hello world!")'),
  }),

  s("fmtp", {
    t("fmt."),
    c(1, {
      t("Println"),
      t("Printf"),
      t("Sprintln"),
      t("Sprintf"),
    }),
    t('("'),
    i(0),
    t('")'),
  }),

  s("cTimeout", {
    t("context.WithTimeout("),
    i(0),
    t(", "),
    i(1),
  }),

  s("ctxTimeout", {
    t("ctx, cancel := context.WithTimeout("),
    i(1),
    t(", "),
    i(0),
  }),

  s("cBackground", {
    t("context.Background()"),
  }),

  s("ctxBackground", {
    t("ctx := context.Background()"),
  }),

  s("tSec", {
    t("time.Second*"),
    i(0),
  }),
})
