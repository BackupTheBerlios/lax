include ../../etc/la.conf

NAME=openssh
VERSION=3.7.1p2
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--enable-ipv6 --with-md5-passwords --with-ssl-dir=/opt/la
TARGET=./$(DIR)/sshd
DEPENDENCIES="libs/zlib \
	      libs/openssl \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h $(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && ./configure $(CONFIGUREOPTS)

$(TARGET):
#	cp mk.sh $(DIR)
	 cd $(DIR) && make
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
