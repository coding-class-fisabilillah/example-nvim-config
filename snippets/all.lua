return {
  s(
    { trig = "indi", desc = "make individual" },
    fmta(
      [[
      0 @X<>@ INDI
          1 NAME <> /<>/
              2 TYPE <>
              2 SURN <>
          1 SEX <>
          1 BIRT
              2 DATE <> <> <>
              2 PLAC <>
              2 ADDR <>
          1 FAMS @X<>@
      ]],
      {
        i(1, "id"),
        i(2, "NAME"),
        i(3, "SURENAME"),
        i(4, "BIRTH"),
        rep(4),
        i(5, "M/F"),
        i(6, "DD"),
        i(7, "MON"),
        i(8, "YEAR"),
        i(9, "PLACE"),
        i(10, "ADDRESS"),
        i(0, "FAMS"),
      }
    )
  ),
  s(
    { trig = "fam", desc = "make family" },
    fmta(
      [[
      0 @X<>@ FAM
          1 HUSB @X<>@
          1 WIFE @X<>@
          1 CHIL @X<>@
          1 MARR
              2 TYPE <>
              2 DATE <> <> <>
              2 HUSB
                  3 AGE <>
              2 WIFE
                  3 AGE <>
                2 PLAC <>
      ]],
      {
        i(1, "id"),
        i(2, "HUSB"),
        i(3, "WIFE"),
        i(4, "CHIL"),
        i(5, "RELIGIOUS"),
        i(6, "DD"),
        i(7, "MON"),
        i(8, "YEAR"),
        i(9, "HUSB AGE"),
        i(10, "WIFE AGE"),
        i(0, "PLAC"),
      }
    )
  ),
  s(
    { trig = "tange", desc = "alamat tangerang" },
    t("Jl. Putri Sima V No. 7 Kelurahan Uwung Jaya Kecamatan Cibodas Kota Tangerang")
  ),
  s({ trig = "jogja", desc = "alamat jogja" }, t("Grojogan 001/000 Tamanan Banguntapan Bantul Yogyakarta")),
}
