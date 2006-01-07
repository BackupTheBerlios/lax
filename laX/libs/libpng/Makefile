include ../../etc/la.conf

NAME=libpng
VERSION=1.2.8
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=$(SOURCEFORGE)/libpng/
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
	cp $(DIR)/scripts/makefile.darwin $(DIR)/Makefile
	cp $(DIR)/Makefile $(DIR)/Makefile.old
	sed s-prefix=/usr/local-prefix=$(PREFIX)- $(DIR)/Makefile.old > $(DIR)/Makefile

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
