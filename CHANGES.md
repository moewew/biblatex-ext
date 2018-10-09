# Version 0.5a (2018-10-09)
See https://github.com/moewew/biblatex-ext/compare/v0.5...v0.5a
- Fixed a bug with `\footcites` and `\footcitetexts` in `ext-authoryear.cbx`
  https://github.com/moewew/biblatex-ext/issues/12

# Version v0.5 (2018-10-02)
See https://github.com/moewew/biblatex-ext/compare/v0.4...v0.5
- Added the `ecomp` style family. The styles of that family compress lists of
  extradate fields.
- Added outer cite delimiters for `\footcite`.
- Added `version` and `pagetotal` bibmacro.
- First implementation of a tabular bibliography based on Audrey's answer to
  https://tex.stackexchange.com/q/71088/35864

# Version 0.4 (2018-06-10)
See https://github.com/moewew/biblatex-ext/compare/v0.3...v0.4
- Renamed `\DeclareOuterCiteDelim` and friends to `\DeclareOuterCiteDelims`,
  backwards compatibility for most of this change should be available.
- **Incompatible change** Renamed the cite command `\bbx@cite@inxref` to
  `\bbx@xrefcite` for consistency with other citation commands.
  There are is no compatibility code set up for this change.
- **Incompatible change** The "virtual" citation command `\bbx:introcite`
  is now called `\bbx@introcite`. ("Virtual" because the appearance of the
  introcite label can be changed mostly as if it were produced by this citation
  command, but it isn't really produced by a citation command at all.)
  This means that the delimiter context, inner citation delimiters and wrapper
  field format are renamed from `bbx:introcite` to `bbx@introcite`.
  There is no compatibility code set up for this change, but warnings are
  issued if some typical uses of the old names are detected. This means that
  people using older code should be warned, but still need to take action
  themselves. Fortunately the introcite feature is quite a prominent bit of
  the bibliography, so people will probably realise wrong output sooner than
  later.
- Renamed option `citeinxref` to `citexref`. Please use the new name.
  Backwards compatibility is in place.

# Version 0.3 (2018-06-04)
See https://github.com/moewew/biblatex-ext/compare/v0.2...v0.3
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
