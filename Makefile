
all: cart docs

ifeq ($(CC65_HOME),)
        CC = cc65
        AS = ca65
        LD = ld65
        AR = ar65
else
        CC = $(CC65_HOME)/bin/cc65
        AS = $(CC65_HOME)/bin/ca65
        LD = $(CC65_HOME)/bin/ld65
        AR = $(CC65_HOME)/bin/ar65
endif


.PHONY: configure cart docs clean mrproper

configure:
	@$(MAKE) -C src $@

cart:
	@$(MAKE) -C src

docs:
	@$(MAKE) -C docs

test:
	@echo "Do some tests"

clean:
	@$(MAKE) -C src $@
	@$(MAKE) -C docs $@


mrproper: clean
	@$(MAKE) -C src $@
	@$(MAKE) -C docs $@
