include ../../etc/la.conf
NAME=libtool
VERSION=1.5.8
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://ftp.gnu.org/gnu/libtool/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=
DEPENDENCIES=

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/Makefile ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
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
$(DEPENDENCIES):
	make -C ../../$@ install
