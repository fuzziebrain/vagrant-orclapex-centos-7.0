# Vagrant for ORCL APEX Devs
###### VBox - Centos 7.0 - Oracle 11g XE - APEX 4.2 - ORDS 2.0 Edition

Inspired by and building on previous work by [Martin D'Souza](https://github.com/martindsouza) and [Dominic Delmonlino](https://github.com/ddelmoli), this project allows developers to quickly standup standardized environments for working on Oracle APEX projects using [Vagrant](https://www.vagrantup.com/).

## Getting Started
The following are prerequsite software that must be installed and configured:
* VirtualBox (VBox)
* Vagrant
* Git client

### Building the VBox Virtual Machine
1. Clone the project: git clone https://github.com/fuzziebrain/vagrant-orclapex-centos-7.0.git
2. In your shell environment, set the current working directory to the project's root path
3. Create a new sub directory `files` 
4. Download and deposit the latest versions of the following products into the sub-directory `files`:
  * Oracle Database 11g Express Edition [[download](http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html)]
  * Oracle APEX [[download](http://www.oracle.com/technetwork/developer-tools/apex/downloads/index.html)]
  * Oracle REST Data Services [[download](http://www.oracle.com/technetwork/developer-tools/rest-data-services/downloads/index.html)]
5. Update the filenames if necessary. These are set in `shell/oraclexe.sh` for both Oracle XE and APEX, and in `shell/ords.sh` for ORDS.
6. Execute the command: vagrant up

### Using the VM
* To login to the server, SSH to host *localhost* at port *2222*. The username/password is *vagrant/vagrant*.
* The user *vagrant* has been added to the *dba* OS group.
* The password for both database users *sys* and *system* password is *manager* and may be changed in `config/xe.rsp`.
* The passwords for *APEX_PUBLIC_USER*, *APEX_REST_PUBLIC_USER* and *APEX_LISTENER* is *oracle* and may be changed in `sql/postinstall_apex.sql`.
* The password for APEX Instance Administrator is *Oracle1!* and may be changed in `sql/postinstall_apex.sql`.
* APEX instance can be accessed using the web browser on your host. The port number is 49080 and may be changed in `Vagrantfile`.
* Database can be accessed at port 49521 and may be changed in `Vagrantfile`

## TODOs
- [ ] Comprehensive documentation
- [ ] Consolidate configuration parameters into a single YAML file 
- [ ] Directory for static web resources stored in Vagrant sync folders that is exposed through the Apache 2 server
- [ ] firewalld configuration
- [ ] Configure an ORDS administrator account
- [ ] Enable SSL support