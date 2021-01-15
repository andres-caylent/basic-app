#!/bin/bash
apt update
apt -y install tinyproxy
echo "Allow localhost" >> /etc/tinyproxy/tinyproxy.conf
service tinyproxy restart
