include ../../etc/la.conf
NAME=spl
VERSION=snapshot-2005-03-25
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://www.clifford.at/spl/snapshots/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/splrun
DEPENDENCIES=libs/expat \
	     libs/pcre \
	     libs/sqlite \

all: $(FILE) $(DIR) $(DEPENDENCIES) ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)


./$(TARGET):
	cd $(DIR) && make EXTRA_CFLAGS="-I$(PREFIX)/include" EXTRA_LDFLAGS=-L$(PREFIX)/lib all
install: .installed-$(NAME)-$(VERSION)

.installed-$(NAME)-$(VERSION): 
	make all
	mkdir -p $(PREFIX)/share/spl/modules
	cp $(TARGET) $(PREFIX)/bin
	cp $(DIR)/modules/*.so $(DIR)/modules/*.splb $(PREFIX)/share/spl/modules 
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

$(DEPENDENCIES): 
	make -C ../../$@ install
