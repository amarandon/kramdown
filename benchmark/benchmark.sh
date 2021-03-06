#!/bin/bash

source ~/.bashrc

RUBY_VERSIONS=`rvm list strings | sort`
KD_VERSIONS="`git tag | sort -V` master"
OTHERS=false

while getopts "r:k:o" optname; do
    case "$optname" in
        "r")
            RUBY_VERSIONS="$OPTARG"
            ;;
        "k")
            KD_VERSIONS="$OPTARG"
            ;;
        "o")
            OTHERS=true
            ;;
        "?")
            echo "Unknown option $OPTARG"
            exit 1
            ;;
        ":")
            echo "No argument value for option $OPTARG"
            exit 1
            ;;
        *)
            echo "Unknown error while processing options"
            exit 1
            ;;
    esac
done

TMPDIR=/tmp/kramdown-benchmark

rm -rf $TMPDIR
mkdir -p $TMPDIR
cp benchmark/md* $TMPDIR
cp benchmark/generate_data.rb $TMPDIR
git clone .git ${TMPDIR}/kramdown
cd ${TMPDIR}/kramdown

for RUBY_VERSION in $RUBY_VERSIONS; do
	rvm $RUBY_VERSION
	echo "Creating benchmark data for $(ruby -v)"

    for KD_VERSION in $KD_VERSIONS; do
        echo "Using kramdown version $KD_VERSION"
        git co $KD_VERSION 2>/dev/null
        ruby -I${TMPDIR}/kramdown/lib ../generate_data.rb -k ${KD_VERSION} >/dev/null
    done

    if [ $OTHERS = "true" ]; then
        ruby -rubygems -I${TMPDIR}/kramdown/lib ../generate_data.rb -o >/dev/null
    fi
done

cd ${TMPDIR}
rvm default
ruby generate_data.rb -g
