# executing commands as root; saving index.html in /root
sudo su - root<<'EOF'
cd /root
wget http://www.yahoo.com 
EOF
