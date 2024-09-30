#!/bin/sh
## https://validator.w3.org/checklink/docs/checklink.html#wait

checklink --quiet --summary --depth 2  --exclude='^mailto:' https://tcgorbella.fr
