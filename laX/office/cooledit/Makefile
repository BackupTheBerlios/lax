include ../../etc/la.conf
# thanx to fabian p0b melzow for this package
NAME=cooledit
VERSION=3.17.7
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://cooledit.sf.net/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--enable-NeXT-look
TARGET=./$(DIR)/editor/cooledit
DEPENDENCIES=

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
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
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
