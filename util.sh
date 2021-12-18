function eecho {
  echo "$@" >&2
}

function link_file {
  local src=$1 dst=$2

  if [ ! -e $dst ]; then
    ln -fs $src $dst
  elif [ -n "$(diff -q $src $dst)" ]; then
    echo "File \"$dst\" already exists!"
    echo -n "Do you want to overwrite? [y/n] "
    read action
    if [ $action = "y" ] || [ $action = "Y" ]; then
      ln -fs $src $dst
    fi
  fi
}
