# vim:ft=automake
#

.SUFFIXES:

VPATH= $HOME

all: .vimrc
	
.vimrc: vimrc
	-@ln -s vimrc ~/.vimrc
