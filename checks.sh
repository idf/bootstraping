function check_mac() {
  if [ "$(uname)" != "Darwin" ]; then
    echo "Mac OS needed"
    exit 1
  fi
}
