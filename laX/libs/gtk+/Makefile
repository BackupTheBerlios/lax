include ../../etc/la.conf
NAME=gtk+
VERSION=1.2.10
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://ftp.gtk.org/pub/gtk/v1.2/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--x-includes=/usr/X11R6/include --x-libraries=/usr/X11R6/lib --host=ppc
# uncomment the following if option is availible
#CONFIGUREOPTS=--enable-ipv6
TARGET=./$(DIR)/gtk/.libs/libgtk.a 
DEPENDENCIES=libs/glib \
	     

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
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

$(DEPENDENCIES):
	make -C ../../$@ install
