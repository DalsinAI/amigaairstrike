Airstrike 1.0pre6a for AmigaOS 3.x
==================================

Airstrike (Ulf Ekström and others, https://icculus.org/airstrike/), the
2D biplane dogfighting game in the style of Biplanes and Sopwith: two
players on one keyboard, or one against the computer, with bombs,
balloons, zeppelins and birds. For AmigaOS 3.x on a 68040 or 68060 with an
FPU and an RTG screen, on OpenGPU's SDL 1.2 (sdl12-compat).

Base: airstrike_0.99+1.0pre6a.orig.tar.gz from Debian (sha256
bbc52e48b3f293b0ffd8ffe0b0fd9da9d5b3886561fc3bb16f858e797823d78b), with
Debian's patches 0.99+1.0pre6a-12 as the second commit. Branch
team2/airstrike-amiga.

Status: runs in the lab (Instance-45 on GFOpenUp 0.8.19, 6 November
2026): the start screen, a game (the sky, clouds, zeppelin, balloons, the
cannon firing, both barons' gauges and the score), the Escape menu and
Quit game back to the Shell. Not yet tried: flying a plane from the keys.


What you need
-------------

- A 68040 or 68060 with an FPU, AmigaOS 3.x, an RTG card (or the
  AmigaChrome lab).
- GFOpenUp 0.8.18 or later (LIBS:OpenGPU/SDL2.module). Everything else is
  in the program.


How to play
-----------

Open the Airstrike icon, or run Airstrike from a Shell. The settings are
in the drawer's airstrikerc (window size, full screen); the pictures are
in data/. Red Baron: Left and Right turn, comma accelerates, full stop
fires; Blue Baron: D and F turn, Ctrl accelerates, Shift fires; Escape is
the menu (Players setup chooses who is human). Like Debian's package it has no sound: the source
has no sound files.



Standard keys
-------------

Every AmiCradle game has the same keys on Right Amiga (GFOpenUp's
SDL2.module, after 0.8.26):

- Right Amiga + F: window or full screen, remembered for next time
- Right Amiga + P: pause (Right Amiga + P again goes on)
- Right Amiga + Q: quit
- Right Amiga + M: free the mouse pointer, or let the game take it again
- Right Amiga + S: a screenshot in the drawer's Screenshots
- Help: this game's keys (the drawer's Controls file)
- Right Amiga + F1, F2: F11, F12; Right Amiga + cursor keys: Page Up,
  Page Down, Home, End

The FULLSCREEN tooltype on the game's icon (take the brackets off) starts
it full screen.


Building
--------

    make -f amiga/Makefile.amigaos dist

with GFOpenAmigaGCC 16.2.0-open4, the OpenNDK headers, the OpenGPU kit and
the Team's static libpng and zlib (see the Makefile's head). The drawer is
dist/Airstrike (and dist/Airstrike.info).


What was changed
----------------

- src/airstrike.c: the background pictures come from the data path (Debian's
  fix_paths patch names /usr/share/games/airstrike).
- The configuration is PROGDIR:airstrikerc (ROOT_CONFIG_FILE), the data
  PROGDIR:data (its datapath, amiga/airstrikerc).
- No SDL_image 1.2 for OpenGPU's SDL 1.2: the Team's amiga/sdl_image_lite.c
  (PNG on libpng) stands in. amiga/stack.c: 256 KB of stack.


Licences
--------

Airstrike, its pictures and texts: GPL 2 (COPYING.txt). The Amiga files
(amiga/): the AmiCradle Team; the SDL_image shim comes from the Team's
Wizznic and Gigalomania ports and is GPL 3 or later, so the program as
built here is GPL 3.
