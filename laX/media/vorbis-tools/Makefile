include ../../etc/la.conf

NAME=vorbis-tools
VERSION=1.0
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://www.vorbis.com/files/1.0/unix/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/ogg123/ogg123
DEPENDENCIES="libs/libogg \
	     libs/libvorbis \
	     libs/libao \
	     net/curl \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/Makefile ./$(TARGET)
$(FILE):
	wget $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/Makefile:
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
