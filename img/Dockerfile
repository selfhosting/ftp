FROM ubuntu:latest
MAINTAINER mickael@kerjean.me

RUN apt-get -y update && \
        #####################
        # INSTALL APPLICATION
        apt-get install -y proftpd ldap-auth-client nscd openssl && \
        #####################
        # CONFIGURATION
        # https://help.ubuntu.com/community/LDAPClientAuthentication
        # ldap conf
        auth-client-config -t nss -p lac_ldap && \
        echo "session required        pam_mkhomedir.so umask=0022 skel=/etc/skel" >> /etc/pam.d/common-session && \
        echo "*;*;*;Al0000-2400;audio,cdrom,dialout,floppy" >> /etc/security/group.conf && \
        echo "auth    required     pam_group.so use_first_pass" >> /etc/pam.d/common-auth && \
        sed -i 's|#binddn cn=|binddn cn=|' /etc/ldap.conf && \
        sed -i 's|#bindpw|bindpw|' /etc/ldap.conf && \
        rm -rf /etc/skel/* || true && rm -rf /etc/skel/.* || true && \
        # ftp conf
        sed -i 's|# DefaultRoot|DefaultRoot|' /etc/proftpd/proftpd.conf && \
        #####################
        # INSTALL OTHER RELATED STUFF
        apt-get install -y vim ldap-utils rsyslog && \
        #####################
        # CLEANUP
        apt-get -y clean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/home"]
WORKDIR "/home"
EXPOSE 22
ADD sftp.conf /etc/proftpd/conf.d/sftp.conf
ADD entrypoint.sh /entrypoint.sh
CMD ["bash", "/entrypoint.sh"]