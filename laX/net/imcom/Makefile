include ../../etc/la.conf
NAME=imcom
VERSION=1.33
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://lax.berlios.de/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/dummy
DEPENDENCIES=

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/Makefile ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/Makefile:
	patch -p0 < imcom-1.33_mihi.patch
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
