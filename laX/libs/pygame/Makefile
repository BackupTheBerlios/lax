include ../../etc/la.conf

NAME=pygame
VERSION=1.5.5
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://pygame.org/ftp/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/pygame.py
DEPENDENCIES="libs/sdl_mixer \
 	      libs/sdl \
	      libs/sdl_ttf \
	      libs/sdl_image \
	      libs/smpeg \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/Setup 
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/Setup:
	cd $(DIR) && /usr/local/bin/python config.py

install: .installed-$(NAME)-$(VERSION)

.installed-$(NAME)-$(VERSION): 
	make all
	cd $(DIR) && /usr/local/bin/python setup.py
	
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
