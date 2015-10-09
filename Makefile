.PHONY: deploy clean build

OUTPUT_DIR = public_html
STATIC_REPO = https://github.com/vilniusphp/vilniusphp.github.io.git
PHR = vendor/pawka/phrozn/bin/phrozn.php

build: $(OUTPUT_DIR) vendor 
	mkdir -p $(OUTPUT_DIR) && $(PHR) up . $(OUTPUT_DIR)

composer.phar:
	curl -s https://getcomposer.org/installer | php
	touch composer.phar

vendor: composer.phar
	./composer.phar install
	touch vendor

clean:
	rm composer.phar
	rm -rf vendor
	rm -rf $(OUTPUT_DIR)/*

$(OUTPUT_DIR):
	git clone $(STATIC_REPO) $(OUTPUT_DIR)

deploy: $(OUTPUT_DIR) build
	bin/deploy.sh $(OUTPUT_DIR)


lessc-exists: ; @which lessc > /dev/null
lessc-check: lessc-exists
less: lessc-check
	lessc -x .phrozn/less/vilniusphp.less .phrozn/styles/vilniusphp.css
