---
name: Bug report
about: Report a bug or undesired or unexpected behaviour
labels: bug

---

<!---
This is just a convenient template for a bug report to make it easier for you to check that all the necessary information is included.
Please don't feel intimidated by this template (I know I always feel a bit weird when I encounter these templates).
Feel free to change the structure suggested below as you see fit or to discard it completely if you don't feel comfortable using it.
--->

**Describe the bug**
A clear and concise description of what the bug is about.

**To Reproduce**
Please include a short example document that reproduces the issue. Even if your issue is comprehensible without an example document, debugging and testing is greatly helped by such a document.

You can use the example `.bib` file [`biblatex-examples.bib`](https://github.com/plk/biblatex/blob/master/bibtex/bib/biblatex/biblatex-examples.bib) that comes as part of a `biblatex` installation if you need a few example bibliography items. If you want to (or need to) use your own entries, please include the relevant `.bib` items as well. An elegant way to do that is the `filecontents` environment, but if you don't feel comfortable using that you can just paste the entries separately.

Please make sure that the example reproduces the undesirable behaviour and is otherwise fully compilable. Please try to reproduce the bug with as little code as possible. Try to reproduce the issue with a single file. Avoid loading files, packages and classes that are not on [CTAN](https://ctan.org/) and remove unnecessary `\input` and `\include` statements.

See https://texfaq.org/FAQ-minxampl, https://www.dickimaw-books.com/latex/minexample/, http://www.minimalbeispiel.de/mini-en.html, https://tex.meta.stackexchange.com/q/228/35864, https://tex.meta.stackexchange.com/q/4407/35864

You can use the following 'template'
```latex
\documentclass[british]{article}
\usepackage[T1]{fontenc}
\usepackage{babel}
\usepackage{csquotes}

\usepackage[backend=biber, style=ext-authoryear]{biblatex}

\begin{filecontents}{\jobname.bib}
@book{elk,
  author    = {Anne Elk},
  title     = {A Theory on Brontosauruses},
  year      = {1972},
  publisher = {Monthy \& Co.},
  location  = {London},
}
\end{filecontents}
\addbibresource{\jobname.bib}
\addbibresource{biblatex-examples.bib}

\begin{document}
Lorem \autocite{sigfridsson,elk}

\printbibliography
\end{document}
```

**Expected behaviour**
A clear and concise description of what you expected to happen.

**Output**
If applicable, add screenshots of the output to help explain your problem.
If the `.log` file is relevant (for example if there are errors or warnings), please include it as well.

**Additional context**
Add any other context about the problem here.
