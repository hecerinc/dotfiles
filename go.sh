#!/bin/bash

function go() {
	case "$1" in
		d)
			cd $HOME/Desktop
			;;
		dev)
			cd /c/dev/
			;;
		tmp)
			cd /c/dev/tmp
			;;
		waas)
			cd /c/dev/mcux
			;;
		mcapi)
			cd /c/dev/mcapi
			;;
		*)
			echo "Unknown destination: $1"
			;;
	esac
}
