# stop camflow capturing
sleep 5
sudo camflow -e false
# wait a while so that relay fs writes all the data to audit.log
sleep 30
# copy the audit log to another folder
# cp /tmp/audit.log /vagrant/prov-data/mariadb-race-normal-data.log
