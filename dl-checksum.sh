#!/usr/bin/env sh
set -e
DIR=~/Downloads
APP=wksctl
MIRROR=https://github.com/weaveworks/${APP}/releases/download

dl()
{
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="${os}-${arch}"
    local file=${APP}-${ver}-${platform}.${archive_type}
    local url=$MIRROR/v$ver/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `fgrep $file $lchecksums | awk '{print $1}'`
}

dl_ver()
{
    local ver=$1
    local checksums=${APP}_${ver}_checksums.txt
    local lchecksums=$DIR/$checksums
    local rchecksums=$MIRROR/v$ver/$checksums
    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums $rchecksums
    fi

    printf "  # %s\n" $rchecksums
    printf "  '%s':\n" $ver

    dl $ver $lchecksums darwin x86_64
    dl $ver $lchecksums linux x86_64
}

dl_ver ${1:-0.10.2}
