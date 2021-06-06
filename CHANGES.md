# Changelog

## Unreleased

See <https://github.com/moewew/biblatex-ext/compare/v0.12b...HEAD>

### Fixed
- Fixed title printing for related entries in `authoryear` style family
  <https://github.com/moewew/biblatex-ext/issues/22>.

## Version 0.12b (2021-04-22)

See <https://github.com/moewew/biblatex-ext/compare/v0.12a...v0.12b>

### Fixed
- Fixed default `refcontext` assignment in tabular bibliography
  <https://github.com/moewew/biblatex-ext/issues/21>.

## Version 0.12a (2021-04-20)

See <https://github.com/moewew/biblatex-ext/compare/v0.12...v0.12a>

### Fixed
- Fixed `env` option for `\printbibtabular`.

## Version 0.12 (2021-02-27)

See <https://github.com/moewew/biblatex-ext/compare/v0.11...v0.12>

### Added
- `\UndeclareCiteDelims{<cite command>}` to delete inner and outer
  delimiters at the same time.

### Fixed
- Clarified in the documentation that `innamebeforetitle` does not apply
  to `@inbook` entries
  (cf. also <https://github.com/moewew/biblatex-ext/issues/20>).

## Version 0.11 (2021-02-19)

See <https://github.com/moewew/biblatex-ext/compare/v0.10...v0.11>

### Changed
- Synced with 2021-02-18 changes in `l3draw`/`l3color`.

## Version 0.10 (2021-01-01)

See <https://github.com/moewew/biblatex-ext/compare/v0.9...v0.10>

### Changed
- Updated for `biblatex` v3.16 (2020/12/31).
  This is now the recommended `biblatex` version.
- Separate out common code for verbose citation styles.
- Warn about `introcite=plain` with verbose citation styles.

## Version 0.9 (2020-08-21)

See <https://github.com/moewew/biblatex-ext/compare/v0.8g...v0.9>

### Changed
- Updated for `biblatex` v3.15 (2020/08/19).
  This is now the recommended `biblatex` version.

## Version 0.8g (2020-08-09)

See <https://github.com/moewew/biblatex-ext/compare/v0.8f...v0.8g>

### Fixed
- Synced with 2020-08-07 `l3draw`/`l3color` changes.
  Some backwards compatibility is in place.

## Version 0.8f (2020-05-09)

See <https://github.com/moewew/biblatex-ext/compare/v0.8e...v0.8f>

### Fixed
- Fixed inner cite delimiters for `\footcitetext` in `authoryear`
  and `authortitle` (not `comp`) styles
  (<https://github.com/moewew/biblatex-ext/issues/19>).


## Version 0.8e (2020-05-05)

See <https://github.com/moewew/biblatex-ext/compare/v0.8d...v0.8e>

### Fixed
- Fixed `bbx:introcite` definition for `ext-numeric-comp`.
- Fixed issue with `labelprefix` in `\printbibtabular`
  (<https://github.com/moewew/biblatex-ext/pull/18>).

### Changed
- `biblatex-ext-tabular` now checks for the recommended `biblatex`
  version and aborts if loaded before `biblatex`.


## Version 0.8d (2020-03-15)

See <https://github.com/moewew/biblatex-ext/compare/v0.8c...v0.8d>

### Fixed
- Avoid an error about the bibmacro `labeltitle` being undefined
  in some contexts.
  Define and use `tabular:labeltitle` in `tabular:sortname`.
  If available `tabular:labeltitle` is just `labeltitle`,
  if not we recreate the definition from `authoryear.bbx`.


## Version 0.8c (2019-11-30)

See <https://github.com/moewew/biblatex-ext/compare/v0.8b...v0.8c>

### Changed
- The Unpaywall API queries don't include a sanity check for
  the DOI to DOI.org any more, since DOI.org only serves HTTPS
  now and Lua(TeX) doesn't easily do SSL.
  Fortunately, there were no user-level or even author-level
  macros documented that would expose the answer of the DOI.org
  query, so we can simply drop that function.


## Version 0.8b (2019-11-01)

See <https://github.com/moewew/biblatex-ext/compare/v0.8a...v0.8b>

### Fixed
- Call to removed option in `ext-verbose-trad2`.


## Version 0.8a (2019-10-31)

See <https://github.com/moewew/biblatex-ext/compare/v0.8...v0.8a>

### Fixed
- The default value of `\servoldelim` was documented as
  and should be `\jourvoldelim`.
  Previous versions had `\addspace` (the default value of
  `\jourvoldelim`) instead.
- Reenabled visible space in documentation.
- Typo in `ext-authoryear-tiecomp.cbx`.


## Version 0.8 (2019-08-25)
See <https://github.com/moewew/biblatex-ext/compare/v0.7a...v0.8>

### Added
- `\AtIntrocite` to customise initialisation code for introcite
  citations.

### Changed
- Require `biblatex` v3.13 (some backwards compatiblity is in place).


## Version 0.7a (2019-04-04)
See <https://github.com/moewew/biblatex-ext/compare/v0.7...v0.7a>

### Fixed
- Bug in the `env` option to `\printbibtabular`. The old version would
  check for a *bib* environment as defined with `\defbibenvironment`
  and not a *bibtabular* environment as defined with `\defbibtabular`.
  Hence, the option would throw an error if there was no bib
  environment of the same name as the *bibtabular* environment passed
  to `env`.

### Changed
- `biblatex-ext-doiapi` warns about missing email just a tad earlier.


## Version 0.7 (2019-02-08)
See <https://github.com/moewew/biblatex-ext/compare/v0.6b...v0.7>

### Added
- Outer citation delimiters for `\supercite`.
- `biblatex-ext-oasymb-pict2e` for open access symbols drawn in
  `pict2e`. The package can be used via the `symbolpackage=pict2e`
  option to `biblatex-ext-oa` and provides a light-weight alternative
  to the the symbols drawn with TikZ or the experimental `l3draw`
  (of LaTeX3 fame).
- `biblatex-ext-oasymb-l3draw` for open access symbols drawn in
  `l3draw`. The package can be used via the `symbolpackage=l3draw`
  option to `biblatex-ext-oa` and provides a LaTeX3 alternative to the
  the symbols drawn with TikZ or `pict2e`.
- `\LoadOASymbolPackage`, `\DeclareOASymbol` to load an open access
  symbol package and set the symbol.
- `symbolpackage` and `symbol` options for `biblatex-ext-oa`
  corresponding to `\LoadOASymbolPackage` and `\DeclareOASymbol`,
  respectively.

### Changed
- **Incompatible change** Renamed `biblatex-ext-oa-tikzsymbols` to
  `biblatex-ext-oasymb-tikz` for consistency.
  No serious impact for end users is expected since the package should
  normally not be used as a stand-alone package.
  It should be loaded via `biblatex-ext-oa`.

### Deprecated
- Deprecate `\DefineTikZOASymbol` in favour of the more universal
  `\DeclareOASymbol`.
- Deprecate `\LoadTikZOASymbol` in favour of the more universal
  `\LoadOASymbolPackage`.
- Deprecate the `biblatex-ext-oa` option `tikzsymbol` in favour of the
  new options `symbolpackage` and `symbol`.


## Version 0.6b (2019-01-11)
See <https://github.com/moewew/biblatex-ext/compare/v0.6a...v0.6b>

### Changed
- `blxextdoiapi.lua` now returns the module as a table.

### Fixed
- Issue loading `socket.url` with LuaLaTeX 1.07 (TeX Live 2018)
  (<https://github.com/moewew/biblatex-ext/issues/17>)


## Version 0.6a (2019-01-04)
See <https://github.com/moewew/biblatex-ext/compare/v0.6...v0.6a>

### Changed
- Only patch bibmacros in `biblatex-ext-oa`. This avoids redefinitions,
  which could clear out custom definitions.
- Use socket.url's URL escape/encode function in blxextdoiapi.lua.

### Fixed
- A bug in deprecation handling.


## Version 0.6 (2018-11-23)
See <https://github.com/moewew/biblatex-ext/compare/v0.5a...v0.6>

### Added
- `\titleaddonpunct`
- The package `biblatex-ext-oa` for open access symbols and open access
  'detection'.
  See <https://tex.stackexchange.com/q/459449/>.
  - The default detection relies on explicit configuration for all URL,
    DOI and eprint-like and data in the `.bib` file.
  - There is a Lua module that queries Unpaywall.org by DOI to find
    open access info.
  - A support package provides two open access symbols drawn with TikZ.

### Changed
- `biblatex` 3.12 is now recommended.
- Synced `mergedate` code with `biblatex` 3.12
  (<https://github.com/plk/biblatex/pull/810>,
   <https://github.com/plk/biblatex/issues/752>).
- Made `introcite` and `dashed` option available on per-entry and
  per-type basis. (<https://github.com/moewew/biblatex-ext/issues/13>)
  - `introcite=label` needs support of the bibliography environment,
    so it is not officially supported if its is not set globally.
  - Simplify code to set options at all three levels at the same time.


## Version 0.5a (2018-10-09)
See <https://github.com/moewew/biblatex-ext/compare/v0.5...v0.5a>

### Fixed
- Bug with `\footcites` and `\footcitetexts` in `ext-authoryear.cbx`
  (<https://github.com/moewew/biblatex-ext/issues/12>)


## Version 0.5 (2018-10-02)
See <https://github.com/moewew/biblatex-ext/compare/v0.4...v0.5>

### Added
- New `ecomp` style family. The styles of that family compress lists of
  extradate fields.
- First implementation of a tabular bibliography based on Audrey's
  answer to <https://tex.stackexchange.com/q/71088/35864>
- Outer cite delimiters for `\footcite`.
- `version` and `pagetotal` bibmacros.

### Changed
- Use `version` and `pagetotal` macros instead of `\printfield`.


## Version 0.4 (2018-06-10)
See <https://github.com/moewew/biblatex-ext/compare/v0.3...v0.4>

### Changed
- Renamed `\DeclareOuterCiteDelim` and friends to
  `\DeclareOuterCiteDelims`, backwards compatibility for most of this
  change should be available.
- **Incompatible change** Renamed `\bbx@cite@inxref` to `\bbx@xrefcite`
  for consistency with other citation commands.
  There are is no compatibility code set up for this change.
- **Incompatible change** The "virtual" citation command
  `\bbx:introcite` is now called `\bbx@introcite`. ("Virtual" because
  the appearance of the introcite label can be changed mostly as if it
  were produced by this citation command, but it isn't really produced
  by a citation command at all.)
  This means that the delimiter context, inner citation delimiters and
  wrapper field format are renamed from `bbx:introcite` to
  `bbx@introcite`.
  There is no compatibility code set up for this change, but warnings
  are issued if some typical uses of the old names are detected.
  This means that people using older code should be warned, but still
  need to take action themselves. Fortunately the `introcite` feature
  is quite a prominent bit of the bibliography, so people will probably
  realise wrong output sooner than later.
- Renamed option `citeinxref` to `citexref`. Please use the new name.
  Backwards compatibility is in place.


## Version 0.3 (2018-06-04)
See <https://github.com/moewew/biblatex-ext/compare/v0.2...v0.3>

### Added
- `titlecase:<titletype>` field formats for finer control over the
  title casing. The standard styles have the catch-all format
  `titlecase`.
  This bundle now has `titlecase:title`, `titlecase:booktitle`,
  `titlecase:maintitle`, `titlecase:issuetitle` and
  `titlecase:journaltitle`.
- Toggle `bbx:introcite:plain:keeprelated` to choose not to suppress
  the `introcite=plain` cite label for default related entries (other
  `relatedtype`s may already suppress the cite label without chance of
  getting it back).
- `\jourvoldelim`, `\jourserdelim` and `\servoldelim`.

### Changed
- Turned `extradateonlycompcitedelim` into a context-sensitive
  delimiter.
- Various documentation improvements.


## Version 0.2 (2018-03-28)
See <https://github.com/moewew/biblatex-ext/compare/v0.1a...v0.2>

### Added
- `\voltitledelim`

### Changed
- **Incompatible change** The lengths for `introcite=label` now work
  like `\labelwidth` and `\labelsep` in all other lists.
  `\introcitewidth` controls the maximum length of the label, while
  `\introcitesep` controls the separation between the end of the label
  and the beginning of the reference.
  The total indentation is now `\introcitewidth`+`\introcitesep` and
  not only `\introcitewidth` as before.
- **Incompatible change** `\maintitletitledelim` is now truly the
  punctuation between the `maintitle` and `(book)title` field.
  What was formerly `\maintitledelim` is now `\voltitledelim`.
- Renamed `bbx:cite:intro` to `bbx:introcite`.
- Sync with upstream `biblatex` to add `type` and `event+venue+date` to
  `@unpublished`

### Fixed
- Indentation with `introcite=label`.
- Bug in `@online` printing `organization+location+date`.


## Version 0.1a (2018-03-20)
See <https://github.com/moewew/biblatex-ext/compare/v0.1...v0.1a>

### Fixed
- Inner cite delims for `authoryear`/`authortitle` and their `-ibid`
  versions.
- Delimiters for `\smartcite`.
  `\smartcite` really behaves like `\parencite` and `\footcite` now.
  This needed some trickery to get the delimiter context right.


## Version 0.1 (2018-03-18)
- First public release.
