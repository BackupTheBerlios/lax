include ../../etc/la.conf

NAME=net-snmp
VERSION=5.0.9
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=$(SOURCEFORGE)/net-snmp/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-default-snmp-version="3" --with-sys-location=Earth --with-sys-contact="root@"  --with-logfile="/var/log/snmpd.log" --with-persistent-directory="/var/net-snmp"
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/agent/snmpd
DEPENDENCIES="libs/openssl \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && ./configure $(CONFIGUREOPTS)

./$(TARGET):
	cd $(DIR) && make all
install: .installed-$(NAME)-$(VERSION)

.installed-$(NAME)-$(VERSION): 
	make all
	cd $(DIR) && make install
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
