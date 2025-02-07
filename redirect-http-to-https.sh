#!/bin/bash

# Redirection automatique de HTTP vers HTTPS
while true; do
    echo -e "HTTP/1.1 301 Moved Permanently\r\nLocation: https://www.theo-fontana.com\r\n\r\n" | nc -l -p 80
done
