.PHONY: deploy clean build

OUTPUT_DIR = public_html
STATIC_REPO = https://github.com/vilniusphp/vilniusphp.github.io.git
PHR = vendor/pawka/phrozn/bin/phrozn.php

build: $(OUTPUT_DIR) vendor 
	mkdir -p $(OUTPUT_DIR) && $(PHR) up . $(OUTPUT_DIR)

composer.phar:
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
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
