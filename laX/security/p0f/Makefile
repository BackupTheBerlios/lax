include ../../etc/la.conf
NAME=p0f
VERSION=2.0.3
FILE=$(NAME)-$(VERSION).tgz
LOCATION=http://lcamtuf.coredump.cx/p0f/
DIR=$(NAME)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/p0f
DEPENDENCIES=

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvzf $(FILE)
	mv $(DIR)/config.h $(DIR)/config.h.orig

./$(DIR)/config.h:
	sed s-/etc/p0f-$(PREFIX)/etc/p0f- $(DIR)/config.h.orig > $(DIR)/config.h

./$(TARGET):
	cd $(DIR) && make all
install: .installed-$(NAME)-$(VERSION)

.installed-$(NAME)-$(VERSION): 
	make all
	cp $(DIR)/p0f $(DIR)/p0frep $(PREFIX)/bin
	mkdir -p $(PREFIX)/etc/p0f
	cp $(DIR)/*.fp $(PREFIX)/etc/p0f
	touch .installed-$(NAME)-$(VERSION)

clean:
	rm -f $(FILE)
	rm -rf $(DIR)

dependencies:
	@echo --> checking dependencies of $(NAME)-$(VERSION)
	sh ../../etc/checkdep.sh $(DEPENDENCIES)
	@echo --> installing $(NAME)-$(VERSION)
