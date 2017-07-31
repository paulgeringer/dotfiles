PEPTOOL=$(which pep8)
DIFFS="$(git diff --staged -z HEAD -U0 | $PEPTOOL --diff --max-line-length 80)"

if [ "$DIFFS" ]; then
EOF
    echo "$DIFFS" | sed "s/^\.\///"
    exit 1
fi
