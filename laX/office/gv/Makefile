include ../../etc/la.conf

NAME=gv
VERSION=3.5.8
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://ftpthep.physik.uni-mainz.de/pub/gv/unix/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/source/gv
DEPENDENCIES="office/ghostscript \
	      X/Xaw3d \
	     "

all: $(FILE) $(DIR) dependencies ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && ./configure $(CONFIGUREOPTS)

./$(TARGET):
	cd $(DIR) && xmkmf
	cd $(DIR) && make Makefiles
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
