include ../../etc/la.conf
NAME=autotrace
VERSION=0.31.1
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=$(SOURCEFORGE)/autotrace/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/autotrace
DEPENDENCIES="libs/libpng \
	      libs/zlib \
	      "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && export CFLAGS="-I$(PREFIX)/include -L$(PREFIX)/lib" && ./configure $(CONFIGUREOPTS)

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
	@echo --> checking dependencies of $(NAME)-$(VERSION)
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
	@echo --> installing $(NAME)-$(VERSION)
