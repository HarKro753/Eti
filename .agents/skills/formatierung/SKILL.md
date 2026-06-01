---
name: formatierung
description: Formatiert ETI-Hausaufgaben in LaTeX im Stil von Hausaufgabe3/hausaufgabe.tex.
---

# Formatierung

Nutze diesen Skill, wenn ETI-Hausaufgaben oder Praesenzaufgaben in diesem Repository erstellt,
ueberarbeitet oder an den bestehenden Abgabestil angepasst werden sollen.

## Grundstruktur

- Verwende `article` mit `a4paper,12pt`.
- Nutze die Pakete `babel` mit `ngerman`, `inputenc` mit `utf8`, `fontenc` mit `T1`,
  `amsmath`, `amssymb` und bei Automaten `tikz`.
- Setze bei TikZ-Automaten die Bibliotheken `automata`, `positioning` und `arrows.meta`.
- Aktiviere im Dokument `\raggedright` und `\setlength{\parindent}{0pt}`.
- Erzeuge den sichtbaren Titel manuell mit `{\LARGE\bfseries ...\par}` statt `\maketitle`.
- Trenne den Titelbereich mit `\vspace{2em}` vom Inhalt.
- Verwende `\section*{Aufgabe X.Y}` fuer Hauptaufgaben und bei Teilaufgaben
  `\subsection*{...}`.

## Wiederkehrende Boxen

Definiere und nutze diese Box-Makros im Dokument, wenn Aufgaben erklaert oder eingeordnet werden:

```latex
\newcommand{\methodbox}[1]{%
\medskip
\noindent\fbox{%
    \begin{minipage}{0.94\linewidth}
    \textbf{Methodik / Definition.}\par\smallskip
    \small
    #1
    \end{minipage}%
}
\medskip\par
}

\newcommand{\examplebox}[1]{%
\medskip
\noindent\fbox{%
    \begin{minipage}{0.94\linewidth}
    \textbf{Beispiele.}\par\smallskip
    \small
    #1
    \end{minipage}%
}
\medskip\par
}

\newcommand{\taskbox}[1]{%
\medskip
\noindent\fbox{%
    \begin{minipage}{0.94\linewidth}
    \textbf{Aufgabenstellung.}\par\smallskip
    \small
    #1
    \end{minipage}%
}
\medskip\par
}
```

- Setze die Aufgabenstellung direkt nach der jeweiligen Aufgabenueberschrift in `\taskbox`.
- Setze Definitionen, Beweisschemata und zentrale Verfahren in `\methodbox`.
- Setze konkrete Beispiele, Gegenbeispiele oder kleine Tabellen in `\examplebox`.

## Mathematischer Stil

- Schreibe Definitionen erst informell und danach, falls sinnvoll, formal als Display-Math.
- Nutze klare Zwischensaetze wie `Wir zeigen ...`, `Angenommen ...`, `Betrachte ...`
  und `Folglich ...`.
- Verwende `\medskip` vor neuen gedanklichen Abschnitten.
- Hebe Fallunterscheidungen mit `\textbf{Fall 1: ...}` und `\textbf{Fall 2: ...}` hervor.
- Nutze `enumerate` fuer mehrstufige Beweise, besonders beim Pumping-Lemma.
- Schreibe wichtige Endergebnisse als Display-Math; bei finalen Ausdruecken optional mit `\boxed{...}`.
- Halte Variablen und Operatoren sauber in Mathemodus, z. B. `$w\in\{0,1\}^*$`,
  `\operatorname{val}(w)` und `L(a^*)`.
- Verwende `\varepsilon` fuer das leere Wort und `\emptyset` fuer die leere Sprache.

## TikZ-Automaten

Nutze diese TikZ-Grundeinstellungen:

```latex
\tikzset{
    ->,>=Stealth,
    node distance=2.5cm,
    every state/.style={thick,minimum size=1cm},
    initial text={},
}
```

- Setze Automaten in eine `center`-Umgebung.
- Verwende `state`, `initial` und `accepting` fuer Zustandsknoten.
- Benenne Knoten konsistent, z. B. `(q0)`, `(q1)`, `(q2)`.
- Beschrifte Kanten mit Mathemodus, z. B. `node[above] {$0$}`.
- Nutze `bend left`, `bend right`, `loop below`, `sloped` und angepasste
  `node distance`-Werte, wenn dadurch Ueberschneidungen vermieden werden.
- Bei langen Kantenbeschriftungen kann `\scriptstyle` in der Beschriftung genutzt werden.

## Sprache und Ton

- Schreibe auf Deutsch, sachlich und nachvollziehbar.
- Erklaere Loesungen so, dass die Methode sichtbar wird, nicht nur das Ergebnis.
- Fuehre bei formalen Beweisen die entscheidende Widerspruchsstelle explizit aus.
- Verwende kurze Absatze und vermeide dichte Textbloecke ohne mathematische Struktur.

## Kompilierung

- Pruefe LaTeX-Dateien nach Aenderungen mit dem vorhandenen Makefile:

```sh
make <pfad/zur/datei.pdf>
```

- Beispiel:

```sh
make Hausaufgabe3/hausaufgabe.pdf
```

- Halte Build-Artefakte aus dem Quelltext heraus; das Makefile nutzt `.latex-build`.
