include ../../etc/la.conf
NAME=freetype
VERSION=1.3.1
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://$(SOURCEFORGE)/sourceforge/freetype/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--host=ppc
# uncomment the following if option is availible
#CONFIGUREOPTS=--enable-ipv6
TARGET=$(DIR)/lib/libttf.so
DEPENDENCIES="libs/gettext \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && export CC=gcc2 && export CFLAGS=-L$(PREFIX)/lib && ./configure $(CONFIGUREOPTS)

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
