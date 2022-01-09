#!/bin/bash

echo -n "Enter FileName with full pass: "
read FileName

jq '.Statement[0].Principal.AWS[.Statement[0].Principal.AWS | length] |= . +"arn:aws:iam::77777777:root" | .Statement[0].Resource = "arn:aws:s3:::HW19-T3-7777777/*"' "$FileName" > ""$FileName"temp" && mv ""$FileName"temp" "$FileName"
