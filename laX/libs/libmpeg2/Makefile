include ../../etc/la.conf
NAME=mpeg2dec
VERSION=0.4.0
FILE=$(NAME)-$(VERSION)b.tar.gz
LOCATION=http://libmpeg2.sourceforge.net/files/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--disable-sdl
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/dummy
DEPENDENCIES=
	     

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
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

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
