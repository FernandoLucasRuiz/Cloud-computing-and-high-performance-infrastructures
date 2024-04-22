#! /bin/bash
apt update
apt -y install apache2
cat <<EOF > /var/www/html/index.html
<html><body><p>Hi student. This is a Linux startup script from a local file.</p></body></html>
EOF