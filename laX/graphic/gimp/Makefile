include ../../etc/la.conf
NAME=gimp
VERSION=2.2.4
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://ftp.gimp.org/pub/gimp/v2.2/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS=--enable-ipv6
TARGET=$(DIR)/gimp
DEPENDENCIES=libs/gtk2 \
	      libs/jpeg \
	      libs/libpng \
	      libs/libtiff \
	      libs/libungif \
	      libs/aalib \
	      

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
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

$(DEPENDENCIES):
	make -C ../../$@ install
