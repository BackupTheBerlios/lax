include ../../etc/la.conf
NAME=spl
VERSION=0.9c
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://www.clifford.at/spl/releases/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/splrun
DEPENDENCIES=libs/pcre \

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)


./$(TARGET):
	cd $(DIR) && make EXTRA_CFLAGS="-I$(PREFIX)/include" EXTRA_LDFLAGS=-L$(PREFIX)/lib all
install: .installed-$(NAME)-$(VERSION)

.installed-$(NAME)-$(VERSION): 
	make -C $(DIR) install
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

$(DEPENDENCIES): 
	make -C ../../$@ install
