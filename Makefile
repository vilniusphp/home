.PHONY: deploy clean build

OUTPUT_DIR = public_html
STATIC_REPO = https://github.com/vilniusphp/vilniusphp.github.io.git
PHR = vendor/pawka/phrozn/bin/phrozn.php

build: $(OUTPUT_DIR) vendor 
	mkdir -p $(OUTPUT_DIR) && $(PHR) up . $(OUTPUT_DIR)

composer.phar:
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	php composer-setup.php --version=1.10.19
	php -r "unlink('composer-setup.php');"
	touch composer.phar

vendor: composer.phar
	./composer.phar install --no-interaction

clean:
	rm -f composer.phar
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
