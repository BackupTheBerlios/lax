include ../../etc/la.conf
NAME=xmame
VERSION=0.82.1
FILE=$(NAME)-$(VERSION).tar.bz2
LOCATION=http://x.mame.net/download/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/Dummy
DEPENDENCIES="libs/sdl \
              libs/zlib \
	      libs/sdl_mixer \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/.configured ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvjf $(FILE)

./$(DIR)/.configured:
	cd $(DIR) && patch -p0 <../SDL-makefile.patch
	touch $(DIR)/.configured

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
