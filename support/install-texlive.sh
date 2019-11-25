#!/usr/bin/env sh

# This script is used for testing using Travis-CI
# It is intended to work on their VM set up: Ubuntu 16.04 LTS
# As such, the nature of the system is hard-coded
# A minimal current TL is installed adding only the packages that are
# required

# See if there is a cached verson of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl --profile=../support/texlive.profile

  cd ..
fi

# update lmgr
tlmgr update --self

# l3build
tlmgr install l3build

# latex formats
tlmgr install latex-bin tex

# metafont
tlmgr install metafont mfware

# required LaTeX packages
tlmgr install latex amsmath graphics tools

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
  etoolbox       \
  iftex          \
  hyperref       \
  lm             \
  lm-math        \
  logreq         \
  oberdiek       \
  pdftexcmds     \
  psnfss         \
  unicode-math   \
  url            \
  xkeyval

tlmgr install       \
  babel-german      \
  babel-french      \
  hyphen-german     \
  hyphen-french     \
  bera              \
  dvips             \
  booktabs          \
  carlisle          \
  cleveref          \
  datetime2         \
  datetime2-english \
  environ           \
  fontaxes          \
  hyphenat          \
  koma-script       \
  l3experimental    \
  libertinus        \
  libertinus-type1  \
  listings          \
  ltxdockit         \
  microtype         \
  ms                \
  mweights          \
  newtx             \
  pgf               \
  pict2e            \
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
