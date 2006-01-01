include ../../etc/la.conf

NAME=ghostscript
VERSION=8.15
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://mirror.cs.wisc.edu/pub/mirrors/ghost/gnu/current/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/src/gs
DEPENDENCIES= libs/jpeg \
	      libs/libpng \
	      

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && export CFLAGS=-I$(PREFIX)/include LDFLAGS=-L$(PREFIX)/lib && ./configure $(CONFIGUREOPTS)

./$(TARGET):
	cd $(DIR) && make 
install: .installed-$(NAME)-$(VERSION)

.installed-$(NAME)-$(VERSION): 
	make all
	cd $(DIR) && make install
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

$(DEPENDENCIES):
	make -C ../../$@
