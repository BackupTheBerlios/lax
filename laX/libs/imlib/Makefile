include ../../etc/la.conf
NAME=imlib
VERSION=1.9.14
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://ftp.gnome.org/pub/GNOME/sources/imlib/1.9/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--disable-shm --enable-static=yes
# uncomment the following if option is availible
#CONFIGUREOPTS=--enable-ipv6
TARGET=$(DIR)/dummy
DEPENDENCIES="libs/gtk+ \
	      libs/libpng \
	      libs/libtiff \
	      libs/jpeg \
	      "
all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
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

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
