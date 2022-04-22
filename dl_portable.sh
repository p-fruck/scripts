#!/bin/sh
# A nice helper script to download a collection of
# executables from github to a given folder.

set -e
function dl_link() {
    # Usage: dl_link <github_user>/<github_repo> 
	curl -s https://api.github.com/repos/$1/releases |
		grep '"browser_download_url":.*linux' | grep 64 | head -1 |
		sed -E 's/.*"([^"]+)".*/\1/'
}

if [ -z $1 ]; then
	echo "Usage: $0 <target_directory>"
	exit 1
fi

if [ ! -d $1 ]; then
	echo "Target directory does not exist!"
	exit 1
fi

repos="
dandavison/delta
zyedidia/micro
sharkdp/bat
"

tmpdir="$1/tmp/"
[ -d "${tmpdir}" ] || mkdir "${tmpdir}"
cd "${tmpdir}"

for repo in $repos; do
	tool=$(echo ${repo} | cut -d '/' -f 2)
	url=$(dl_link ${repo})
	fullname="$(basename ${url} | sed 's/\.tar\.gz$//')"
	echo "Download ${fullname}"
	wget --quiet "${url}"
	tar -xzf "${fullname}.tar.gz"
	mv "$(find ${tool}* -name ${tool})" ..
done

cd .. && rm -r "tmp/"
