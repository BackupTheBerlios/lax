include ../../etc/la.conf
NAME=fontconfig
VERSION=2.3.1
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://fontconfig.org/release/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-expat=$(PREFIX) --with-expat-includes=$(PREFIX)/include 
# uncomment the following if option is availible
#CONFIGUREOPTS=--enable-ipv6
TARGET=$(DIR)/src/fontconfig
DEPENDENCIES=libs/freetype2 \
	      libs/expat \
	     

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
