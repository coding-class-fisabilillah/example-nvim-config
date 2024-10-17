return {
  s(
    { trig = "bad", desc = "insert badge" },
    fmta("[![<>](<>)](<>)", {
      i(1, "name"),
      i(2, "badge source"),
      rep(1),
    })
  ),
  s(
    { trig = "badg", desc = "insert badge" },
    fmta("[![<>](<>)](<>)", {
      i(1, "name"),
      i(2, "badge source"),
      i(0, "badge link"),
    })
  ),
}
