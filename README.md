# pi-call-home

**publishIP.sh relay-email admin-email**
Simple script that sends the pi network information by email after the boot.  Useful when you want to SSH to your pi without requiring to connect a screen, keyboard and mouse.

**sudo setup.sh relay-email admin-email email-server email-server-password** 
Deploys the script along with required packages and configures all necessary files:
* /etc/rc.local 
* /etc/ssmtp/ssmtp.conf
* /etc/ssmtp/revaliases

**Important** if you do not use SUDO the setup will fail.  Also note that it was tested on Jessie only.

**relay-email** Email user id / account that will be used to send the email
**admin-email** Email id that will receive the email
**email-server** The SMTP server that will be used to send the email.  Tested with gmail
**email-server-password** The SMTP server password
