local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s(
    { trig = "mark", dscr = "mark current selection" },
    fmt("<mark style=background-color:{};> {} </mark>", {
      i(1, "lemon"),
      d(2, get_visual),
    })
  ),
  s(
    { trig = "post", desc = "create new blog post" },
    fmta(
      [[
        ---
        title: <>
        description: <>
        date: <>
        author: <>
        categories:
          - <>
        draft: <>
        show: <>
        execute:
          freeze: <>
          cache: <>
        ---
      ]],
      {
        i(1, "title"),
        i(2, "description"),
        f(function()
          return os.date("%m/%d/%Y")
        end),
        i(3, "Sulthan A. Karimov"),
        i(4, "categories"),
        i(5, "true"),
        i(6, "true"),
        i(7, "auto"),
        i(8, "true"),
      }
    )
  ),
  s(
    { trig = "modu", desc = "create new module for class" },
    fmta(
      [[
        ---
        title: <>
        #description: <>
        #date: <>
        #author: <>
        categories: 
          - <>
        draft: <>
        show: <>
        execute:
          freeze: <>
          cache: <>
        ---
      ]],
      {
        i(1, "title"),
        i(2, "description"),
        f(function()
          return os.date("%m/%d/%Y")
        end),
        i(3, "Sulthan A. Karimov"),
        i(4, ""),
        i(5, "false"),
        i(6, "true"),
        i(7, "auto"),
        i(8, "true"),
      }
    )
  ),
  s(
    { trig = "diagram", desc = "make a mermaid.js diagram" },
    fmt("```{mermaid}\n{}\n\t{}[{}] --> {}[{}]\n```", {
      mermaid = t({ "{mermaid}" }),
      i(1, "flowchart"),
      i(2, "name A"),
      i(3, "node A"),
      i(4, "name B"),
      i(5, "node B"),
    })
  ),
}
