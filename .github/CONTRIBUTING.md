# Contributing to `biblatex-ext`

Thank you for contributing to `biblatex-ext`.
This page contains a few pointers that you might find useful.

When you open an issue you will be asked to choose between a bug report and a feature suggestion,
that is just to pre-populate the editor with a 'template'/structure that can help you with your report.
Feel free to throw away that template or open a non-templated issue directly at https://github.com/moewew/biblatex-ext/issues/new

## Bugs

You can report bugs at the ['Issues' tab](https://github.com/moewew/biblatex-ext/issues).
Please make sure that the bugs you report here are bugs of the `biblatex-ext` styles and not problems in the `biblatex` core.
If you can reproduce the same issue with a standard style, it is probably better to report the issue at the [`biblatex` bugtracker](https://github.com/plk/biblatex/issues).
If you are unsure where to report, pick whichever feel right. It is always possible to report the issue elsewhere if it turns out the culprit is not where it was initially expected.

Please include an accurate description of the undesired/unexpected *and* the desired/expected behaviour.
Screenshots and log files are often very helpful, so if you can, please include those as well where they make sense.

### Example documents

Bug reports and questions about LaTeX almost always need a short example document that reproduces the issue.
Even if the example document is not strictly necessary to understand the issue, it greatly helps with finding the error and testing possible fixes.
There are many resources out there that can help you create a good example document (often called *minimal working example* or short *MWE*)

* https://texfaq.org/FAQ-minxampl
* https://www.dickimaw-books.com/latex/minexample/
* http://www.minimalbeispiel.de/mini-en.html
* https://tex.meta.stackexchange.com/q/228/35864
* https://tex.meta.stackexchange.com/q/4407/35864

The main point is that the example document should be as small as possible while still reproducing the issue.
It should be portable and compilable on other people's machines, so it should ideally only load classes, packages and files available on [CTAN](https://ctan.org/) and should be self-contained as far as possible.
Avoid `\include` and `\input` as far as possible and include anything that is necessary directly in the main `.tex` file and try not to spread it out over several files.
For bibliographies it is important that the `.bib` entries used in the example are available:
Either use the file [`biblatex-examples.bib`](https://github.com/plk/biblatex/blob/master/bibtex/bib/biblatex/biblatex-examples.bib), which comes with every `biblatex` installation and contains many examples that might be helpful, or share a few entries from your `.bib` file (the `filecontents` environment can be very useful to make a file truly self-contained, but if you don't feel comfortable using it you can just paste the example entries separately).

## Feature suggestions

Suggestions for enhancements and new features are always very welcome.
As in the case of bugs, please consider whether the feature request may be more suited for the `biblatex` core instead of `biblatex-ext`.
Naturally that decision is much more subjective than whether or not a bug is a core or style bug, so do pick whichever you think is more suitable.

Please keep in mind that the main aim of this project is to provide styles compatible with the standard `biblatex` styles that offer a simple way to do some customisations that are otherwise more tedious.
That is a very vague aim and leaves a lot of wiggle room.

Please describe what feature or other suggestion you have in mind.
If you can share a bit about the backgrounds of your idea and the use cases you have in mind that would be very much appreciated.

If possible please include an example document that can be used to illustrate and test ideas.
Even if there is 'nothing to see at the moment' a short example of the intended use cases can be extremely helpful during development, it can also help understand and motivate the feature suggestion better.

## Pull requests

Pull requests are very welcome, but please keep in mind that the project goals are vague and that not every suggestion 'feels right'.
Please document your changes and motivate them briefly in the pull request description.

If possible please submit pull requests with medium-sized, logical commits (not too long so that I lose track of what is going on, but not so short that a single pull request consists of dozens of commits).
If you can rebase your branch upon `master` before you submit the pull request that would be appreciated.
Pull requests with many commits may be squashed before merging.
