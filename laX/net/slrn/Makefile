include ../../etc/la.conf
NAME=slrn
VERSION=0.9.8.0
FILE=$(NAME)-$(VERSION).tar.gz
LOCATION=$(SOURCEFORGE)/slrn/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/src/slang
DEPENDENCIES="lang/slang \
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
