Vilniusphp.lt homepage
======================

* Turite idėjų kaip patobulinti esamą UI - "Pull request";
* Turite idėjų, bet prieš tai norite padiskutuoti - sukurk "Issue";

Naudojimas
----------

Tinklapis naudoja [Phrozn](https://github.com/farazdagi/phrozn) įrankį statinių failų generavimui.

1. Instaliavimas.

    ``` sh
    git clone git@github.com:vilniusphp/home.git
    cd home
    make
    ```

    Makefile parsiųs composer.phar, suintaliuos reikiamas bibliotekas ir sukompiliuos statinius failus į public_html direktoriją.


2. Pridėti įvykio informaciją į `.phrozn/entries/index.twig`. Įvykis pridedamas failo viršuje YAML formatu.

3. Jei reikia, perjungti į kitą dizainą per `.phozon/config.yml`

4. Statinių failų kompiliavimas.

    ``` sh
    make
    ```
