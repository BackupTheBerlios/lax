include ../../etc/la.conf$(PREFIX)

NAME=jpegsrc
VERSION=v6b
FILE=$(NAME).$(VERSION).tar.gz
LOCATION=ftp://ftp.uu.net/graphics/jpeg/
DIR=jpeg-6b
CONFIGUREOPTS+=--enable-shared
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/libjpeg.a
DEPENDENCIES=comp/libtool

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && ./configure $(CONFIGUREOPTS)
	cp $(PREFIX)/bin/libtool $(DIR)

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
