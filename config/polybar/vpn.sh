#!/bin/bash
rune=$(ifconfig | grep "rune")
surfshark=$(ifconfig | grep "surfshark")
generic=$(ifconfig | grep "tun0")

if [ "$rune" != "" ]; then
  echo " rune"
fi

if [ "$surfshark" != "" ]; then
  echo " surfshark"
fi

if [ "$generic" != "" ]; then
  echo " generic"
fi

echo ""
