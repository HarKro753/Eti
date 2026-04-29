# ETI Blatt 1

## Setup

Install a TeX distribution (e.g. TeX Live):

```bash
# macOS
brew install --cask mactex
```

## Initialize a new LaTeX project

Create a `.tex` file with this minimal boilerplate:

```latex
\documentclass[a4paper,12pt]{article}
\usepackage[ngerman]{babel}
\usepackage[utf8]{inputenc}
\usepackage{amsmath,amssymb}
\usepackage{tikz}
\usetikzlibrary{automata,positioning,arrows.meta}

\title{Titel}
\author{}
\date{}

\begin{document}
\maketitle

% Inhalt hier

\end{document}
```

## Compile

```bash
pdflatex loesung.tex
```

## TikZ Automata Library

The finite state machines are drawn with TikZ. The required packages are already included in `loesung.tex`:

```latex
\usepackage{tikz}
\usetikzlibrary{automata,positioning,arrows.meta}
```

These libraries are part of the standard TikZ distribution and require no additional installation.
