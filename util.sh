function link_file {
  local src=$1 dst=$2

  if [ -z "$(diff -q $src $dst)" ]; then
    return
  fi

  if [ -e $dst ]; then
    echo "File \"$dst\" already exists!"
    echo -n "Do you want to overwrite? [y/n] "
    read action
    if [ $action = "y" ] || [ $action = "Y" ]; then
      ln -fs $src $dst
    fi
  fi
}
