#!/bin/bash
function nightly() {
	path=$(realpath -s "$1")
	/c/Program\ Files/Firefox\ Nightly/firefox.exe "$path"
}
