#!/bin/bash
rune=$(ifconfig | grep "rune")
generic=$(ifconfig | grep "tun0")

if [ "$rune" != "" ]; then
  echo " rune"
fi

if [ "$generic" != "" ]; then
  echo " generic"
fi

echo ""
