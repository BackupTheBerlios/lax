include ../../etc/la.conf

NAME=openssl
VERSION=0.9.7e
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://www.openssl.org/source/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=-shared 
TARGET=./$(DIR)/libssl.a
DEPENDENCIES="libs/zlib \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h $(TARGET)
$(FILE):
	wget $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && ./config $(CONFIGUREOPTS)

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

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
	         
