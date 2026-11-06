
# always regenerate
.PHONY: airstrike airstrike-sound

airstrike:
	$(MAKE) -C src airstrike
	mv src/airstrike .

# note: do 'make clean' between sound changing
airstrike-sound:
	$(MAKE) -C src OPTIONS=-DUSE_SOUND airstrike-sound
	mv src/airstrike-sound airstrike

clean:
	$(RM) $(shell find . -name '*.[od]' -o -name '*~')
	$(RM) airstrike


# package name and what to exclude from it
PKG_NAME = airstrike-$(shell date -I)
EXCLUDE = --exclude '*/pov/*.png' --exclude '*/contrib*'

package: clean
	cd ..; \
	mv airstrike $(PKG_NAME); \
	tar -zcvf $(PKG_NAME).tar.gz $(EXCLUDE) $(PKG_NAME); \
	mv $(PKG_NAME) airstrike

# packages new files listed in new-files.txt
new:
	tar -zcvf new.tgz -T new-files.txt

install:
	install -d $(DESTDIR)/usr/games
	install airstrike $(DESTDIR)/usr/games/airstrike
	install -d $(DESTDIR)/usr/share/games/airstrike
	install -d $(DESTDIR)/usr/share/games/airstrike/sound
	install -m 644 data/*.png $(DESTDIR)/usr/share/games/airstrike
	install -m 644 data/*.txt $(DESTDIR)/usr/share/games/airstrike
#	install -m 644 data/sound/*.wav $(DESTDIR)/usr/share/games/airstrike/sound
	install -d $(DESTDIR)/etc
	install -m 644 airstrikerc $(DESTDIR)/etc/airstrikerc

