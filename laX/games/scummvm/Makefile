include ../../etc/la.conf
NAME=scummvm
VERSION=0.6.0
FILE=$(NAME)-$(VERSION).tar.bz2
LOCATION=$(SOURCEFORGE)/scummvm/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS=--with-vorbis-prefix=$(PREFIX) --with-mad-prefix=$(PREFIX) \
	      --with-ogg-prefix=$(PREFIX) --with-mpeg2-prefix=$(PREFIX)
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/scummvm
DEPENDENCIES="libs/sdl \
	      libs/libvorbis \
	      libs/libmpeg2 \
	      media/mad \
	      libs/zlib \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvjf $(FILE)
	patch -p0 < scummvm-makefile.patch

./$(DIR)/config.h:
	cd $(DIR) && ./configure $(CONFIGUREOPTS)

./$(TARGET):
	cd $(DIR) && make all
install: .installed-$(NAME)-$(VERSION)

.installed-$(NAME)-$(VERSION): 
	make all
	cd $(DIR) && cp scummvm $(PREFIX)/bin
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
