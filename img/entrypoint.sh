# Prepare config
sed -i "s|^base dc=.*|base $LDAP_BASE|" /etc/ldap.conf
sed -i "s|^uri ldapi://.*|uri $LDAP_URI|" /etc/ldap.conf
sed -i "s|^binddn cn=.*|binddn $LDAP_BIND_DN|" /etc/ldap.conf
sed -i "s|^bindpw.*|bindpw $LDAP_BIND_PASSWORD|" /etc/ldap.conf

# Start things
proftpd --nodaemon
