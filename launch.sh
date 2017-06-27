
  ./configure && make


  RET=$?; if [ $RET -ne 0 ]; then

    echo "Error. Exiting."; exit $RET;

  fi

  cd ..

  install_luarocks

  install_rocks

}


if [ "$1" = "install" ]; then

  install

elif [ "$1" = "update" ]; then

  update

else

  if [ ! -f ./tg/telegram.h ]; then

    echo "tg not found"

    echo "Run $0 install"

    exit 1

  fi


  if [ ! -f ./tg/bin/telegram-cli ]; then

    echo "tg binary not found"

    echo "Run $0 install"

    exit 1

  fi

  while true; do

   rm -r ../.telegram-cli/state

   ./tg/bin/telegram-cli -k ./tg/tg-server.pub -s ./bot/element.lua -l 1 -E $@

   sleep 3

  done

fi
