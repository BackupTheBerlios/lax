include ../../etc/la.conf
NAME=libtool
VERSION=1.5.2
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://ftp.gnu.org/gnu/libtool/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=
DEPENDENCIES=

all: $(FILE) $(DIR) dependencies ./$(DIR)/Makefile ./$(TARGET)
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

dependencies:
	$(foreach DEP,$(DEPENDENCIES),$(make -C ../../$(DEP) install))
