# About ##

The Little MongoDB Book is a free book introducing MongoDB.

The book was written shortly after the creation of the [MongoDB interactive tutorial](http://mongly.com). As such, the two can be seen as complementary.

The book was written by [Karl Seguin](http://openmymind.net), with [Perry Neal](http://twitter.com/perryneal)’s assistance.

If you liked this book, maybe you’ll also like [The Little Redis Book](http://openmymind.net/2012/1/23/The-Little-Redis-Book/).

## License ##

The book is freely distributed under the [Attribution-NonCommercial 3.0 Unported license](<http://creativecommons.org/licenses/by-nc/3.0/legalcode>).

## Formats ##

The book is written in [Markdown](http://daringfireball.net/projects/markdown/) and converted to PDF using [Pandoc](http://johnmacfarlane.net/pandoc/).

## Title Image ##

A PSD of the title image is included. The font used is [Comfortaa](http://www.dafont.com/comfortaa.font).

# Books generating

## Generating the PDF ##

### Requirements

You need some packages and tools installed.

* TeX. For Arch Linux packages are (for other distributions packages are pretty similar):
	* `texlive-core`
	* `texlive-langcyrillic`
	* `texlive-latexextra`
	* `xelatex-extra` (AUR)
* Pandoc.
* Fonts.
	* Droid.
	* Linux Libertine.

### Generating

Just run such command to generate russian version:

	make pdf-ru

Or another one to generate english version:

	make pdf-en
