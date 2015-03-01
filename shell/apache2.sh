# Install Apache2 package
yum -y install httpd

# Copy APEX images configuration file
cp /vagrant/config/apex_images.conf /etc/httpd/conf.d/

# Enable and start the apache2 service
systemctl enable httpd
systemctl start httpd