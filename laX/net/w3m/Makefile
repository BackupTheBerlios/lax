include ../../etc/la.conf

NAME=w3m
VERSION=0.4.1
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://$(SOURCEFORGE)/sourceforge/w3m/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=-lang=en 
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/w3m
DEPENDENCIES="libs/zlib \
	      libs/openssl \
	      libs/imlib2 \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/.configured ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/.configured:
	cd $(DIR) && ./configure $(CONFIGUREOPTS)
	touch ./$(DIR)/.configured

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
