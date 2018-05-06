# Version <version> (<date>)
See https://github.com/moewew/biblatex-ext/compare/v0.1a...v<version>
- Added `titlecase:<titletype>` field formats for finer control over the title
  casing. The standard styles have the catch-all format `titlecase`. This
  bundle now has `titlecase:title`, `titlecase:booktitle`,
  `titlecase:maintitle`, `titlecase:issuetitle` and `titlecase:journaltitle`.
- Various documentation improvements.
- Added toggle `bbx:introcite:plain:keeprelated` to choose not to suppress the
  `introcite=plain` cite label for default related entries (other
  `relatedtype`s may already suppress the cite label without chance of getting
  it back).
- Added `\jourvoldelim`, `\jourserdelim` and `\servoldelim`.

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
