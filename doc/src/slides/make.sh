#!/bin/bash
name=csebio

function system {
  "$@"
  if [ $? -ne 0 ]; then
    echo "make.sh: unsuccessful command $@"
    echo "abort!"
    exit 1
  fi
}

system doconce format html $name --html_style=solarized3
system doconce slides_html $name doconce --nav_button=text

system doconce format html $name --html_style=bloodish --html_output=${name}-1
system doconce split_html $name doconce --method=hrule

system doconce format ipynb $name

beamertheme=red_shadow
system doconce format pdflatex $name --latex_title_layout=beamer --latex_table_format=footnotesize --latex_admon_title_no_period
system doconce ptex2tex $name envir=minted
system doconce slides_beamer $name --beamer_slide_theme=$beamertheme
system pdflatex -shell-escape ${name}
system pdflatex -shell-escape ${name}

system doconce format html index --html_style=bootstrap --html_bootstrap_navbar=off

# Publish
dest=../../pub/slides
cp ${name}*.html ._${name}*.html $name.ipynb $name.pdf index.html $dest
