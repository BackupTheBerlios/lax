include ../../etc/la.conf
NAME=silc-client
VERSION=1.0.3
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://silcnet.org/download/client/sources/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-perl=no --without-silcd 
# uncomment the following if option is availible
CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/lib/libsilc.la
CPPFLAGS=-DMACOSX
CFLAGS=-O0
DEPENDENCIES=libs/glib \
	    
	     

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/irssi/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/irssi/config.h:
	cd $(DIR) && export CFLAGS="$(CFLAGS)" CPPFLAGS="$(CPPFLAGS)" && ./configure $(CONFIGUREOPTS)

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
