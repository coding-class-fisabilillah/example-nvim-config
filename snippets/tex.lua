local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s(
    { trig = "ara", dscr = "Expands 'tii' into LaTeX's textit{} command." },
    fmta(
      [[
      \begin{RLtext}
      <>
      \end{RLtext}
      ]],
      {
        d(1, get_visual),
      }
    )
  ),
  s(
    { trig = "bold", dscr = "Make it Bold" },
    fmta("\\textbf{<>}\n", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "ital", dscr = "Make it Italic" },
    fmta("\\textit{<>}\n", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "booklet", desc = "make latex booklet template" },
    fmta(
      [[
      \documentclass[12pt, a4paper]{article}
      \title{<>}
      \author{<>}
      \date{\today}
      \usepackage[print]{booklet}
      \setpdftargetpages
      \usepackage{arabtex}
      \usepackage{utf8}
      \usepackage[skip=10pt plus1pt, indent=40pt]{parskip}
      \setcode{utf8}
      \begin{document}
      \begin{Large}
      \maketitle
      <>
      \end{Large}
      \end{document}
      ]],
      {
        i(1, "title"),
        i(2, "Sulthan A. Karimov"),
        i(0, "isi konten"),
      }
    )
  ),
}
