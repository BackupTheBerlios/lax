include ../../etc/la.conf

NAME=tcpdump
VERSION=3.8.3
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://www.tcpdump.org/release/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--enable-ipv6
TARGET=./$(DIR)/tcpdump
DEPENDENCIES=libs/libpcap \
	     

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
