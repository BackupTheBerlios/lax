include ../../etc/la.conf

NAME=efax
VERSION=0.9
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=ftp://ftp.metalab.unc.edu/pub/Linux/apps/serialcomm/fax/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/efax
DEPENDENCIES=

all: $(FILE) $(DIR) dependencies ./$(TARGET)
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
	/sbin/
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
