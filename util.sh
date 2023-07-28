function eecho {
  echo "$@" >&2
}

function link_file {
  local src="$1" dst="$2"

  if [ ! -e "$src" ]; then
    eecho "  File \"$src\" does not exists."
    eecho "  Aborting."
    return
  fi

  if [ -e "$dst" ]; then
    echo "  File \"$dst\" already exists!"
    echo -n "  Do you want to overwrite? [y/n] "

    while true; do
      read action
      if [ "$action" = "y" ] || [ "$action" = "Y" ]; then
        rm -rf "$dst"
        break
      elif [ "$action" = "n" ] || [ "$action" = "N" ]; then
        return
      else
        echo -n "  Please enter \"y\" or \"n\". [y/n] "
      fi
    done
  fi

  ln -sf "$src" "$dst"
}
