include ../../etc/la.conf

NAME=mutt
VERSION=1.4.2.1
FILE=$(NAME)-$(VERSION)i.tar.gz
LOCATION=ftp://gd.tuwien.ac.at/infosys/mail/mutt/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=--with-ssl=/usr/local/ssl --enable-pop --enable-imap --with-regex --with-curses
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/mutt
DEPENDENCIES="libs/ncurses \
	      libs/openssl \
	      libs/regex \
	     "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
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
	@echo --> checking dependencies of $(NAME)-$(VERSION)
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
	@echo --> installing $(NAME)-$(VERSION)
