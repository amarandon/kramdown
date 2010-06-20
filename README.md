# kramdown

kramdown is yet-another-markdown-parser but fast, pure Ruby, using a strict syntax definition and
supporting several common extensions.

The syntax definition can be found in doc/syntax.page, a quick reference in doc/quickref.page. All
the documentation is available online at http://kramdown.rubyforge.org.


# Usage

kramdown has a basic *Cloth API, so using kramdown is as easy as

    require 'kramdown'

    Kramdown::Document.new(text).to_html


# Development

Just clone the git repository as described in doc/installation.page you are good to go. You probably
want to install `rake` so that you can use the provided rake tasks. Aside from that:

* The `tidy` binary needs to be installed for the automatically derived tests to work.
* The `latex` binary needs to be installed for the latex-compilation tests to work.
* If you get errors about missing latex file such as `ucs.sty` or `utf8x.def`,
  you may need to install manually the unicode package from CTAN:
  http://ctan.org/tex-archive/macros/latex/contrib/unicode/

# License

See the COPYING file.
