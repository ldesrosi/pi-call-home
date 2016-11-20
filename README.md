# pi-call-home

**publishIP.sh: relay-email admin-email**
Simple script that sends the pi network information by email after the boot.  Useful when you want to SSH to your pi without requiring to connect a screen, keyboard and mouse.

**setup.sh relay-email admin-email email-server email-server-password** 
Deploys the script along with required packages and configures all necessary files:
* /etc/rc.local 
* /etc/ssmtp/ssmtp.conf
* /etc/ssmtp/revaliases

takes care of the configuration.  I
