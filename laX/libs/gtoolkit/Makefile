include ../../etc/la.conf
NAME=gtoolkit
VERSION=0.9.5
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://ftp.inf.uos.de/pub/elmar/gtk/objc-gtoolkit/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-gnustep
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/GToolKit/gtoolkit
DEPENDENCIES="libs/gnustep-base \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && export CC=gcc2 &&  ./configure $(CONFIGUREOPTS)

./$(TARGET):
	cd $(DIR)/GToolKit && make 
install: .installed-$(NAME)-$(VERSION)

.installed-$(NAME)-$(VERSION): 
	make all
	cd $(DIR)/GToolKit && make install
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
