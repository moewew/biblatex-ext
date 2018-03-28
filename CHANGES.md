# Version 0.2 (2018-03-28)
See https://github.com/moewew/biblatex-ext/compare/v0.1a...v0.2
- Fixed indentation with `introcite=label`.
- **Incompatible change** The lengths for `introcite=label` now work like
  `\labelwidth` and `\labelsep` in all other lists.
  `\introcitewidth` controls the maximum length of the label, while
  `\introcitesep` controls the separation between the end of the label and
  the beginning of the reference.
  The total indentation is now `\introcitewidth`+`\introcitesep` and not
  only `\introcitewidth` as before.
- **Incompatible change** `\maintitletitledelim` is now truly the punctuation
  between the `maintitle` and `(book)title` field.
  What was formerly `\maintitledelim` is now `\voltitledelim`.

# Version 0.1a (2018-03-20)
See https://github.com/moewew/biblatex-ext/compare/v0.1...v0.1a
- Fixed inner cite delims for authoryear/authortitle and their ibid versions.
- Fixed delimiters for `\smartcite`.
  `\smartcite` really behaves like `\parencite` and `\footcite` now.
  This needed some trickery to get the delimiter context right.

# Version 0.1 (2018-03-18)
- First public release.
