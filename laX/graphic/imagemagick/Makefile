include ../../etc/la.conf
NAME=ImageMagick
VERSION=5.5.7
FILE=$(NAME)-$(VERSION)-16.tar.gz
LOCATION=ftp://ftp.imagemagick.org/pub/ImageMagick/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/magick/imagemagick
DEPENDENCIES="libs/jpeg \
	      libs/libtiff \
	      libs/libpng \
	      libs/zlib \
	      misc/bzip2 \
	      libs/libungif \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR)&& export CFLAGS=-I/opt/la/include CPPFLAGS=-I/opt/la/include  && ./configure $(CONFIGUREOPTS)

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
