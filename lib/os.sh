case "$OSTYPE" in
  darwin*)
    OS="macos"
    ;;
  linux*)
    OS="linux"
    ;;
  *)
    exit 1
    ;;
esac
