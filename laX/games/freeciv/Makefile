include ../../etc/la.conf
NAME=freeciv
VERSION=2.0.0-beta7
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://ftp.freeciv.org/pub/freeciv/beta/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-sdl-prefix=$(PREFIX) --with-gtk-prefix=$(PREFIX) --with-imlib-prefix=$(PREFIX) --enable-client=gtk2 --with-xpm-prefix=/usr/X11R6 
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/client/civclient
DEPENDENCIES=libs/gtk2 \
	      libs/imlib \
	      libs/sdl \
	      libs/sdl_mixer \
	      libs/gettext \
	      

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && export CFLAGS="-I$(PREFIX)/include" LDFLAGS="-L$(PREFIX)/lib" && ./configure $(CONFIGUREOPTS)

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
