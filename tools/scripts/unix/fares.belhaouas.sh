#!/bin/bash

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
# # if running bash
# if [ -n "$BASH_VERSION" ]; then
#     # include .bashrc if it exists
#     if [ -f "$HOME/.bashrc" ]; then
#         . "$HOME/.bashrc"
#     fi
#     # FBEL: DD MMM 2013
#     source ./fares.belhaouas.sh
# fi
# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
echo
echo "----- ----- ----- ----- ----- ----- ----- ----- ----- -----"
echo
echo "Fares Belhaouas functions"
echo "Version 06 OCT 2013, 17:42"
echo
# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
# ALIASES
# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

echo "Type fbel-apache2-restart                  to restart apache server"
alias fbel-apache2-restart='sudo service apache2 restart'


# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
# FUNCTIONS
# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

echo "Type fbel-backup(-sudo) file               to backup the file with current date and time"
function fbel-backup
{
  zip -r $1_`eval date +%Y-%m-%d_%H.%M.%S`.zip $1
};
function fbel-backup-sudo
{
  sudo zip -r $1_`eval date +%Y-%m-%d_%H.%M.%S`.zip $1
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

echo "Type fbel-install-basic                    to install Ubuntu basic tools"
function fbel-install-basic
{
  sudo apt-get install console-data
  sudo apt-get install zip
  
  sudo ntpdate ntp.ubuntu.com
  sudo apt-get install ntp
  sudo ntpdate ntp.ubuntu.com pool.ntp.org
  sudo apt-get install git
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

echo "Type fbel-install-apache2                  to install Apache2"
function fbel-install-apache2
{
  sudo apt-get upgrade
  
  sudo apt-get install apache2
  sudo apt-get install php5
  sudo apt-get install php5-curl
  sudo apt-get install php5-cli
  sudo apt-get install libapache2-mod-php5
  sudo apt-get install apache2 libapache-mod-ssl
  sudo apt-get install apache2 libapache-mod-security
  sudo apt-get install libapache2-mod-authnz-external pwauth
  
  sudo a2enmod ssl
  sudo a2ensite default-ssl
  sudo a2enmod proxy
  sudo a2enmod proxy_http
  sudo a2enmod vhost_alias
  sudo a2enmod authnz_external
  
  sudo service apache2 restart
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

echo "Type fbel-tail-apache2-sslaccess-log       to tail Apache2 sslaccess log"
function fbel-tail-apache2-sslaccess-log
{
  tail -f -n 200 /var/log/apache2/ssl_access.log 
}

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

echo "Type fbel-install-tomcat7                  to install Apache2"
function fbel-install-tomcat7
{
  sudo apt-get upgrade
  
  sudo apt-get install tomcat7
}

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

echo "Type fbel-install-subversion               to install Subversion"
function fbel-install-subversion
{
   echo "Installing Subversion"
   sudo apt-get update
   sudo apt-get install subversion
   
   echo "Creating a Repository"
   sudo mkdir /var/svn
   sudo svnadmin create /var/svn/repos
   
   sudo adduser svn
   sudo chown -R www-data.www-data /var/svn/repos
   chmod 770 -R /var/svn/repos
   sudo apt-get install openssh-server
   sudo apt-get install libapache2-svn
   
   echo "----- ----- ----- ----- -----"   
   echo "DO MANUALY!!!"
   echo
   echo "sudo vi /etc/passwd"
   echo
   echo "sudo vigr"
   echo
   echo "sudo vi /etc/apache2/apache.conf"
   echo "AddExternalAuth pwauth /usr/local/libexec/pwauth"
   echo "OR"
   echo "AddExternalAuth pwauth /usr/sbin/pwauth"
   echo "SetExternalAuthMethod pwauth pipe"
   echo
   echo "sudo vi /etc/apache2/mods-available/dav_svn.conf"
   echo "<Location /svn/repos>"
   echo "  DAV svn"
   echo "  SVNPath /var/svn/repos"
   echo "  "
   echo "  AuthType Basic"
   echo "  AuthName \"Subversion Repository\""
   echo "  AuthUserFile /etc/apache2/dav_svn.passwd"
   echo "  OR"
   echo "  AuthBasicProvider external"
   echo "  AuthExternal pwauth"
   echo "  Require valid-user"
   echo "</Location>"
   echo
   echo "sudo htpasswd -c /etc/apache2/dav_svn.passwd tester"
   echo
   echo "sudo service apache2 restart"
   echo "----- ----- ----- ----- -----"   
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

echo "Type fbel-install-jenkins                  to install Jenkins"
function fbel-install-jenkins
{
   echo "Installing Jenkins"
   wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
   sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
   sudo apt-get update
   sudo apt-get install jenkins
   sudo apt-get install openjdk-7-jdk
   sudo apt-get install xvfb
   sudo chown -R jenkins:nogroup /tmp/.X11-unix
   sudo apt-get install vnc4server
   
   echo "----- ----- ----- ----- -----"   
   echo "DO MANUALY!!!"
   echo
   echo "sudo vi /etc/default/jenkins"
   echo "SET HTTP_PORT=-1"
   echo "SET HTTPS_PORT=8443"
   echo "SET JENKINS_ARGS=\"... --httpsPort=$HTTPS_PORT ...\""
   echo
   # echo "sudo service jenkins restart"
   # echo "sudo nano /etc/apache2/sites-enabled/default-ssl"
   # echo "ProxyPass /jenkins http://localhost:8090/jenkins"
   # echo "sudo service apache2 restart"
   echo "sudo vigr"
   echo "SET shadow:x:42:jenkins"
   echo
   echo "sudo vigr -s"
   echo "SET shadow:*::jenkins"
   echo
   echo "sudo vncpasswd /var/lib/jenkins/.vnc/passwd"
   echo "sudo chown -R jenkins:adm /var/lib/jenkins/.vnc"
   echo
   echo "----- ----- ----- ----- -----"   
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

echo "Type fbel-install-MySQL                    to install MySQL"
function fbel-install-MySQL
{
   echo "Installing MySQL"
   sudo apt-get update
   sudo apt-get install mysql-server
   sudo apt-get install php5-mysql
   echo "----- ----- ----- ----- -----"
   echo "DO MANUALY!!!"
   echo
   echo "USE: mysql -u root -p"
   echo "USE: create database prototypes_db;"
   echo "USE: grant usage on *.* to prototypes_user@localhost identified by 'password for prototypes_user' ;"
   echo "USE: grant all privileges on prototypes_db.* to prototypes_user@localhost ;"
   echo "----- ----- ----- ----- -----"   
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

echo "Type fbel-install-phpmyadmin               to install phpmyadmin"
function fbel-install-phpmyadmin
{
   echo "Installing phppgadmin"
   sudo apt-get update
   sudo apt-get install phpmyadmin
   echo "----- ----- ----- ----- -----"   
   echo "DO MANUALY!!!"
   echo
   echo "CHECK: tail -f /var/log/apache2/error.log"
   echo "----- ----- ----- ----- -----"   
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

echo "Type fbel-install-postgresql               to install PostgreSQL"
function fbel-install-postgresql
{
   echo "Installing PostgreSQL"
   sudo apt-get update
   echo "Install PostgreSQL using the apt-get command in gnome-terminal:"
   sudo apt-get install postgresql libpq-dev
   echo "----- ----- ----- ----- -----"   
   echo "DO MANUALY!!!"
   echo
   echo "After installation is complete, change user to the PostgreSQL user:"
   echo "USE: sudo su - postgres"
   echo "USE: psql -d postgres -U postgres"
   echo "USE: alter user postgres with password 'password for root'; ALTER ROLE"
   
   echo "USE: CREATE USER prototypes_user WITH PASSWORD 'password for prototypes_user';"
   echo "USE: CREATE DATABASE prototypes_db OWNER prototypes_user ENCODING='UTF8';"
   echo "----- ----- ----- ----- -----"   
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

echo "Type fbel-install-phppgadmin               to install phppgadmin"
function fbel-install-phppgadmin
{
   echo "Installing phppgadmin"
   sudo apt-get update
   sudo apt-get install phppgadmin
   echo "----- ----- ----- ----- -----"
   echo "DO MANUALY!!!"
   echo
   echo "CHECK: tail -f /var/log/apache2/error.log"
   echo "EDIT:  sudo vi /etc/apache2/conf.d/phppgadmin"
   echo "ADD:   host all all 10.0.2.2/32     md5"
   echo "USE:   sudo service apache2 restart"
   echo "USE:   sudo service postgresql restart"
   echo "CHECK: sudo vi /etc/postgresql/9.1/main/pg_hba.conf"
   echo "CHECK: sudo vi /usr/share/phppgadmin/conf/config.inc.php"
   echo "----- ----- ----- ----- -----"   
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

echo "Type fbel-install-pgadmin3                 to install phppgadmin"
function fbel-install-pgadmin3
{
   echo "Installing pgadmin3"
   sudo apt-get update
   sudo apt-get install pgadmin3
   # echo "DO MANUALY!!!"
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
echo
echo "----- ----- ----- ----- ----- ----- ----- ----- ----- -----"
echo
# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----