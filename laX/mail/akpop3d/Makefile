include ../../etc/la.conf

NAME=akpop3d
VERSION=0.7.5
FILE=$(NAME)-$(VERSION).tar.bz2
LOCATION=http://synflood.at/akpop3d/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-openssl
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/akpop3d
DEPENDENCIES="libs/openssl \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvjf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && export LDFLAGS="-L/usr/local/ssl/lib" && ./configure $(CONFIGUREOPTS)

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
