include ../../etc/la.conf
NAME=scummvm-tools
VERSION=0.6.0
FILE=$(NAME)-$(VERSION).tar.bz2
LOCATION=$(SOURCEFORGE)/scummvm/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/simon2mp3
DEPENDENCIES=

all: $(FILE) $(DIR) dependencies ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvjf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && ./configure $(CONFIGUREOPTS)

./$(TARGET):
	cd $(DIR) && make all
install: .installed-$(NAME)-$(VERSION)

.installed-$(NAME)-$(VERSION): 
	make all
	cd $(DIR) && cp convbdf descumm desword2 extract md5table \
	mm_nes_extract queenrebuild rescumm simon1decr simon2mp3 \
	$(PREFIX)/bin
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
