return {
  s(
    { trig = "snip", desc = "make the snippet" },
    fmta(
      [[
      s(
        { trig = "<>", desc = "<>" },
        fmta(
          <>
          {
            i(<>, "tasks"),
          }
        )
      ),
      ]],
      {
        i(1, "trigger"),
        i(2, "desc"),
        i(3, "content"),
        i(4, "input"),
      }
    )
  ),
}
