#!/usr/bin/env sh

# This script is used for testing using Travis-CI
# It is intended to work on their VM set up: Ubuntu 16.04 LTS
# As such, the nature of the system is hard-coded
# A minimal current TL is installed adding only the packages that are
# required

# See if there is a cached verson of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
echo "PATH=/tmp/texlive/bin/x86_64-linux:$PATH" >> $GITHUB_ENV

if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl --profile=../installsupport/texlive.profile

  cd ..
fi

# update lmgr
tlmgr update --self

# l3build
tlmgr install l3build

# latex formats
tlmgr install latex-bin luahbtex tex

# metafont
tlmgr install metafont mfware texlive-scripts

# required LaTeX packages
tlmgr install latex amsmath graphics tools

# LaTeX-dev
tlmgr install        \
  latex-bin-dev      \
  latex-base-dev     \
  latex-graphics-dev \
  latex-tools-dev    \
  latex-amsmath-dev

# dependencies
tlmgr install    \
  babel          \
  babel-english  \
  hyphen-english \
  biblatex       \
  biber          \
  bibtex         \
  csquotes       \
  ec             \
  cm-super       \
  etoolbox       \
  iftex          \
  hyperref       \
  atveryend      \
  infwarerr      \
  hycolor        \
  lm             \
  lm-math        \
  psnfss         \
  unicode-math   \
  xkeyval

tlmgr install       \
  babel-german      \
  babel-french      \
  hyphen-german     \
  hyphen-french     \
  bera              \
  dvips             \
  bookmark          \
  booktabs          \
  carlisle          \
  cleveref          \
  datetime2         \
  datetime2-english \
  everysel          \
  environ           \
  epstopdf-pkg      \
  fontaxes          \
  geometry          \
  hyphenat          \
  l3experimental    \
  libertinus        \
  libertinus-type1  \
  listings          \
  ltxdockit         \
  microtype         \
  ms                \
  mweights          \
  newtx             \
  oberdiek          \
  pdfcol            \
  pgf               \
  pict2e            \
  ragged2e          \
  tikzfill          \
  tcolorbox         \
  tracklang         \
  trimspaces        \
  xcolor

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0

# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install

# show all installed packages (useful for debugging)
tlmgr list --only-installed
