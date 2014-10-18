Internet Searches from CLI and X Clipboard
================================

Command Line Apps
-----------------
This packages contains the following CLI search scripts:

    amz           Amazon
    antix         antiX Linux forums
    ddg           DuckDuckGo
    dict-search   Dictionary Lookup
    g             Google
    gf            Gentoo Linux Forums
    imdb          Internet Movie Database
    imdb-disc     Search IMDb for labels on bluray and dvd discs
    imdbe         Internet Movie Database Episodes
    mx            MX Linux Forums
    stp           Start Page
    wiki          Wikipedia

The search terms are the command line arguments.  Double-quotes
are usually respected.  If called from a virtual console will
try to open up a CLI browser, otherwise open up a browser with
the search results.

If no command line arguments are given then the search terms
are the most recently highlighted text in X-windows (using the
xclip program).

Search Bar
----------
The search-bar is a configurable gtkdialog application that
contains a row (or column) of buttons for different searches.
Just highlight the text you want to search for and then hit
the appropriate button for the search you want.

    Usage: search-bar [options]

    Options:
      -a --all              Use all available buttons
      -b --buttons <list>   Use buttons from <list>
      -c --config  <file>   Load configuration from <file>
      -h --help             Show this help
      -i --idir    <dir>    Look for icons in directory <dir>
      -l --list             List all buttons
      -o --orient  <h|v>    Orient the bar vertically or horizontally
      -s --save             Save current configuration
      -t --title   <text>   Use <text> as the title (Search Bar)
      -T --test             Test mode

    Default config file: ~/.config/search-bar.conf

Makefile
--------
Here are the valid make targets:

    make help       show this help
    make test       launch trial search-bar
    make install    install scripts and icons
    make deb        install to deb/ subdirectory
    make clean      delete the deb/ subdirectory

Customization
-------------
It is very easy to add new search scripts.  For example,
here is the entire contents of the ddg script:

    #!/bin/bash

    env PATH=/usr/local/lib/search-bar/bin:$PATH search-any \
        "https://duckduckgo.com/html?q=" "$@"

To create a new search script just make a copy of an existing
script and replace the URL.  I usually view page source of a
search page to try to figure out what URL to use.

To make a button for a new search script just add another
button entry in the search-bar script.  Here is the button
for DuckDuckGO:

    BUTTON_duckduckgo="
    <button tooltip-text=\"Duck Duck Go Search\">
    <input file>$IDIR/ddg-logo.png</input>
    <action>ddg</action>
    </button>
    "

Note that the two helper scripts which do almost all of the
work are put under a lib directory since users would not
normally run them directly.

