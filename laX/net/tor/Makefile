include ../../etc/la.conf
NAME=tor
VERSION=0.0.9.4
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://tor.freehaven.net/dist/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-ssl-dir=/usr/
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/tor
DEPENDENCIES=libs/openssl \
	     

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/orconfig.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/orconfig.h:
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
