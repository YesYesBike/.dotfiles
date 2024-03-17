local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local snippets, autosnippets = {}, {}








local shbang = s({trig = "sh", hidden = "true" }, fmt([[
#!/bin/perl
use utf8;
use strict;
use warnings;
use diagnostics;
use feature qw/
    say{}
/;

{}
]], {i(1), i(2)})
)
table.insert(snippets, shbang)


local my_var = s({ trig = "fjf", regTrig = "true", hidden = "false" },
fmt([[
    {}{}{}{}{}
]], {
    c(1, {t"", t"my ", t"our "}),
    c(2, {t"$", t"@", t"%"}),
    i(3, "NAME"),
    c(4, {t"", {t"[", i(1, "number"), t"]"},
         {t"{", i(1, "something"), t"}"}, }),
    c(5, {
        {
            t" = ",
            i(1, "EXPRESSION"), t";",
        },
        t"",
        {
            t" = (", t({"","\t"}),
            i(1, "#HASH"),
            t({"", ");"}),
        },
    }),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(autosnippets, my_var)


--local q_bracket = s({ trig = "q/", regTrig = "true", hidden = "true" },
--fmt([[
--    {}{}{}{}
--]], {
--    c(2, {t"q", t"qq", t"qw", t"qx", }),
--    c(3, {t"/", t"#", t"!", t"~" }),
--    --c(2, {t"/", t"[", t"{", t"(", t"<", t"#", t"*", }),
--    i(1, " Something "),
--    rep(3),
--}, {
--    delimiters = "{}",
--    --Other Options
--}))
--table.insert(autosnippets, q_bracket)


local q_bracket = s({ trig = "q([qwx]?)(%p)", regTrig = "true", hidden = "true" },
{
    t"q", f(function (_,snip)
        return snip.captures[1]
    end),
    f(function (_,snip)
        local fix_opposite_bracket = {
            [')'] = '(',
            ['}'] = '{',
            [']'] = '[',
            ['>'] = '<',
        }
        local pair = fix_opposite_bracket[snip.captures[2]]
        if(pair) then
            return pair
        else
            return snip.captures[2]
        end
    end),
    i(1, "something"),
    f(function (_,snip)
        local match_bracket = {
            ['('] = ')',
            ['{'] = '}',
            ['['] = ']',
            ['<'] = '>',
        }
        local pair = match_bracket[snip.captures[2]]
        if(pair) then
            return pair
        else
            return snip.captures[2]
        end
    end)
})
table.insert(autosnippets, q_bracket)


local subroutine = s({ trig = "sub", regTrig = "true", hidden = "true" },
fmt([[
    sub <>{
        <>
    }
]], {
    i(1, "NAME"),
    i(2, "#Function"),
}, {
    delimiters = "<>",
    --Other Options
}))
table.insert(snippets, subroutine)


local foreach = s({ trig = "fe", regTrig = "true", hidden = "true" },
fmt([[
    foreach <>(<>)
]], {
    c(1, { t"", {
            c(1, { t"", t"my ", t"our " } ),
            t"$",
            i(2, "var_name"),
        },
    }),
    c(2, { t"@_", {
            t"@",
            i(1, "something"),
        },
        i(1, "something"),
    }),
}, {
    delimiters = "<>",
    --Other Options
}))
table.insert(snippets, foreach)


local dollar_underscore = s({ trig = "du", regTrig = "true", hidden = "true" },
fmt([[
    $_
]], {
    --*insert_node*
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, dollar_underscore)


local amper_underscore = s({ trig = "au", regTrig = "true", hidden = "true" },
fmt([[
    @_
]], {
    --*insert_node*
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, amper_underscore)


local STD = s({ trig = "ss", regTrig = "true", hidden = "true" },
fmt([[
    <>
]], {
    c(1, { t"STDIN", t"STDOUT", t"STDERR", }),
}, {
    delimiters = "<>",
    --Other Options
}))
table.insert(snippets, STD)


local big_arrow = s({ trig = "ba", regTrig = "true", hidden = "true" },
fmt([[
    {} => {}
]], {
    i(1, "KEY"), i(2, "'value'"),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(snippets, big_arrow)


local double_slash = s({ trig = "//", regTrig = "true", hidden = "true" },
fmt([[
    {}
]], {
    c(1, {
        {t'/', i(1,'something'), t'/'},
        {t'//'}
    }),
}, {
    delimiters = "{}",
    --Other Options
}))
table.insert(autosnippets, double_slash)


local backslash_char = s({ trig = "\\([gp])", regTrig = "true", hidden = "true" },
{
    t"\\",
    f(function (_,snip)
        return snip.captures[1]
    end),
    c(1, { {t"{", i(1, 'something'), t"}" },
           { t"" },
    }),
})
table.insert(autosnippets, backslash_char)


return snippets, autosnippets
