
## LARP čí sny sníš 
Jedná se o velmi experimentální hru na hranici toho, co nazýváme larpem. Vůbec se v ní nemluví, mnohem více poslouchá a vyjadřuje jinak, než jsme zvyklí. Je postavený na vnímání hudby a neverbální komunikaci. Nemusíte umět tančit, existuje mnoho jiných způsobů vyjádření – postoj, pohled, dotek, pohyb. Hra je poetická, silně prožitková a do určité míry abstraktní. Provede vás příběhem a nechá vám velkou volnost v jeho ztvárnění a interpretaci.
Larp pracuje se závažnými tématy – vyrovnávání se se ztrátou blízkého člověka, hledání smyslu, osamocení, sebevražda, osudovost lásky. Prosíme zodpovědně zvažte, zda o těchto tématech chcete hrát, přemýšlet, prožívat je. Výrazným tématem jsou partnerské vztahy, součástí hry je fyzický kontakt zhruba na úrovni objetí a držení za ruku

Hra vznikla na larpworkshopu v roce 2016.

### Software solution

At the moment there is way which application use for streaming.

### Server install:

#### As a root:

	$ zypper in icecast ices
	$ ln -s icecast.xml /etc/icecast.xml
	$ systemctl restart icecast

#### Play example radio:
	$ ices ices-playlist.xml

### Mobile aplication
[ArmAmp](https://play.google.com/store/apps/details?id=com.armamp)

Choose Add from menu in right top corner.

Insert URL http://10.0.0.4:8000/player1.ogg

NOTE ip address could be different, works only in local network
