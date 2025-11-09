local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt

-- Convert filename (e.g., my-component) to PascalCase (MyComponent)
local function to_pascal_case(str)
  return str
    :gsub('[-_](.)', function(c)
      return c:upper()
    end)
    :gsub('^(.)', function(c)
      return c:upper()
    end)
end

local function get_component_name()
  local filename = vim.fn.expand '%:t:r'
  return to_pascal_case(filename)
end

return {
  s(
    'rfcp',
    fmt(
      [[
    import React from "react";

    interface Props {{
      {}
    }}

    const {} = ({{ {} }}: Props) => {{
      return (
        <div>
          {}
        </div>
      );
    }}

    export default {};
  ]],
      {
        i(1, 'title: string'),
        f(get_component_name),
        i(2, 'title'),
        i(3, '<h1>{title}</h1>'),
        f(get_component_name),
      }
    )
  ),
}
