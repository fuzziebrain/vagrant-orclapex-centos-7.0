#!/bin/bash

# Install Apache2 package
yum -y install httpd

# Copy APEX images configuration file
cp /vagrant/config/apex_images.conf /etc/httpd/conf.d/

# Copy additional configuration files to aid development
cp /vagrant/config/vendor.conf /etc/httpd/conf.d/
cp /vagrant/config/custom.conf /etc/httpd/conf.d/

# Enable and start the apache2 service
systemctl enable httpd
systemctl start httpd