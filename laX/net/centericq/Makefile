include ../../etc/la.conf
NAME=centericq
VERSION=4.9.10
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://konst.org.ua/download/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--disable-yahoo --with-openssl=$(PREFIX)/ssl
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/centericq
DEPENDENCIES="libs/openssl \
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
