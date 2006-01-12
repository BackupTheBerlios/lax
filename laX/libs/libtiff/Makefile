include ../../etc/la.conf

NAME=tiff
VERSION=3.8.0
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://ftp.remotesensing.org/pub/libtiff/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-jpeg-lib-dir=$(PREFIX)/lib --with-jpeg-include-dir=$(PREFIX)/include --disable-shared
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/dummy
DEPENDENCIES=

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/config.h ./$(TARGET)
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

$(DEPENDENCIES):
	make -C ../../$@ install
