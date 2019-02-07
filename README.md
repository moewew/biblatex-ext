biblatex-ext - Extended biblatex standard styles
================================================

The `biblatex-ext` bundle provides styles that slightly extend the standard
styles that ship with `biblatex`. The styles offered in this bundle provide
a simple interface to change some of the stylistic decisions made in the
standard styles. At the same time they stay as close to their standard
counterparts as possible, so that most customisation methods can be applied
here as well.

The main motivation was to offer `biblatex` styles that place the editor of
`@incollection` works before the `booktitle`, yet remain close to the standard
styles in overall look and feel and customisability. The code adjustments
required for this are not particularly complicated once you get the hang of it,
but a stable and clean solution requires a rewrite of the bibliography driver,
easily amassing hundred lines of code in the preamble. Some contributed styles
already place the editor before the `booktitle` (`biblatex-apa` comes to mind),
but you may not want to buy into all the other changes that come with choosing
one of them. Styles written for the sole purpose of following a particular
style guide are not always easily modified and may have to go to great lengths
to implement the requirements of the style guide.
The styles of this bundle are intended to be a solid base for further
customisations.

`biblatex-ext` has an extended version `ext-<style>` for each of `biblatex`'s
standard styles. The bundle consists of the following files

- The base file `ext-standard.bbx`
- The auxiliary file `ext-biblatex-aux.def`
- The `alphabetic` style family
  - `ext-alphabetic.bbx` and `ext-alphabetic.cbx`
  - `ext-alphabetic-verb.bbx` and `ext-alphabetic-verb.cbx`
- The `authoryear`/`authortitle` helper file `ext-dashed-common.bbx`
- The `authortitle` style family
  - `ext-authortitle-common.bbx`
  - `ext-authortitle.bbx` and `ext-authortitle.cbx`
  - `ext-authortitle-comp.bbx` and `ext-authortitle-comp.cbx`
  - `ext-authortitle-ibid.bbx` and `ext-authortitle-ibid.cbx`
  - `ext-authortitle-icomp.bbx` and `ext-authortitle-icomp.cbx`
  - `ext-authortitle-terse.bbx` and `ext-authortitle-terse.cbx`
  - `ext-authortitle-tcomp.bbx` and `ext-authortitle-tcomp.cbx`
  - `ext-authortitle-ticomp.bbx` and `ext-authortitle-ticomp.cbx`
- The `authoryear` style family
  - `ext-authoryear-common.bbx`
  - `ext-authoryear.bbx` and `ext-authoryear.cbx`
  - `ext-authoryear-comp.bbx` and `ext-authoryear-comp.cbx`
  - `ext-authoryear-ecomp.bbx` and `ext-authoryear-ecomp.cbx`
  - `ext-authoryear-ibid.bbx` and `ext-authoryear-ibid.cbx`
  - `ext-authoryear-icomp.bbx` and `ext-authoryear-icomp.cbx`
  - `ext-authoryear-iecomp.bbx` and `ext-authoryear-iecomp.cbx`
  - `ext-authoryear-terse.bbx` and `ext-authoryear-terse.cbx`
  - `ext-authoryear-tcomp.bbx` and `ext-authoryear-tcomp.cbx`
  - `ext-authoryear-tecomp.bbx` and `ext-authoryear-tecomp.cbx`
  - `ext-authoryear-ticomp.bbx` and `ext-authoryear-ticomp.cbx`
  - `ext-authoryear-tiecomp.bbx` and `ext-authoryear-tiecomp.cbx`
- The `numeric` style family
  - `ext-numeric.bbx` and `ext-numeric.cbx`
  - `ext-numeric-comp.bbx` and `ext-numeric-comp.cbx`
  - `ext-numeric-verb.bbx` and `ext-numeric-verb.cbx`
- The `verbose` style family
  - `ext-verbose.bbx` and `ext-verbose.cbx`
  - `ext-verbose-ibid.bbx` and `ext-verbose-ibid.cbx`
  - `ext-verbose-note.bbx` and `ext-verbose-note.cbx`
  - `ext-verbose-inote.bbx` and `ext-verbose-inote.cbx`
  - `ext-verbose-trad1.bbx` and `ext-verbose-trad1.cbx`
  - `ext-verbose-trad2.bbx` and `ext-verbose-trad2.cbx`
  - `ext-verbose-trad3.bbx` and `ext-verbose-trad3.cbx`
- The package for tabular bibliographies `biblatex-ext-tabular.sty`
- The package `biblatex-ext-oa.sty`
  - The support package `biblatex-ext-oa-doiapi.sty`
    - The Lua module `blxextdoiapi.lua`
  - The `pict2e` symbol package `biblatex-ext-oasymb-pict2e.sty`
  - The TikZ symbol package `biblatex-ext-oasymb-tikz.sty`
  - The `l3draw` symbol package `biblatex-ext-oasymb-l3draw.sty`

All of these files (including `blxextdoiapi.lua`) are runtime files that
need to be installed where LaTeX can find them.
It is highly recommended to install this bundle via your TeX distribution
and not manually. See the documentation for more installation instructions.

## Licence

Copyright 2017-2019 Moritz Wemheuer

This work consists of the `.bbx`, `.cbx`, `.def`, `.sty` and `.lua` files
mentioned above.

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License (LPPL), either
version 1.3c of this license or (at your option) any later
version. The latest version of this license is at
http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

This work has the LPPL maintenance status 'maintained'.

The Current Maintainer of the work is Moritz Wemheuer <mwemheu@gmail.com>.

The files `README.md`, `CHANGES.md`, `biblatex-ext.pdf`, `biblatex-ext.tex`
and `biblatex-ext-examples.bib` in their entirety need not be considered
part of the work for the purpose of the complete distribution clause of
the LPPL (v1.3c, Clause 2). All conditions of the LPPL still apply to these
files as well, in particular the files are provided 'as is' with no warranty.
So each of the files can be considered as a separate work licensed
under the LPPL, if you will.
This means that you may distribute the bundle without documentation
(or the documentation without the rest of the bundle).
It is, however, strongly advised that at least `README.md` and the PDF version
of the documentation, `biblatex-ext.pdf`, are supplied alongside the work.


Please report bugs at https://github.com/moewew/biblatex-ext or via email.
Suggestions for improvements and feature request are also very welcome.

The bundle is available on CTAN https://www.ctan.org/pkg/biblatex-ext
and is included in MikTeX and TeX live 2018 or later.
The development version can be found on GitHub
https://github.com/moewew/biblatex-ext
