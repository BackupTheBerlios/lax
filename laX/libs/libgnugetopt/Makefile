include ../../etc/la.conf
NAME=libgnugetopt
VERSION=1.2
FILE=$(NAME)-$(VERSION).tar.bz2
LOCATION=ftp://ftp.freebsd.org/pub/FreeBSD/distfiles/
DIR=$(NAME)-$(VERSION)
CONFIGUREOPTS+=
# uncomment the following if option is availible
#CONFIGUREOPTS+=--enable-ipv6
TARGET=$(DIR)/libgnugetopt.dylib
DEPENDENCIES=

all: $(FILE) $(DIR) dependencies ./$(DIR)/config.h ./$(TARGET)
$(FILE):
	ftp $(LOCATION)$(FILE)
	md5sum -c md5
$(DIR):
	tar -xvjf $(FILE)
	cd $(DIR); patch -p0 <../patch-configure.ac ; patch -p0 <../patch-Makefile.am; aclocal -I . ; glibtoolize --automake; automake --add-missing; autoconf 

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
