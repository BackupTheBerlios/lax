include ../../etc/la.conf
NAME=aalib
VERSION=1.4rc5
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://$(SOURCEFORGE)/sourceforge/aa-project/
DIR=$(NAME)-1.4.0
CONFIGUREOPTS+=--with-x11-driver=no
# uncomment the following if option is availible
#CONFIGUREOPTS=--enable-ipv6
TARGET=$(DIR)/src/libaa.la
DEPENDENCIES=

all: $(FILE) $(DIR) dependencies ./$(DIR)/src/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/src/config.h:
	patch -p0 < aalib-macosX.patch
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
