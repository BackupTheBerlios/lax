include ../../etc/la.conf
NAME=freetype
VERSION=2.1.9
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://gd.tuwien.ac.at/publishing/freetype/freetype2/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS=--enable-ipv6
TARGET=src/libfreetype.a
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
