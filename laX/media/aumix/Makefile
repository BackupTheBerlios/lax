include ../../etc/la.conf

NAME=aumix
VERSION=2.8
FILE=$(NAME)-$(VERSION).tar.bz2
LOCATION=http://jpj.net/~trevor/aumix/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--without-gtk1
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=./$(DIR)/src/aumix
DEPENDENCIES="libs/gtk2 \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvjf $(FILE)

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

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
