include ../../etc/la.conf

NAME=zlib
VERSION=1.1.4
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://www.libpng.org/pub/png/src/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--shared
TARGET=./$(DIR)/libz.a

all: $(FILE) $(DIR) ./$(DIR)/config.h $(TARGET)
$(FILE):
	wget $(LOCATION)$(FILE)
	md5sum -c md5

$(DIR):
	tar -xvzf $(FILE)
	patch -p0 <zlib-vnsprintf.patch

./$(DIR)/config.h:
	cd $(DIR) && ./configure $(CONFIGUREOPTS)

$(TARGET):
	cd $(DIR) && make all
install: .installed-$(NAME)-$(VERSION)

.installed-$(NAME)-$(VERSION): 
	make all
	cd $(DIR) && make install
	
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)
	         
