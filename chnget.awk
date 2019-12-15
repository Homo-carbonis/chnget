#!/bin/awk -f
BEGIN {
  FS = "\\|\\|"
}
{
  gsub(/[\n\r]/, "", $7)
  print ("mkdir -p '" $7 "'") | "/bin/sh"
  print "curl -o '" $7 "/" $3 "' '" $4 "'" | "/bin/sh"
}
END {
  close ("/bin/bash")
}
