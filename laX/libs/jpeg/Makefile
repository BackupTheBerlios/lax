include ../../etc/la.conf$(PREFIX)

NAME=jpegsrc
VERSION=v6b
FILE=$(NAME).$(VERSION).tar.gz
LOCATION=ftp://ftp.uu.net/graphics/jpeg/
DIR=jpeg-6b
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/libjpeg.a
DEPENDENCIES=""

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
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
	cp $(DIR)/libjpeg.a $(PREFIX)/lib
	cp $(DIR)/*.h $(PREFIX)/include
	
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
