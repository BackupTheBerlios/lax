include ../../etc/la.conf
NAME=librsvg
VERSION=2.9.5
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://ftp.gnome.org/pub/GNOME/sources/librsvg/2.9/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=
DEPENDENCIES=libs/libxml2 \
	     libs/libart2 \
	     libs/pkgconfig \

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && export CFLAGS=-I$(PREFIX)/include LDFLAGS="-L$(PREFIX)/lib -lfreetype -lfontconfig -framework Cocoa"  && ./configure $(CONFIGUREOPTS)

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
