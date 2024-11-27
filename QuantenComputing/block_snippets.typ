#let info_icon = read("assets/icons/info-circle.svg").replace(
  "#000000",
  "#0D47A1"
)

#let info = exp => {
  block(
  fill: rgb("#cce3f5"),
  inset: 8pt,
  radius: 3pt,
  grid(
    columns: (1fr, 25fr),
    gutter: 10pt,
    align: (left, left + horizon),
    image.decode(info_icon),
    exp
  )
)
}


#let warn_icon = read("assets/icons/warning-circle.svg").replace(
  "#080341",
  "#C62828"
)

#let warn = exp => {
  block(
  fill: rgb("#fdebec"),
  inset: 8pt,
  radius: 3pt,
  grid(
    columns: (1fr, 25fr),
    gutter: 10pt,
    align: (left, left + horizon),
    image.decode(warn_icon),
    exp
  )
)
}

#let placeholder() = {
  figure(
    image("assets/images/placeholder.png", width: 50%),
    caption: []
  )
}