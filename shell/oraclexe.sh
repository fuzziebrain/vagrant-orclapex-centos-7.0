#!/usr/bin/env bash

# Add an additional 1 GB swap file for Oracle XE
dd if=/dev/zero of=/swap1gb bs=1024 count=1048576
chmod 0600 /swap1gb
mkswap /swap1gb
echo "/swap1gb none swap sw 0 0" >> /etc/fstab
swapon -a

# Install dependencies for Oracle XE
yum -y install unzip libaio bc
#yum -y install libaio
#yum -y install bc

# Pre-install tasks
mkdir -p /tmp/vagrant/oraclexe
unzip -q /vagrant/files/oracle-xe-11.2.0-1.0.x86_64.rpm.zip -d /tmp/vagrant/oraclexe
unzip -q /vagrant/files/apex_4.2.6.zip -d /tmp/vagrant

# Install Oracle XE
rpm -i /tmp/vagrant/oraclexe/Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm
rm -rf /tmp/vagrant/oraclexe

# Configure Oracle XE with response file
/etc/init.d/oracle-xe configure responseFile=/vagrant/config/xe.rsp

# Crown vagrant user a DBA
usermod -a -G dba vagrant

# Enable Oracle environment variables for all users
ln -s /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh /etc/profile.d/oracle.sh
ln -s /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.csh /etc/profile.d/oracle.csh

# Upgrade APEX sudo -u vagrant -i 
source /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
cd /tmp/vagrant/apex/
sqlplus -s sys/manager as sysdba @/vagrant/sql/install_apex.sql
sqlplus -s sys/manager as sysdba @/vagrant/sql/postinstall_apex.sql
cd ~

mkdir -p /opt/oracle/apex
cp -R /tmp/vagrant/apex/images/ /opt/oracle/apex
