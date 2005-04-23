include ../../etc/la.conf

NAME=libungif
VERSION=4.1.0
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://www.ibiblio.org/pub/Linux/libs/graphics/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--host=ppc
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=
DEPENDENCIES=comp/libtool \
               

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && ./configure $(CONFIGUREOPTS)
	cp $(PREFIX)/bin/libtool $(DIR)

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
