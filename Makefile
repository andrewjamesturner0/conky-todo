Q = @
RM = rm
M4 = m4
PREFIX = --prefix-builtins

USER = ajt
HOME = /home/$(USER)
CONFDIR = $(HOME)/Dev/conky-todo.github

# Dependencies
all: work-todo.conkyrc play-todo.conkyrc

# Rules
%.conkyrc: src/%.conkyrc.m4 src/common
	$(M4) $(PREFIX) $< > $@
	$(Q)sed -i s/@USER@/$(USER)/ $@
	ln -sf "$(CONFDIR)/$@" "$(HOME)/.$@"

.PHONY: clean
clean:
	$(RM) *.conkyrc
