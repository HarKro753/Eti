---
name: automaten
description: Zeichnet endliche Automaten, NFAs, DFAs und GNFAs in LaTeX/TikZ im Stil von Hausaufgabe3/hausaufgabe.tex.
---

# Automaten

Nutze diesen Skill, wenn in ETI-Hausaufgaben Automaten in LaTeX gezeichnet,
ueberarbeitet oder an den Stil aus `Hausaufgabe3/hausaufgabe.tex` angepasst werden sollen.

## Grundsetup

Ergaenze im LaTeX-Dokument diese Pakete und TikZ-Bibliotheken:

```latex
\usepackage{tikz}
\usetikzlibrary{automata,positioning,arrows.meta}
```

Nutze diese globalen TikZ-Einstellungen:

```latex
\tikzset{
    ->,>=Stealth,
    node distance=2.5cm,
    every state/.style={thick,minimum size=1cm},
    initial text={},
}
```

- Setze Automaten immer in eine `center`-Umgebung.
- Zeichne Zustaende mit `state`, Startzustaende mit `initial` und akzeptierende
  Zustaende mit `accepting`.
- Benenne Knoten konsistent als `(q0)`, `(q1)`, `(q2)` usw.
- Beschrifte sichtbare Zustaende als `$q_0$`, `$q_1$`, `$q_2$` usw.
- Nutze `right=of ...`, `left=of ...`, `above=of ...` und `below=of ...`
  statt absoluter Koordinaten, solange das Layout dadurch klar bleibt.
- Passe `node distance` lokal im `tikzpicture` an, wenn der Automat sonst zu eng wird.

## Kantenstil

- Zeichne Kanten mit einer gemeinsamen `\path`-Anweisung.
- Setze Kantenbeschriftungen in den Mathemodus, z. B. `node[above] {$0$}`.
- Nutze `\varepsilon` fuer Epsilon-Uebergaenge und `\emptyset` fuer nicht vorhandene
  GNFA-Kanten.
- Nutze `\cup` fuer Vereinigungen, nicht ein ausgeschriebenes `oder`.
- Verwende `bend left=<zahl>` und `bend right=<zahl>` fuer Gegenkanten oder lange
  Diagonalen.
- Verwende `loop above`, `loop below`, `loop left` oder `loop right` fuer Schleifen.
- Nutze `sloped`, wenn eine diagonale Beschriftung der Kante folgen soll.
- Bei langen regulaeren Ausdruecken in Kantenbeschriftungen nutze `\scriptstyle`.

Beispiel fuer Kanten:

```latex
\path (q0) edge node[above] {$0$} (q1)
      (q1) edge[bend left=18] node[above] {$1$} (q2)
      (q2) edge[bend left=18] node[below] {$0$} (q1)
      (q2) edge[loop below] node {$1$} ();
```

## DFA- oder NFA-Vorlage

Nutze diese Vorlage fuer normale endliche Automaten:

```latex
\begin{center}
\begin{tikzpicture}[node distance=2.5cm]
    \node[state, initial] (q0) {$q_0$};
    \node[state, right=of q0] (q1) {$q_1$};
    \node[state, accepting, right=of q1] (q2) {$q_2$};

    \path (q0) edge[loop above] node {$0$} ()
          (q0) edge node[above] {$1$} (q1)
          (q1) edge[bend left=18] node[above] {$0$} (q2)
          (q2) edge[bend left=18] node[below] {$1$} (q1)
          (q2) edge[loop above] node {$0,1$} ();
\end{tikzpicture}
\end{center}
```

## Epsilon-NFA-Vorlage

Nutze fuer Epsilon-Uebergaenge immer `\varepsilon`:

```latex
\begin{center}
\begin{tikzpicture}[node distance=2.6cm]
    \node[state, initial] (q0) {$q_0$};
    \node[state, right=of q0] (q1) {$q_1$};
    \node[state, accepting, right=of q1] (q2) {$q_2$};

    \path (q0) edge node[above] {$\varepsilon$} (q1)
          (q1) edge[loop above] node {$0$} ()
          (q1) edge node[above] {$1$} (q2);
\end{tikzpicture}
\end{center}
```

