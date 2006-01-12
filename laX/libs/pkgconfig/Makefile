include ../../etc/la.conf

NAME=pkg-config
VERSION=0.19
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://pkgconfig.freedesktop.org/releases/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/pkg-config
DEPENDENCIES=

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && export CFLAGS=-I$(PREFIX)/include && ./configure $(CONFIGUREOPTS)

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
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
