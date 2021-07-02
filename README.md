
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hessr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of `hessr` is to translate German into Hessisch (German
dialect). `hessr` is built upon [this
tool](https://www.xn--versetter-z7a.de/) by Marcel Meyer and simply
provides an interface to it.

## Installation

You can install the development version of `hessr` from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("favstats/hessr")
```

## Example

This is a basic example:

``` r
library(hessr)
## basic example code
```

``` r
get_hessisch("Was geht heute noch meine Kerle")
#> [1] "Woas gäjd heit noch moi Kerl"
```

``` r
get_hessisch("Ich würde gerne Maultaschen essen. Oder doch vielleicht Spätzle mit Soße.")
#> [1] "Isch deed gärn Maultasche esse. Orrer doch vielleischt Spätzl mid Soäe."
```

``` r
get_hessisch("Widerrechtlich abgestellte Fahrzeuge werden kostenpflichtig abgeschleppt.")
#> [1] "Widerreschtlisch abgeschdellt Fahrzeuge werrn kostenpflischtisch abgeschleppt."
```

``` r
get_hessisch("American Eagle Outfitters ist ein US-amerikanisches Modeunternehmen mit Hauptsitz in Pittsburgh im Bundesstaat Pennsylvania. Das Unternehmen vertreibt Bekleidung für die Zielgruppe der 15- bis 25-jährigen Männer und Frauen.")
#> [1] "American Eagl Outfidders issn US-amerikanisches Modeunnernämme mid Hauptsitz in Piddsburgh im Bundesstaat Pennsylvania. Des Unnernämme vertreibt Bekleidung fär die Zielgrupp der 15- bis 25-jährige Männer unn Fraue."
```
