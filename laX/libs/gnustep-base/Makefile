include ../../etc/la.conf
NAME=gnustep-base
VERSION=1.7.1
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://ftpmain.gnustep.org/pub/gnustep/core/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--disable-do
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/dummy
DEPENDENCIES="libs/gnustep-make \
	      libs/libxml2 \
	      libs/libiconv \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	. $(PREFIX)/System/Makefiles/GNUstep.sh
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
