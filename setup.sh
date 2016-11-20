#/usr/bash

if [ $# -eq 0 ]
  then
    echo "$0 relay-email admin-email email-server"
    exit 1
fi

apt-get install ssmtp

mkdir /opt/pi-call-home
chmod 0755 /opt/pi-call-home

cp ./publishIP.sh /opt/pi-call-home
chmod 0755 /opt/pi-call-home/publishIP.sh

command="\(sleep 30\; sudo \/opt\/pi-call-home\/publishIP.sh\ $1 $2)\&"

sed -i.bak 's/exit 0/'"$command"'\n\nexit 0\n/' /etc/rc.local 

echo "root:$2:$3\n" > /etc/ssmtp/revaliases

