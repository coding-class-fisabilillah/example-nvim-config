return {
  s(
    { trig = "post", desc = "create new blog post" },
    fmta(
      [[
        ---
        title: <>
        description: <>
        date: <>
        author: <>
        categories: [<>]
        draft: <>
        show: <>
        freeze: <>
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
        i(7, "true"),
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
        categories: [<>]
        draft: <>
        show: <>
        freeze: <>
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
        i(7, "true"),
      }
    )
  ),
}
