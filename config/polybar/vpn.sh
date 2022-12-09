#!/bin/bash
rune=$(ifconfig | grep "rune")
mullvad=$(ifconfig | grep "mullvad")
generic=$(ifconfig | grep "tun0")

if [ "$rune" != "" ]; then
  echo " rune"
fi

if [ "$mullvad" != "" ]; then
  echo " surfshark"
fi

if [ "$generic" != "" ]; then
  echo " generic"
fi

echo ""
