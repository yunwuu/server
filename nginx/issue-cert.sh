#!/bin/bash


echo "As this script is for personal use, only domains which DNS are hosted on Aliyun CN is supported. If not, please directly use the official acme.sh script."
echo -n "Continue? (y/N)"
read yn
if [ "$yn" != "y" ]
then
   echo "Bye"
   exit
fi


if [ `whoami` !=  "root" ]
then
    echo "You should run this script under root."
    exit
fi

apt update
apt install curl -y


echo -n "Please input your email:"
read mail
echo "Using mail: $mail"

curl https://get.acme.sh | sh -s email="$mail"

echo "If you've configured ak and ac already, you can leave it blank!"
echo -n "Input your Aliyun AccessKey:"
read ak
echo -n "Input your Aliyun AccessSecret:"
read ac
export Ali_Key="$ak"
export Ali_Secret="$ac"

echo -n "Input domain..."
read domain


~/.acme.sh/acme.sh   --issue --dns dns_ali  -d "$domain" -d "*.$domain"

echo "ssl_certificate /root/.acme.sh/$domain/fullchain.cer" >> "ssl-$domain.conf"
echo "ssl_trusted_certificate /root/.acme.sh/$domain/fullchain.cer" >> "ssl-$domain.conf"
echo "ssl_certificate_key /root/.acme.sh/$domain/$domain.key" >> "ssl-$domain.conf"


echo "SSL Config:"
cat "ssl-$domain.conf"
