include ../../etc/la.conf

NAME=vorbis-tools
VERSION=1.0.1
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://www.vorbis.com/files/$(VERSION)/unix/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-libiconv-prefix=$(PREFIX)
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/ogg123/ogg123
DEPENDENCIES="libs/libogg \
	     libs/libvorbis \
	     libs/libao \
	     net/curl \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/Makefile ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/Makefile:
	cd $(DIR) && export CFLAGS="-I$(PREFIX)/include" && ./configure $(CONFIGUREOPTS)

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
