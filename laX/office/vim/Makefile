include ../../etc/la.conf

NAME=vim
VERSION=6.2
FILE=$(NAME)-$(VERSION).tar.bz2
LOCATION=ftp://ftp.vim.org/pub/vim/unix/
DIR=$(NAME)62
CONFIGUREOPTS+=--without-x --enable-gui=no
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=./$(DIR)/runtime/vim
DEPENDENCIES=" "

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	wget --passive-ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvjf $(FILE)

./$(DIR)/config.h:
	cd $(DIR) && ./configure $(CONFIGUREOPTS)

./$(TARGET):
	cd $(DIR)/src && make all
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
