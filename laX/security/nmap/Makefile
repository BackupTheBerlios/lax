include ../../etc/la.conf

NAME=nmap
VERSION=3.81
FILE=$(NAME)-$(VERSION).tgz
LOCATION=http://download.insecure.org/nmap/dist/

DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-libpcap=$(PREFIX) --enable-ipv6
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/nmap/nmap
DEPENDENCIES=libs/libpcap \
	      libs/gtk+ \
	     

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
