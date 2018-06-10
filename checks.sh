function check_mac() {
  if [ "$(uname)" != "Darwin" ]; then
    echo "Mac OS needed"
    exit 1
  fi
}

function check_program() {
  if hash brew 2>/dev/null; then
    echo "exists"
  else
    echo "not exists"
  fi
}
