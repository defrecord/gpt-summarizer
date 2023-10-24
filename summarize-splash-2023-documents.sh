#!/usr/bin/env bash

# This script summarizes all the PDFs in the splash-2023/documents directory.

# Regenerate summaries even if they already exist.
FORCE=false

for PDF in ../splash-2023/documents/*.pdf; do
    echo $PDF
    BASENAME=$(basename $PDF .pdf)
    SUMMARYNAME=${BASENAME}.txt.overall_summary.txt

    ## Generate the text file if it doesn't exist.
    # if [ $FORCE = true ] || [ ! -f $PDF.txt ]; then
    # 		pdftotext $PDF
    # fi

    ## Generate the summary if it doesn't exist.
    if [ $FORCE = true ] || [ ! -f $SUMMARYNAME ]; then
	poetry run python3 ./summarize.py $PDF
    else
	echo "Skipping $SUMMARYNAME because it already exists."
    fi
done
