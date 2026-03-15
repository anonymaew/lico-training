#import "@preview/polylux:0.4.0": *

#let presentation_theme(doc) = {
  set text(
    font: ("Inter", "Anuphan"),
    size: 20pt
  )
  show raw: set text(font: "JetBrains Mono", weight: "medium");

  show raw.where(block: false): box.with(fill: luma(216), inset: (x: 0.4em), outset: (y: 0.4em), radius: 0.3em)

  set page(paper:"presentation-16-9", fill: rgb("#f0f1f1"))

  show heading:it => {
    set text(fill: rgb("#1c75bc"),weight: "bold")

    box(inset: (y:0.5em))[
      #underline(stroke: 3pt + rgb("#f57520"), offset: 0.2em)[#it.body]
    ]
  }

  show footnote.entry: set text(size: 0.6em)

  doc
}
