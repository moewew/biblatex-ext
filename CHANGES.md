# Version <version> (<date>)
- Fixed indentation with `introcite=label`.
- **Incompatible change** The lengths for `introcite=label` now work like
  `\labelwidth` and `\labelsep` in all other lists.
  `\introcitewidth` controls the maximum length of the label, while
  `\introcitesep` controls the separation between the end of the label and
  the beginning of the reference.
  The total indentation is now `\introcitewidth`+`\introcitesep` and not
  only `\introcitewidth` as before.

# Version 0.1a (2018-03-20)
- Fixed inner cite delims for authoryear/authortitle and their ibid versions.
- Fixed delimiters for `\smartcite`.
  `\smartcite` really behaves like `\parencite` and `\footcite` now.
  This needed some trickery to get the delimiter context right.

# Version 0.1 (2018-03-18)
- First public release.
