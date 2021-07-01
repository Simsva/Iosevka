# Iosevka Simsva
My personal build settings for Iosevka and nerd-fonts.
The `font-patcher` script and the contents of `nerd-fonts-src/` were taken from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts).
Their license is provided in `LICENSE-nerd-fonts`.

# Installation
Build Iosevka Simsva by running `make iosevka` and patch in nerd-font glyphs with `make nerd`.
Alternatively you can simply run `make` which does the same thing.
`make install` will install the patched fonts to the directory specified in `config.mk`.
If you want to install the unpatched fonts you have to do so manually.
Finally, running `make install_all` will build, patch and install the fonts in one command.

# Glyph List
The `extract-glyphs` script will extract all glyphs, their names and code points into the `glyphs` file.
A lot of glyphs either don't work or lack names, so it requires some manual fixing.
I have already fixed most of those problems in the file `glyphs_fixed`.
I have also removed some of the glyphs that caused my terminal to crash (changing text direction?).

That file can be used with a script such as `dmenuunicode` from
[LukeSmithxyz's dotfiles](https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/dmenuunicode)
to easily copy glyphs to your clipboard.
