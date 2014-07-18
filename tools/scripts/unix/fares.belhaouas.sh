#!/bin/bash

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
# # if running bash
# if [ -n "$BASH_VERSION" ]; then
#     # include .bashrc if it exists
#     if [ -f "$HOME/.bashrc" ]; then
#         . "$HOME/.bashrc"
#     fi
#     # FBEL: DD MMM 2014
#     source ./fares.belhaouas.sh
# fi
# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

function fbel-help
{
echo
echo "----- ----- ----- ----- ----- ----- ----- ----- ----- -----"
echo
echo "Fares Belhaouas functions"
echo "Version 16 JULY 2014, 00:00"
echo
echo "Type fbel-help                             to print all functions"
echo
echo "Type fbel-apache2-restart                  to restart Apache server"
echo "Type fbel-jenkins-restart                  to restart Jenkins server"
echo "Type fbel-tomcat7-restart                  to restart Tomcat server"
echo "Type fbel-backup(-sudo) file               to backup the file with current date and time"
echo "Type fbel-ls-java-processes                to print list of java processes"
echo "Type fbel-netstat                          to print used TCP/IP ports"
echo "Type fbel-tail-apache2-sslaccess-log       to tail Apache2 sslaccess log"
echo 
echo "Type fbel-install-101-basic                to install Ubuntu basic tools"
echo "Type fbel-install-apache2                  to install Apache2"
echo "Type fbel-install-jenkins                  to install Jenkins"
echo "Type fbel-install-MySQL                    to install MySQL"
echo "Type fbel-install-pgadmin3                 to install pgadmin3"
echo "Type fbel-install-phpmyadmin               to install phpmyadmin"
echo "Type fbel-install-phppgadmin               to install phppgadmin"
echo "Type fbel-install-postgresql               to install PostgreSQL"
echo "Type fbel-install-subversion               to install Subversion"
echo "Type fbel-install-tomcat7                  to install Tomcat7"
echo
echo "----- ----- ----- ----- ----- ----- ----- ----- ----- -----"
echo
};
fbel-help


# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
# ALIASES
# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

alias fbel-apache2-restart='sudo service apache2 restart'
alias fbel-jenkins-restart='sudo service jenkins restart'
alias fbel-tomcat7-restart='sudo service tomcat7 restart'

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
# FUNCTIONS
# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

function fbel-backup
{
  zip -r $1_`eval date +%Y-%m-%d_%H.%M.%S`.zip $1
};
function fbel-backup-sudo
{
  sudo zip -r $1_`eval date +%Y-%m-%d_%H.%M.%S`.zip $1
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

function fbel-install-101-basic
{
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install console-data
  sudo apt-get install zip
  
  sudo ntpdate ntp.ubuntu.com
  sudo apt-get install ntp
  sudo ntpdate ntp.ubuntu.com pool.ntp.org
  sudo apt-get install git
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

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

function fbel-tail-apache2-sslaccess-log
{
  tail -f -n 200 /var/log/apache2/ssl_access.log 
}

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

function fbel-install-tomcat7
{
  sudo apt-get upgrade
  
  sudo apt-get install tomcat7
  sudo apt-get install tomcat7-admin
}

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

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
   sudo mkdir /var/lib/jenkins/.vnc
   echo "sudo vncpasswd /var/lib/jenkins/.vnc/passwd"
   echo "sudo chown -R jenkins:adm /var/lib/jenkins/.vnc"
   echo
   echo "----- ----- ----- ----- -----"   
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

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

function fbel-install-pgadmin3
{
   echo "Installing pgadmin3"
   sudo apt-get update
   sudo apt-get install pgadmin3
   # echo "DO MANUALY!!!"
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

function fbel-add-fares
{
   groupadd developers
   grep developers /etc/group
   useradd -g developers -d /home/fares -m fares -s /bin/bash
   id fares
   passwd fares
   adduser fares sudo
   # userdel fares
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

function fbel-netstat
{
   netstat -anlp | egrep 'Proto|LISTEN'
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

function fbel-ls-java-processes
{
   ps aux | grep java
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

function fbel-backup-all-server-data
{
   local FOLDERS_TO_BACKUP="/etc/apache2/sites-available
   /var/lib/jenkins/backups"
   
   local TODAY=`eval date +%Y-%m-%d`
   echo  TODAY=$TODAY
   local BACKUP_FOLDER=/home/fares/backups/$TODAY
   echo  BACKUP_FOLDER=$BACKUP_FOLDER
   mkdir $BACKUP_FOLDER
   echo
   
   for f in $FOLDERS_TO_BACKUP
   do
      echo "Processing '$f'"
      local PROLOG=$f
      PROLOG+="_"
      PROLOG+=$TODAY
      PROLOG+="_"
      echo $PROLOG
      fbel-backup-sudo $f
      sudo mv $PROLOG*.zip $BACKUP_FOLDER
    done
};

# ----- ----- ----- ----- ----- ----- ----- ----- ----- -----