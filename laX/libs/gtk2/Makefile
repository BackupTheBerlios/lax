include ../../etc/la.conf
NAME=gtk+
VERSION=2.6.4
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://ftp.gtk.org/pub/gtk/v2.6/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS=--enable-ipv6
TARGET=$(DIR)/dummy
DEPENDENCIES=libs/pkgconfig \
	      libs/jpeg \
	      libs/libpng \
	      libs/libtiff \
	      libs/glib2 \
	      libs/pango \
	      libs/atk \
	      

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && export CPPFLAGS=-I$(PREFIX)/include && export CFLAGS=-I$(PREFIX)/include && export LDFLAGS=-L$(PREFIX)/lib && ./configure $(CONFIGUREOPTS)

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
