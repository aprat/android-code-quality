#!/usr/bin/env bash
BASEDIR=$(pwd)
DIRS="/app/build/reports/"
CHECKSTYLE="checkstyle"
FINDBUGS="findbugs"
LINT="lint"
PMD="pmd"

browser-sync start --server "$BASEDIR$DIRS$CHECKSTYLE" --files "*.html" --no-ui --logLevel silent &
sleep 1
browser-sync start --server "$BASEDIR$DIRS$FINDBUGS" --files "*.html"--no-ui --logLevel silent &
sleep 1
browser-sync start --server "$BASEDIR$DIRS$LINT" --files "*.html" --no-ui  --logLevel silent &
sleep 1
browser-sync start --server "$BASEDIR$DIRS$PMD" --files "*.html" --no-ui  --logLevel silent &