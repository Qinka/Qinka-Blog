#!/bin/bash
if [ $# -eq 0 ]; then
  echo '<link rel="stylesheet" href="/r/hightlight/css"/>'
  echo '<script src="/r/highlight/js"></script>'
else
  echo '<link rel="stylesheet" href="/r/hightlight/css"/>' >> $1
  echo '<script src="/r/highlight/js"></script>' >> $1
fi
