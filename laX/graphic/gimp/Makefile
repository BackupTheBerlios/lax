include ../../etc/la.conf
NAME=gimp
VERSION=1.2.5
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://gd.tuwien.ac.at/graphics/gimp/gimp/v1.2/v$(VERSION)/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--disable-print --disable-mpeg --disable-static --with-shm=none
# uncomment the following if option is availible
#CONFIGUREOPTS=--enable-ipv6
TARGET=$(DIR)/gimp
DEPENDENCIES="libs/gtk+ \
	      libs/jpeg \
	      libs/libpng \
	      libs/libtiff \
	      libs/libungif \
	      libs/aalib \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	patch -p0 < regex.patch
	cd $(DIR) && export CFLAGS=-I$(PREFIX)/include CPPFLAGS="-I$(PREFIX)/include -DMACOSX" && ./configure $(CONFIGUREOPTS)

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
