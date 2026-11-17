#!/bin/bash

set -e

dnf update -y
dnf install -y httpd

systemctl enable --now httpd

cat > /var/www/html/index.html <<'HTML'
<html>
<h1>Welcome! AWS Infrastructure Created Using Terraform</h1>
</html>
HTML
