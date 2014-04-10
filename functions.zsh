# encryption/decryption
encrypt() {
    openssl des3 -salt -in $1 -out $2
}
decrypt() {
    openssl des3 -d -salt -in $1 -out $2
}

# 
speedtest() {
  wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test100.zip
}

