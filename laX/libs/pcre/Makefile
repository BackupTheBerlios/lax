include ../../etc/la.conf

NAME=pcre
VERSION=4.2
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=
DEPENDENCIES=

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
	
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
