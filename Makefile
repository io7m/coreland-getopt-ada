# auto generated - do not edit

default: all

all:\
UNIT_TESTS/noarg1 UNIT_TESTS/noarg1.ali UNIT_TESTS/noarg1.o UNIT_TESTS/noarg2 \
UNIT_TESTS/noarg2.ali UNIT_TESTS/noarg2.o UNIT_TESTS/stdrun \
UNIT_TESTS/stdrun.ali UNIT_TESTS/stdrun.o ctxt/bindir.o ctxt/ctxt.a \
ctxt/dlibdir.o ctxt/incdir.o ctxt/repos.o ctxt/slibdir.o ctxt/version.o \
deinstaller deinstaller.o getopt-ada-conf getopt-ada-conf.o getopt-ada.a \
getopt.ali getopt.o install-core.o install-error.o install-posix.o \
install-win32.o install.a installer installer.o instchk instchk.o insthier.o

# Mkf-deinstall
deinstall: deinstaller conf-sosuffix
	./deinstaller
deinstall-dryrun: deinstaller conf-sosuffix
	./deinstaller dryrun

# Mkf-install
install: installer postinstall conf-sosuffix
	./installer
	./postinstall

install-dryrun: installer conf-sosuffix
	./installer dryrun

# Mkf-instchk
install-check: instchk conf-sosuffix
	./instchk

# Mkf-test
tests:
	(cd UNIT_TESTS && make)
tests_clean:
	(cd UNIT_TESTS && make clean)

UNIT_TESTS/noarg1:\
ada-bind ada-link UNIT_TESTS/noarg1.ald UNIT_TESTS/noarg1.ali getopt.ali
	./ada-bind UNIT_TESTS/noarg1.ali
	./ada-link UNIT_TESTS/noarg1 UNIT_TESTS/noarg1.ali

UNIT_TESTS/noarg1.ali:\
ada-compile UNIT_TESTS/noarg1.adb getopt.ads
	./ada-compile UNIT_TESTS/noarg1.adb

UNIT_TESTS/noarg1.o:\
UNIT_TESTS/noarg1.ali

UNIT_TESTS/noarg2:\
ada-bind ada-link UNIT_TESTS/noarg2.ald UNIT_TESTS/noarg2.ali getopt.ali
	./ada-bind UNIT_TESTS/noarg2.ali
	./ada-link UNIT_TESTS/noarg2 UNIT_TESTS/noarg2.ali

UNIT_TESTS/noarg2.ali:\
ada-compile UNIT_TESTS/noarg2.adb getopt.ads
	./ada-compile UNIT_TESTS/noarg2.adb

UNIT_TESTS/noarg2.o:\
UNIT_TESTS/noarg2.ali

UNIT_TESTS/stdrun:\
ada-bind ada-link UNIT_TESTS/stdrun.ald UNIT_TESTS/stdrun.ali getopt.ali
	./ada-bind UNIT_TESTS/stdrun.ali
	./ada-link UNIT_TESTS/stdrun UNIT_TESTS/stdrun.ali

UNIT_TESTS/stdrun.ali:\
ada-compile UNIT_TESTS/stdrun.adb getopt.ads
	./ada-compile UNIT_TESTS/stdrun.adb

UNIT_TESTS/stdrun.o:\
UNIT_TESTS/stdrun.ali

ada-bind:\
conf-adabind conf-systype conf-adatype conf-adafflist flags-cwd

ada-compile:\
conf-adacomp conf-adatype conf-systype conf-adacflags conf-adafflist flags-cwd

ada-link:\
conf-adalink conf-adatype conf-systype

ada-srcmap:\
conf-adacomp conf-adatype conf-systype

ada-srcmap-all:\
ada-srcmap conf-adacomp conf-adatype conf-systype

cc-compile:\
conf-cc conf-cctype conf-systype

cc-link:\
conf-ld conf-ldtype conf-systype

cc-slib:\
conf-systype

conf-adatype:\
mk-adatype
	./mk-adatype > conf-adatype.tmp && mv conf-adatype.tmp conf-adatype

conf-cctype:\
conf-cc mk-cctype
	./mk-cctype > conf-cctype.tmp && mv conf-cctype.tmp conf-cctype

conf-ldtype:\
conf-ld mk-ldtype
	./mk-ldtype > conf-ldtype.tmp && mv conf-ldtype.tmp conf-ldtype

conf-sosuffix:\
mk-sosuffix
	./mk-sosuffix > conf-sosuffix.tmp && mv conf-sosuffix.tmp conf-sosuffix

conf-systype:\
mk-systype
	./mk-systype > conf-systype.tmp && mv conf-systype.tmp conf-systype

# ctxt/bindir.c.mff
ctxt/bindir.c: mk-ctxt conf-bindir
	rm -f ctxt/bindir.c
	./mk-ctxt ctxt_bindir < conf-bindir > ctxt/bindir.c

ctxt/bindir.o:\
cc-compile ctxt/bindir.c
	./cc-compile ctxt/bindir.c

ctxt/ctxt.a:\
cc-slib ctxt/ctxt.sld ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o ctxt/repos.o \
ctxt/slibdir.o ctxt/version.o
	./cc-slib ctxt/ctxt ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o ctxt/repos.o \
	ctxt/slibdir.o ctxt/version.o

# ctxt/dlibdir.c.mff
ctxt/dlibdir.c: mk-ctxt conf-dlibdir
	rm -f ctxt/dlibdir.c
	./mk-ctxt ctxt_dlibdir < conf-dlibdir > ctxt/dlibdir.c

