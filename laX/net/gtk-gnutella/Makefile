include ../../etc/la.conf

NAME=gtk-gnutella
VERSION=0.93.3
FILE=$(NAME)-$(VERSION).tar.bz2
LOCATION=$(SOURCEFORGE)/sourceforge/gtk-gnutella/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/gtk-gnutella
DEPENDENCIES="libs/libxml2 \
	      libs/gtk+ \
	      libs/glib \
	      libs/zlib \
	      libs/libiconv \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xjf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && export CFLAGS=-I$(PREFIX)/include CPPFLAGS=-I$(PREFIX)/include && ./configure $(CONFIGUREOPTS)

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
