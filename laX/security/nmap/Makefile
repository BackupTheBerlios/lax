include ../../etc/la.conf

NAME=nmap
VERSION=3.30
FILE=$(NAME)-$(VERSION).tgz
LOCATION=http://download.insecure.org/nmap/dist/

DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-libpcap=/usr/local --enable-ipv6
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/nmap/nmap
DEPENDENCIES="libs/libpcap \
	      libs/gtk+ \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget $(LOCATION)$(FILE)
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

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
