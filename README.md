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


