include ../../etc/la.conf
NAME=silc-client
VERSION=1.0.1
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://silcnet.org/download/client/sources/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-iconv=/opt/la --with-perl=no
# uncomment the following if option is availible
CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/lib/libsilc.la
DEPENDENCIES="libs/glib \
	      libs/libiconv \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/irssi/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/irssi/config.h:
	patch -p0 < silc-macosx.patch
	cd $(DIR) && export CPPFLAGS=-DMACOSX && ./configure $(CONFIGUREOPTS)

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
