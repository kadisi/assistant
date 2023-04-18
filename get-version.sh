# Return the current git tag (if present) or the first characters of the commit hash
#!/usr/bin/env sh 

GIT_HASH=$(git log -n1 --pretty='%h')
DESCRIBE=$(git describe --exact-match --tags $GIT_HASH 2> /dev/null)

if [ -n $DESCRIBE ]; then
    # Remove 'v' from beginning of tag, if present before a number
    RESULT=$(echo $DESCRIBE | sed 's/^v\([0-9]\)/\1/')
else
    RESULT=$GIT_HASH
fi

# Add a * to the hash if there are uncommitted changes
if [ -n "$(git status -s)" ]; then
    RESULT+="*"
fi

echo $RESULT
