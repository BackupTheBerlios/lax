include ../../etc/la.conf
NAME=glob2
VERSION=0.8.6
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://www.ysagoon.com/glob2/data/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/src/glob2
DEPENDENCIES="libs/sdl \
	      libs/sdl_net \
	      libs/sdl_image \
	      libs/sdl_mixer \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && export CFLAGS="-L$(PREFIX)/lib -I$(PREFIX)/include -framework AppKit" && ./configure $(CONFIGUREOPTS)

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
	@echo --> checking dependencies of $(NAME)-$(VERSION)
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
	@echo --> installing $(NAME)-$(VERSION)
