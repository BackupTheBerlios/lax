include ../../etc/la.conf
NAME=cvs
VERSION=1.11.13
FILE=$(NAME)-$(VERSION).tar.bz2
LOCATION=http://ftp.cvshome.org/release/stable/cvs-$(VERSION)/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/src/cvs
DEPENDENCIES=

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
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
	cd $(DIR) && make install
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	@echo --> checking dependencies of $(NAME)-$(VERSION)
	sh ../../etc/checkdep.sh 
	@echo --> installing $(NAME)-$(VERSION)
