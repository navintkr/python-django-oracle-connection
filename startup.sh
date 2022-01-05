mkdir /opt/oracle
unzip /home/instantclient-basic-linux.x64-21.4.0.0.0dbru.zip -d /opt/oracle
cat << End >> ~/.profile
export PATH="$PATH:/opt/oracle/instantclient_21_4"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/oracle/instantclient_21_4"
End
source ~/.profile
apt-get install libaio

gunicorn --bind=0.0.0.0 --timeout 600 --workers=4 --chdir $APP_PATH web_project.wsgi