mkdir -p /tmp/vagrant/ords
unzip /vagrant/files/ords.2.0.10.289.08.09.zip -d /tmp/vagrant/ords

mkdir /etc/ords

java -jar /tmp/vagrant/ords/ords.war configdir /etc
java -jar /tmp/vagrant/ords/ords.war set-properties --conf defaults /vagrant/config/ords.properties
java -jar /tmp/vagrant/ords/ords.war set-properties --conf apex /vagrant/config/apex.properties
java -jar /tmp/vagrant/ords/ords.war set-properties --conf apex_al /vagrant/config/apex_al.properties
java -jar /tmp/vagrant/ords/ords.war set-properties --conf apex_rt /vagrant/config/apex_rt.properties

chown -R tomcat:tomcat /etc/ords

cp /tmp/vagrant/ords/ords.war /usr/share/tomcat/webapps/