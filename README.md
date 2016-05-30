## LARP čí sny sníš
 
Jedná se o velmi experimentální hru na hranici toho, co nazýváme larpem. Vůbec se v ní nemluví, mnohem více poslouchá a vyjadřuje jinak, než jsme zvyklí. Je postavený na vnímání hudby a neverbální komunikaci. Nemusíte umět tančit, existuje mnoho jiných způsobů vyjádření – postoj, pohled, dotek, pohyb. Hra je poetická, silně prožitková a do určité míry abstraktní. Provede vás příběhem a nechá vám velkou volnost v jeho ztvárnění a interpretaci.
Larp pracuje se závažnými tématy – vyrovnávání se se ztrátou blízkého člověka, hledání smyslu, osamocení, sebevražda, osudovost lásky. Prosíme zodpovědně zvažte, zda o těchto tématech chcete hrát, přemýšlet, prožívat je. Výrazným tématem jsou partnerské vztahy, součástí hry je fyzický kontakt zhruba na úrovni objetí a držení za ruku

Hra vznikla na larpworkshopu v roce 2016.

### Software solution

There is simple streaming example.
More futures are coming. 

#### Dependences

	$ sudo zypper in icecast ices mpd ncmpc

#### Play example radio
	$ ices ices-playlist.xml

#### Generate mpd configs
	$ ./mpd_config_generator.sh

#### Play and stop player radio
	$ mpd_run.sh
	$ mpd mpd.player2.conf --kill

#### Player radio control
	$ ncmpc -p 6601

### Mobile aplication
[ArmAmp](https://play.google.com/store/apps/details?id=com.armamp)

Choose Add from menu in right top corner.

Insert URL http://10.0.0.4:8000/player1

NOTE ip address could be different, works only in local network

### Contributors
Larp was writen by Balda Jakub Balhar, Ciri Tereza Staňková, Godric Martin Hanzl, Yuffie Jana Kilianová.
Technical part Balda Jakub Balhar, Jitka Novotná.
