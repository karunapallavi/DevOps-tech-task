#!/bin/bash
# bash script to run property database on required servers
#declaring the current user as sudo
sudo tee /etc/sudoers.d/$USER <<END
END

sudo rkhunter --propupd

#removing the sudo access from the current user
sudo /bin/rm /etc/sudoers.d/$USER
sudo -k