include ../../etc/la.conf
NAME=pygtk
VERSION=2.0.0
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://ftp.gtk.org/pub/gtk/python/v2.0/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS=--prefix=/usr
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/dummy
DEPENDENCIES="libs/gtk2 \
	      libs/glib2 \
	      libs/atk \
	      libs/pango \
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
