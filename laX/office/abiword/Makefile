include ../../etc/la.conf

NAME=abiword
VERSION=1.0.5
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://$(SOURCEFORGE)/sourceforge/abiword/


DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/abiword
DEPENDENCIES="libs/gtk+ \
	      libs/glib \
	      libs/libpng \
	      libs/zlib \
	      libs/jpeg \
	      libs/expat \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/abi/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/abi/config.h:
	cd $(DIR)/abi && ./configure $(CONFIGUREOPTS)

./$(TARGET):
	cd $(DIR)/abi && make all
install: .installed-$(NAME)-$(VERSION)

.installed-$(NAME)-$(VERSION): 
	make all
	cd $(DIR)/abi && make install
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