ctxt/dlibdir.o:\
cc-compile ctxt/dlibdir.c
	./cc-compile ctxt/dlibdir.c

# ctxt/incdir.c.mff
ctxt/incdir.c: mk-ctxt conf-incdir
	rm -f ctxt/incdir.c
	./mk-ctxt ctxt_incdir < conf-incdir > ctxt/incdir.c

ctxt/incdir.o:\
cc-compile ctxt/incdir.c
	./cc-compile ctxt/incdir.c

# ctxt/repos.c.mff
ctxt/repos.c: mk-ctxt conf-repos
	rm -f ctxt/repos.c
	./mk-ctxt ctxt_repos < conf-repos > ctxt/repos.c

ctxt/repos.o:\
cc-compile ctxt/repos.c
	./cc-compile ctxt/repos.c

# ctxt/slibdir.c.mff
ctxt/slibdir.c: mk-ctxt conf-slibdir
	rm -f ctxt/slibdir.c
	./mk-ctxt ctxt_slibdir < conf-slibdir > ctxt/slibdir.c

ctxt/slibdir.o:\
cc-compile ctxt/slibdir.c
	./cc-compile ctxt/slibdir.c

# ctxt/version.c.mff
ctxt/version.c: mk-ctxt VERSION
	rm -f ctxt/version.c
	./mk-ctxt ctxt_version < VERSION > ctxt/version.c

ctxt/version.o:\
cc-compile ctxt/version.c
	./cc-compile ctxt/version.c

deinstaller:\
cc-link deinstaller.ld deinstaller.o insthier.o install.a ctxt/ctxt.a
	./cc-link deinstaller deinstaller.o insthier.o install.a ctxt/ctxt.a

deinstaller.o:\
cc-compile deinstaller.c install.h
	./cc-compile deinstaller.c

getopt-ada-conf:\
cc-link getopt-ada-conf.ld getopt-ada-conf.o ctxt/ctxt.a
	./cc-link getopt-ada-conf getopt-ada-conf.o ctxt/ctxt.a

getopt-ada-conf.o:\
cc-compile getopt-ada-conf.c ctxt.h
	./cc-compile getopt-ada-conf.c

getopt-ada.a:\
cc-slib getopt-ada.sld getopt.o
	./cc-slib getopt-ada getopt.o

getopt.ali:\
ada-compile getopt.adb getopt.ads
	./ada-compile getopt.adb

getopt.o:\
getopt.ali

install-core.o:\
cc-compile install-core.c install.h
	./cc-compile install-core.c

install-error.o:\
cc-compile install-error.c install.h
	./cc-compile install-error.c

install-posix.o:\
cc-compile install-posix.c install.h
	./cc-compile install-posix.c

install-win32.o:\
cc-compile install-win32.c install.h
	./cc-compile install-win32.c

install.a:\
cc-slib install.sld install-core.o install-posix.o install-win32.o \
install-error.o
	./cc-slib install install-core.o install-posix.o install-win32.o \
	install-error.o

install.h:\
install_os.h

installer:\
cc-link installer.ld installer.o insthier.o install.a ctxt/ctxt.a
	./cc-link installer installer.o insthier.o install.a ctxt/ctxt.a

installer.o:\
cc-compile installer.c install.h
	./cc-compile installer.c

instchk:\
cc-link instchk.ld instchk.o insthier.o install.a ctxt/ctxt.a
	./cc-link instchk instchk.o insthier.o install.a ctxt/ctxt.a

instchk.o:\
cc-compile instchk.c install.h
	./cc-compile instchk.c

insthier.o:\
cc-compile insthier.c ctxt.h install.h
	./cc-compile insthier.c

mk-adatype:\
conf-adacomp conf-systype

mk-cctype:\
conf-cc conf-systype

mk-ctxt:\
mk-mk-ctxt
	./mk-mk-ctxt

mk-ldtype:\
conf-ld conf-systype conf-cctype

mk-mk-ctxt:\
conf-cc conf-ld

mk-sosuffix:\
conf-systype

mk-systype:\
conf-cc conf-ld

clean-all: tests_clean obj_clean ext_clean
clean: obj_clean
obj_clean:
	rm -f UNIT_TESTS/noarg1 UNIT_TESTS/noarg1.ali UNIT_TESTS/noarg1.o \
	UNIT_TESTS/noarg2 UNIT_TESTS/noarg2.ali UNIT_TESTS/noarg2.o UNIT_TESTS/stdrun \
	UNIT_TESTS/stdrun.ali UNIT_TESTS/stdrun.o ctxt/bindir.c ctxt/bindir.o \
	ctxt/ctxt.a ctxt/dlibdir.c ctxt/dlibdir.o ctxt/incdir.c ctxt/incdir.o \
	ctxt/repos.c ctxt/repos.o ctxt/slibdir.c ctxt/slibdir.o ctxt/version.c \
	ctxt/version.o deinstaller deinstaller.o getopt-ada-conf getopt-ada-conf.o \
	getopt-ada.a getopt.ali getopt.o install-core.o install-error.o install-posix.o \
	install-win32.o install.a installer installer.o instchk instchk.o insthier.o
ext_clean:
	rm -f conf-adatype conf-cctype conf-ldtype conf-sosuffix conf-systype mk-ctxt

regen:\
ada-srcmap ada-srcmap-all
	./ada-srcmap-all
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile
