include ../../etc/la.conf

NAME=MPlayer
VERSION=0.90
FILE=$(NAME)-$(VERSION).tar.bz2
LOCATION=http://www1.mplayerhq.hu/MPlayer/releases/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--enable-dynamic-plugins --enable-menu --enable-gui
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/mplayer
DEPENDENCIES="media/mad \
	      libs/glib \
	      libs/gtk+ \
	      libs/jpeg \
	      libs/libpng \
	      libs/libvorbis \
	      libs/divx4linux \
	      libs/libfaad2 \
	      libs/zlib \
	      libs/sdl \
	      libs/freetype \
	      libs/aalib \
	      libs/ncurses \
             "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvjf $(FILE)

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
