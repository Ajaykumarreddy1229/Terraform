#!/bin/bash

set -e

dnf update -y
dnf install -y httpd

systemctl enable --now httpd

cat > /var/www/html/index.html <<'HTML'
<html>
<h1>Welcome! Apache Installed Using Terraform User Data</h1>
</html>
HTML
