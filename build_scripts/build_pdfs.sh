#!/bin/sh

cd content/posts
ls $(ls -t *.md)
cat $(ls -t *.md) > full_site.md
ls
for i in *.md; do
    pandoc $i -o /out/${i//\.md/.pdf} \
    --pdf-engine=xelatex \
    -V geometry:margin=1in \
    -V papersize:a4 \
    -V mainfont:Archivo-Regular
done