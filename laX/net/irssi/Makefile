include ../../etc/la.conf

NAME=irssi
VERSION=0.8.6
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://de.irssi.org/files/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
CONFIGUREOPTS+=--enable-ipv6 --with-glib2 --with-openssl-includes=$(PREFIX)/include --with-openssl-libs=$(PREFIX)/lib
TARGET=$(DIR)/irssi
DEPENDENCIES="libs/glib2 \
	      libs/openssl \
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
	/sbin/
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
