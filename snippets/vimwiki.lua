return {
  s(
    { trig = "tasks", desc = "create tasks for the project" },
    fmta(
      [[
      # <> || pro:<>
      ## IDEAS | +IDEAS
      ## URGENT | tag:NEXT +PENDING
      ## TODO | -NEXT -IDEAS +PENDING
      ## DONE | +COMPLETED
      ]],
      {
        i(1, "tasks"),
        i(2, "project name"),
      }
    )
  ),
}
