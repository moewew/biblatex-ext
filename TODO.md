- ISO styles?
- Compatibility code?
  - version settings like KOMA or chemmacros
- Look into author-year verbose styles?
- Author name in full on first cite (name tracking)?
- series+number position
- more modular bib drivers
  - would be quite a shift away from the standard styles, so offer as option?
- compressed @set citations
  - would need option to back out of ...
  https://tex.stackexchange.com/a/416448/35864
- "subunit" or "superunit" punctuation?
  - See for example https://texwelt.de/wissen/fragen/22228/a/22233
  - But: What are the exact requirements here?
  - Implementation wise:
    - `\setunit` is good for the same punctuation mark in all positions,
      but it gets more involved as soon as several different types are involved,
      because `\setunit` overwrites the buffer.
    - `\printunit` would be an option for "superunits" because it persists in
      the buffer until the next `\printunit` and can't be overwritten by
      `\setunit`. `\printunit` would however have a knock-on effect requiring
      `\printunit`s in many (at least some) places where `\setunit` is fine now.
- \mkbibname... only for the 'primary' name of a source?
- in... names, see https://tex.stackexchange.com/q/216369/35864
  - This needs to be done carefully to not clash with in:editor
  - Rethink the names...: bookeditor?
- Test suite
- Less intrusive versioning
- blxextdoiapi for non-Lua engines with shell escape calling texlua?

- Link style names in doc
- Disable (or at least warn) introcite for verbose styles.