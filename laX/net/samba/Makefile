include ../../etc/la.conf

NAME=samba
VERSION=2.2.8a
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://de.samba.org/samba.org/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-smbmount --with-ssl
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/source/smbd/smbd
DEPENDENCIES="libs/openssl \
	      libs/libpam \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/source/include/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/source/include/config.h:
	cd $(DIR)/source && ./configure $(CONFIGUREOPTS)

./$(TARGET):
	cd $(DIR)/source && make all
install: .installed-$(NAME)-$(VERSION)

.installed-$(NAME)-$(VERSION): 
	make all
	cd $(DIR)/source && make install
	/sbin/
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
