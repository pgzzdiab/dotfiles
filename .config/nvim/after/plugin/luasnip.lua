local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
-- local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local date = function() return {os.date('%Y-%m-%d')} end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            func(date, {}),
        }),
    },
})
ls.add_snippets("python", {
      snip("fmt2", fmt([[
		foo({1}, {3}) {{
			return {2} * {4}
		}}
		]], {i(1, "x"), rep(1), i(2, "y"), rep(2)}
		)
      ),


      snip("prop", fmt([[

        @property
        def {}(self):
          """
          Basic getter
          """
          return self._{}

        @{}.setter
        @beartype
        def {}(self, in_{}):
          self._{} = in_{}
        ]], {i(1, "attribute"), rep(1), rep(1), rep(1), rep(1), rep(1), rep(1)})
      ),

  }
)
