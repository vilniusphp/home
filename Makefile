.PHONY: all

OUTPUT_DIR = public_html
PHR = vendor/farazdagi/phrozn/bin/phrozn.php

all: vendor
	mkdir -p $(OUTPUT_DIR) && $(PHR) up . $(OUTPUT_DIR)

composer.phar:
	curl -s https://getcomposer.org/installer | php
	touch composer.phar

vendor: composer.phar
	./composer.phar update
	touch vendor

clean:
	rm composer.phar
	rm -rf vendor
	rm -rf $(OUTPUT_DIR)/*
