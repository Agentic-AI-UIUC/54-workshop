#!/usr/bin/env bash
# Present the deck. Pass --publish-speaker-notes to mirror notes to a second terminal
# running `presenterm --listen-speaker-notes`.
cd "$(dirname "$0")"
exec presenterm -c config.yaml -x "$@" slides.md
