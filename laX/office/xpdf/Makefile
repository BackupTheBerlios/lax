include ../../etc/la.conf

NAME=xpdf
VERSION=2.02pl1
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://ftp.foolabs.com/pub/xpdf/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-freetype2-includes=$(PREFIX)/freetype2 

# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/xpdf/xpdf
DEPENDENCIES="libs/freetype2 \
	      libs/t1lib \
	      "

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
