include ../../etc/la.conf

NAME=tetex
VERSION=2.0.2
FILE=$(NAME)-src-$(VERSION).tar.gz
LOCATION=ftp://cam.ctan.org/tex-archive/systems/unix/teTeX/current/distrib/
DIR=$(NAME)-src-$(VERSION)
CONFIGUREOPTS+=--bindir=$(PREFIX)/bin --with-system-t1lib --with-system-zlib --with-system-pnglib
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
MFFILE=$(NAME)-texmf-$(VERSION).tar.gz
TARGET=$(DIR)/texk/tetex/tetex
DEPENDENCIES="libs/zlib \
	      libs/libpng \
	      libs/t1lib \
	     "

all: $(FILE) $(MFFILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
$(MFFILE):
	wget --passive-ftp $(LOCATION)$(MFFILE)
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
	mkdir -p $(PREFIX)/share/texmf
	cp $(MFFILE) $(PREFIX)/share/texmf 
	cd $(PREFIX)/share/texmf && tar -xvzf $(MFFILE)
	cd $(DIR) && make install
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -f $(MFFILE)
	rm -rf $(DIR)

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
