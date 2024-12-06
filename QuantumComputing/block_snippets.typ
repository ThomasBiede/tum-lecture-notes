// icon color: material color 600
// background of the box: same column but 100
// https://materialui.co/colors

#let placeholder() = {
  figure(
    image("assets/images/placeholder.png", width: 50%),
    caption: []
  )
}

#let info_icon = read("assets/icons/info-circle.svg").replace(
  "#000000",
  "#1E88E5"
)

#let info = exp => {
  block(
  fill: rgb("#BBDEFB"),
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
  "#E53935"
)

#let warn = exp => {
  block(
  fill: rgb("#FFCDD2"),
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


#let question_icon = read("assets/icons/question-circle.svg").replace(
  "#000000",
  "#ffb300"
)

#let question = exp => {
  block(
  fill: rgb("#ffecb3"),
  inset: 8pt,
  radius: 3pt,
  grid(
    columns: (1fr, 25fr),
    gutter: 10pt,
    align: (left, left + horizon),
    image.decode(question_icon),
    exp
  )
)
}


#let example_icon = read("assets/icons/clipboard.svg").replace(
  "#000000",
  "#43a047"
)

#let example = exp => {
  block(
  fill: rgb("#c8e6c9"),
  inset: 8pt,
  radius: 3pt,
  grid(
    columns: (1fr, 25fr),
    gutter: 10pt,
    align: (left, left + horizon),
    image.decode(example_icon),
    exp
  )
)
}


#let recap_icon = read("assets/icons/recap.svg").replace(
  "#000000",
  "#546E7A"
)

#let recap = exp => {
  block(
  fill: rgb("#CFD8DC"),
  inset: 8pt,
  radius: 3pt,
  grid(
    columns: (1fr, 25fr),
    gutter: 10pt,
    align: (left, left + horizon),
    image.decode(recap_icon),
    exp
  )
)
}


#let goal_icon = read("assets/icons/goal.svg").replace(
  "#000000",
  "#C0CA33"
)

#let goal = exp => {
  block(
  fill: rgb("#F0F4C3"),
  inset: 8pt,
  radius: 3pt,
  grid(
    columns: (1fr, 25fr),
    gutter: 10pt,
    align: (left, left + horizon),
    image.decode(goal_icon),
    exp
  )
)
}