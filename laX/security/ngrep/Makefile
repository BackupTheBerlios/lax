include ../../etc/la.conf

NAME=ngrep
VERSION=1.41
FILE=$(NAME)-$(VERSION).tar.bz2
LOCATION=http://$(SOURCEFORGE)/sourceforge/ngrep/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-pcap-includes=$(PREFIX)/include
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/ngrep
DEPENDENCIES="libs/libpcap \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/Makefile ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvjf $(FILE)

./$(DIR)/Makefile:
	cd $(DIR) && export CPPFLAGS=-DOSX && ./configure $(CONFIGUREOPTS)
#	patch -p0 < regex.patch

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

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
