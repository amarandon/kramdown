= kramdown

kramdown is yet-another-markdown-parser but fast, pure Ruby, using a strict syntax definition and
supporting several common extensions. The syntax definition for the kramdown syntax can be found in
doc/syntax.page and a quick reference is available in doc/quickref.page.

The kramdown library is mainly written to support the kramdown-to-HTML conversion chain. However,
due to its flexibility it supports other input and output formats as well. Here is a list of the
supported formats:

* input formats: kramdown (a Markdown superset), Markdown, HTML
* output formats: HTML, kramdown, LaTeX (and therefore PDF)

All the documentation on the available input and output formats is available in the doc/ directory
and online at http://kramdown.rubyforge.org.


== Usage

kramdown has a basic *Cloth API, so using kramdown is as easy as

    require 'kramdown'

    Kramdown::Document.new(text).to_html

For detailed information have a look at the API documentation of the Kramdown::Document class.


== Development

Just clone the git repository as described in doc/installation.page and you are good to go. You
probably want to install `rake` so that you can use the provided rake tasks. Aside from that:

* The `tidy` binary needs to be installed for the automatically derived tests to work.
* The `latex` binary needs to be installed for the latex-compilation tests to work.
* If you get errors about missing latex file such as `ucs.sty` or `utf8x.def`,
  you may need to install manually the unicode package from CTAN:
  http://ctan.org/tex-archive/macros/latex/contrib/unicode/

== License

GPLv3 - see the COPYING file.
