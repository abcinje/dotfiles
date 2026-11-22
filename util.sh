function eecho {
  echo "$@" >&2
}

function link_file {
  local src="$1" dst="$2"

  if [ ! -e "$src" ]; then
    eecho "  \"$src\" does not exist. Skipping."
    return 1
  fi

  if [ "$(readlink "$dst")" = "$src" ]; then
    return 0
  fi

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    local action
    while true; do
      read -r -p "  \"$dst\" already exists. Overwrite (keeps a backup)? [y/n] " action \
        || { echo; return 1; }
      case "$action" in
        [yY])
          local backup="$dst.bak.$(date +%Y%m%d%H%M%S)"
          mv "$dst" "$backup"
          echo "  Backed up to $backup"
          break ;;
        [nN]) return 0 ;;
      esac
    done
  fi

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
}
