include ../../etc/la.conf
NAME=mixmaster
VERSION=2.9.1
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://$(SOURCEFORGE)/sourceforge/mixmaster/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=
DEPENDENCIES="libs/openssl \
	      libs/zlib \
	      libs/pcre \
	      security/gnupg \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
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

dependencies:
	$(foreach DEP,$(DEPENDENCIES),$(make -C ../../$(DEP) install))
