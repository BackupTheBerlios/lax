include ../../etc/la.conf

NAME=zlib
VERSION=1.2.1
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://www.gzip.org/zlib/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--shared
TARGET=./$(DIR)/libz.a

all: $(FILE) $(DIR) ./$(DIR)/config.h $(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5

$(DIR):
	tar -xvzf $(FILE)

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
	         
