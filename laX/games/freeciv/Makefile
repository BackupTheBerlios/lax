include ../../etc/la.conf
NAME=freeciv
VERSION=1.14.1
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://www.freeciv.de/mirror/ftp.freeciv.org/freeciv/stable/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-sdl-prefix=$(PREFIX) --with-gtk-prefix=$(PREFIX) --with-imlib-prefix=$(PREFIX) --enable-client=gtk2 --with-xpm-prefix=/usr/X11R6
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/client/civclient
DEPENDENCIES="libs/gtk2 \
	      libs/imlib \
	      libs/sdl \
	      libs/sdl_mixer \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && export LDFLAGS="-L$(PREFIX)/lib -L/usr/lib" && export CFLAGS="-I$(PREFIX)/include"&& export CPPFLAGS=-I$(PREFIX)/include && ./configure $(CONFIGUREOPTS)

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
