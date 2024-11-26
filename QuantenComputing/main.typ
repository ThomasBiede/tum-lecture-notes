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
  title: [Quantum Computing\ A student written book],
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
#include "./chapters/01_qubit.typ"
#include "./chapters/02_single_qubit_gates.typ"