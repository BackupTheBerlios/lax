include ../../etc/la.conf

NAME=ethereal
VERSION=0.9.15
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://www.ethereal.com/distribution/
DIR=$(NAME)-$(VERSION)
#CONFIGUREOPTS+=
# uncomment the following if option is availible
CONFIGUREOPTS+=--enable-ipv6 --with-ssl --with-zlib --with-ssl  --without-plugins
TARGET=$(DIR)/ethereal
DEPENDENCIES="libs/libpcap \
	      libs/gtk+ \
	      libs/glib2 \
	      libs/zlib \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)
	ln -s $(DIR) ethereal

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
	rm -f ethereal
dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
