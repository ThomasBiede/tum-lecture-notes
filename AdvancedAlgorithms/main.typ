#import "@preview/ilm:1.3.1": *

// #show: article.with()

// #maketitle(
//   title: "Advanced Algorithms: A student written book",
//   authors: (
//     "Thomas Biedermann",
//   ),
//   date: datetime.today().display("[day padding:none]. [month repr:long] [year]"),
// )
#set text(lang: "en")

#show: ilm.with(
  title: [Advanced Algorithms\ A student written book],
  author: "Thomas Biedermann",
  date: datetime.today(),
  abstract: [],
  preface: [
    #align(center + horizon)[]
  ],
  bibliography: bibliography("bibliography/books.bib"),
  figure-index: (enabled: false),
  table-index: (enabled: false),
  listing-index: (enabled: false),
  chapter-pagebreak: true,
  paper-size: "a4",
  date-format: "[day padding:none]. [month repr:long] [year]",
)

#include "./chapters/00_introduction.typ"
#include "./chapters/01_divide_and_conquer.typ"
#include "./chapters/02_algebraic_operations.typ"
#include "./chapters/03_randomized_algorithms.typ"
#include "./chapters/04_treaps.typ"
#include "./chapters/05_minimum_cuts.typ"
#include "./chapters/06_suffix_trees.typ"