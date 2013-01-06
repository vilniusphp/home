Vilniusphp.lt homepage
======================

* Turite idėjų kaip patobulinti esamą UI - "Pull request";
* Turite idėjų, bet prieš tai norite padiskutuoti - sukurk "Issue";

Naudojimas
----------

1. Instaliuoti [Phrozn](http://phrozn.info)

    ``` sh
    pear channel-discover pear.phrozn.info
    ```

    Šiuo metu stabilios versijos nėra, naudojam beta ir nesukam galvos:

    ``` sh
    pear install phrozn/Phrozn-beta
    ```

2. Pridėti įvykio informaciją į `.phrozn/entries/index.twig`. Įvykis pridedamas failo viršuje YAML formatu.

3. Sukompiliuoti statinius failus

    ``` sh
    make compile
    ```

    arba
    ``` sh
    phr up . public_html
    ```
