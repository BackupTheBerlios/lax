include ../../etc/la.conf
NAME=openvpn
VERSION=1.6.0
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=$(SOURCEFORGE)/openvpn/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-ssl-headers=$(PREFIX)/include --with-ssl-lib=$(PREFIX)/lib
 --with-lzo-headers=$(PREFIX)/include --with-lzo-lib=$(PREFIX)/lib
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/openvpn
DEPENDENCIES=libs/openssl \
	      libs/lzo \
	     

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
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

$(DEPENDENCIES):
	make -C ../../$@ install
