include ../../etc/la.conf

NAME=magicpoint
VERSION=1.10a
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://ftp.mew.org/pub/mgp/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--build=ppc --host=ppc
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/mgp
DEPENDENCIES="libs/freetype \
	      libs/libpng \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && ./configure $(CONFIGUREOPTS)

./$(TARGET):
	cd $(DIR) && xmkmf
	cd $(DIR) && make Makefiles
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
