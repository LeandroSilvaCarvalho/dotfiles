local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt

-- Helper: convert filename (ex: my-component) to PascalCase (MyComponent)
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
    'rfc',
    fmt(
      [[
    import React from "react";

    const {} = () => {{
      return (
        <div>
          {}
        </div>
      );
    }}

    export default {};
  ]],
      {
        f(get_component_name),
        i(1, '<p>Hello World</p>'),
        f(get_component_name),
      }
    )
  ),
}
