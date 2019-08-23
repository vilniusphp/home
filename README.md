Vilniusphp.lt homepage
======================

DO NOT MERGE

* Turite idėjų kaip patobulinti esamą UI - "Pull request";
* Turite idėjų, bet prieš tai norite padiskutuoti - sukurk "Issue";

Naudojimas
----------

Tinklapis naudoja [Phrozn](https://github.com/farazdagi/phrozn) įrankį statinių
failų generavimui.

1. Instaliavimas.

    ``` sh
    git clone git@github.com:vilniusphp/home.git
    cd home
    make
    ```

    Makefile parsiųs composer.phar, suintaliuos reikiamas bibliotekas ir
    sukompiliuos statinius failus į public_html direktoriją.


2. Pridėti įvykio informaciją į `.phrozn/entries/index.twig`. Įvykis pridedamas
   failo viršuje YAML formatu.

3. Tai pat seną įvykį reikėtų  perkeltį `.phrozn/archive.twig`. 

4. Jei reikia, perjungti į kitą dizainą per `.phozon/config.yml`

5. Statinių failų kompiliavimas.

    ``` sh
    make
    ```

CSS
---

CSS generacimui naudojamas less. Norėdami pridėti savo stilius, redaguotkite
`.phrozn/less/vilniusphp.less`.

1. less instaliavimas: 

    ```
    npm install less -g
    ```

2. CSS generavimas iš less failų:

    ```sh
    make less
    ```

Per docker
----------

```
composer install
docker run -it -v $(pwd):/code -w /code -e TZ='UTC' php:5.6 bash -c "echo 'date.timezone=Europe/Vilnius' > /usr/local/etc/php/conf.d/timezone.ini && make"
```

Deploying
---------

Copy files from  `public_html` and create Pull request in https://github.com/vilniusphp/vilniusphp.github.io