## GNFA-Stil

Bei GNFAs aus Zustandselimination:

- Schreibe vor der Zeichnung kurz: `Alle nicht eingezeichneten Kanten haben Beschriftung $\emptyset$.`
- Zeichne nur die relevanten Kanten; nicht jede `\emptyset`-Kante muss sichtbar sein.
- Nutze Start- und Endzustand wie in Hausaufgabe3 als `initial` und `accepting`.
- Benenne Zwischenschritte sichtbar, z. B. `\textbf{Start-GNFA.}`,
  `\textbf{Eliminiere $q_1$.}`.
- Halte den Ausdruck auf einer Kante algebraisch sauber:
  Konkatenation ohne Punkt, Stern als `^*`, Vereinigung als `\cup`.
- Wenn eine Beschriftung breit wird, erhoehe `node distance` oder setze
  `\scriptstyle` in der Beschriftung.

Vorlage fuer einen GNFA:

```latex
\medskip
\textbf{Start-GNFA.}

\begin{center}
\begin{tikzpicture}[node distance=2.5cm and 2.6cm]
    \node[state, initial] (q0) {$q_0$};
    \node[state, right=of q0] (q1) {$q_1$};
    \node[state, right=of q1] (q2) {$q_2$};
    \node[state, below=of q2] (q3) {$q_3$};
    \node[state, accepting, above=of q2] (q4) {$q_4$};

    \path (q0) edge node[above] {$\varepsilon$} (q1)
          (q1) edge node[above] {$0$} (q2)
          (q1) edge node[above,sloped] {$\varepsilon$} (q4)
          (q2) edge[bend left=18] node[below] {$1$} (q1)
          (q2) edge node[right] {$11$} (q3)
          (q3) edge[bend left=14] node[below,sloped] {$00$} (q1);
\end{tikzpicture}
\end{center}
```

Vorlage fuer eine lange Abschlusskante:

```latex
\begin{center}
\begin{tikzpicture}[node distance=7.6cm]
    \node[state, initial] (q0) {$q_0$};
    \node[state, accepting, right=of q0] (q4) {$q_4$};

    \path (q0) edge node[above] {$\scriptstyle
        (\varepsilon\cup0(10)^*1)\cup0(10)^*11
        (000(10)^*11)^*(00\cup000(10)^*1)$} (q4);
\end{tikzpicture}
\end{center}
```

## Layoutregeln gegen Ueberschneidungen

- Erhoehe zuerst `node distance`, bevor Kantenbeschriftungen stark verkleinert werden.
- Nutze `bend left=14` bis `bend left=25` fuer gekruemmte Kanten.
- Platziere Kantenbeschriftungen gezielt mit `above`, `below`, `left`, `right` und
  bei diagonalen Kanten oft mit `sloped`.
- Bei mehreren Kanten zwischen denselben Zustaenden immer entgegengesetzte Biegungen
  oder verschiedene Labelpositionen verwenden.
- Akzeptierende Zustaende nicht zu dicht an langen Kantenbeschriftungen platzieren.
- Wenn ein Automat horizontal zu breit wird, ordne einzelne Zustaende mit `above=of`
  oder `below=of` an.

## Einbindung in ETI-Loesungen

- Kombiniere diesen Skill mit dem Skill `formatierung`, wenn eine ganze Hausaufgabe
  oder Praesenzaufgabe gesetzt wird.
- Aufgabenstellungen kommen in `\taskbox`.
- Definitionen und Verfahren zur Konstruktion oder Elimination kommen in `\methodbox`.
- Nach laengeren Konstruktionen das Ergebnis als Display-Math angeben, bei finalen
  regulaeren Ausdruecken optional mit `\boxed{...}`.

## Kompilierung

Pruefe geaenderte LaTeX-Dateien mit dem vorhandenen Makefile:

```sh
make <pfad/zur/datei.pdf>
```

Beispiel:

```sh
make Hausaufgabe3/hausaufgabe.pdf
```
