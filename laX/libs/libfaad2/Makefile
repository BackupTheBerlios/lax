include ../../etc/la.conf

NAME=faad2
VERSION=1.1
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=http://www.audiocoding.com/files/
DIR=$(NAME)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=
DEPENDENCIES="libs/libsndfile \
             "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && sh bootstrap
	cd $(DIR) && ./configure $(CONFIGUREOPTS)

./$(TARGET):
	cd $(DIR)/libfaad && make all
install: .installed-$(NAME)-$(VERSION)

.installed-$(NAME)-$(VERSION): 
	make all
	cd $(DIR)/libfaad && make install
	
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
