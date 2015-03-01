# Install Apache2 package
yum -y install tomcat

# Copy APEX images configuration file
cp /vagrant/config/proxy_ajp.conf /etc/httpd/conf.d/

# Enable and start the apache2 service
systemctl enable tomcat
systemctl start tomcat