include ../../etc/la.conf
NAME=bzflag
VERSION=2.0.2.20050318
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=$(SOURCEFORGE)/bzflag/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-sdl-prefix=$(PREFIX)
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/bzflag
DEPENDENCIES=libs/sdl

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && export CFLAGS=-I$(PREFIX)/include CPPFLAGS=-I$(PREFIX)/include && ./configure $(CONFIGUREOPTS)

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
