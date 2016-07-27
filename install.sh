# Store the directory where this file lives
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Store the parent directory (presumably, the theme/plugin dir)
PARENT_DIR="$(dirname "$DIR")"

rm $DIR/README.md
# Move everything else up a directory
mv $DIR/.gitignore $DIR/../.gitignore
mv $DIR/* $DIR/../
# Remove containing folder
rm -rf $DIR
# Remove this script
rm $PARENT_DIR/install.sh