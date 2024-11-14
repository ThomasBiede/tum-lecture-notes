#import "@preview/rubber-article:0.1.0": *

#show: article.with()

#maketitle(
  title: "Advanced Algorithms: A student written book",
  authors: (
    "Thomas Biedermann",
  ),
  date: datetime.today().display("[day padding:none]. [month repr:long] [year]"),
)
#pagebreak()

#outline()

#pagebreak()

#include "./chapters/00_introduction.typ"

#pagebreak()
#include "./chapters/01_divide_and_conquer.typ"

#pagebreak()
