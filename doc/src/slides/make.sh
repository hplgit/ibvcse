#!/bin/sh
name=csebio

doconce format html $name --html_style=solarized3
doconce slides_html $name doconce --nav_button=text

# Publish
dest=../../pub/slides
cp $name.html ._${name}*.html $dest
