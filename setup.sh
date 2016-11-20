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

command="\(sleep 30\; \/opt\/pi-call-home\/publishIP.sh\ $1 $2)\&"

sed -i.bak '/^exit 0/s/exit 0/'"$command"'\n\nexit 0\n/' /etc/rc.local 

sed -i.bak '/^mailhub=mail/s/mailhub=mail/mailhub='"$3"'/' /etc/ssmtp/ssmtp.conf

echo "UseTLS=Yes" >> /etc/ssmtp/ssmtp.conf
echo "UseSTARTTLS=Yes" >> /etc/ssmtp/ssmtp.conf
echo "AuthUser=$1" >> /etc/ssmtp/ssmtp.conf
echo "AuthPass=$4" >> /etc/ssmtp/ssmtp.conf


echo "root:$2:$3\n" > /etc/ssmtp/revaliases

