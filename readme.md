# Zen Cart Italia - Documentazione #
## Questa è la Versione 1.5.1 ITALIANA di Zen Cart® alla data 01/10/2012. ##

**Contiene Bugfix per file cartelle italian con codifica corretta in utf8**

**Contiene Bugfix zone del 2 maggio 2012 (vedi nota sottostante)**

Dettagliata lista modifiche e soluzione bug è disponibile in:
[http://www.zen-cart.com/showthread.php?200259-Zen-Cart-v1-5-1-Released!-**-Performance-Improvements-Bug-Fixes-etc](http://www.zen-cart.com/showthread.php?200259-Zen-Cart-v1-5-1-Released!-**-Performance-Improvements-Bug-Fixes-etc)

> ## Zen Cart® REQUISITI Minimi / Suggeriti richiesti ##
> PHP 5.2.14 o superiore, Apache 2.0 o superiore e MySQL 4.1.3 o superiore.
> NOTA: la modalità Strict MySQL NON è supportata in questa versione di Zen Cart®.
> Apache configurato con AllowOverride deve essere impostato su 'All' o almeno sia 'Limit' che
> 'Indexes' e preferibilmente con anche il parametro 'Options'.
> PHP deve essere configurato per supportare CURL con OpenSSL.

Per rimanere **aggiornato** su **sicurezza** e strumenti dedicati segui i ns canali:

- https://www.facebook.com/zencartitalia

- http://twitter.com/zencartitalia

- https://plus.google.com/115239847124335172426

Considerare SEMPRE una **DONAZIONE** al TEAM U.S.A.
[[http://www.zen-cart.com/index.php?main_page=infopages&pages_id=14](http://www.zen-cart.com/index.php?main_page=infopages&pages_id=14)]
Per supportare il team e contribuire al Progetto Zen-Cart

----------
Si ringraziano per la traduzione: La_Vale, Spike00, Elvinomac, Webmaster
Inserito un breve tutorial di prima configurazione ed utilizzo nelle pagine 2, 3, 4, a cura di Sandro Carniel [webmaster zen-cart.it]

----------
Questa release contiene un bugfix relativo ad un problema che affligge esclusivamente chi **aggiorna da una versione 1.3.x alla versione 1.5.0**. Le nuove installazioni (cioè tutti i nuovi store) della versione 1.5.x sono esenti da questo problema e non necessitano pertanto di alcun intervento.

Il problema si manifesta con il disallineamento delle zone tra vecchie e nuova versione, causa inserimento delle nuove zone australiane.

Questo "**bugfix A**" (posto nella cartella "UPGRADE bugfix zone ITA v15") è predisposto **SOLO** per nuovi upgrade da store 1.3.xx alla nuova 1.5 e ri-allinea correttamente le zone italiane.

----------

----------
# Procedura aggiornamento versione italiana #
**Il metodo per aggiornare uno Zen Cart versione ITA che invitiamo a seguire* è**:

1. installare la nuova versione in una cartella "/-NUOVO"
2. copiare e riportare dati, file di lingua modificati, immagini ecc. fra i due store, "vecchio" e nuovo.
3. esportare & importare fra i due database i clienti con indirizzi ed ordini;
4. effettuare un back-up preventivo del database e procedere con il bugfix A
5. da Strumenti > Installa patch SQL > eseguire la query "**bugfix_A.sql**" posta nella cartella
UPGRADE bugfix zone ITA v150 – **cartella da non caricare nello spazio web**!
6. Proseguire con tutta la parte del catalogo composta da categorie, articoli, attributi ecc;
comparando i due database sarà semplice vedere cosa c'è e cosa manca da trasferire.
7. verificare i dati / la sincronia fra i due store e testare tutto il nuovo ambiente.
8. sostituire i due store fra loro modificando dati e percorsi nei due file di configurazione e nel DB
(per il percorso della cache); Il vecchio spostandone i file entro una cartella /_OLD ed il nuovo
alzando i file dalla cartella "/-NUOVO" nella root o dove scelto.

**Nota**: per ottenere una perfetta sincronia dei dati dal punto 3 in poi sarà necessario **porre in manutenzione** lo store “vecchio” così da evitare la perdita di registrazioni / ordini, per il tempo necessario a concludere le operazioni dei restanti punti.
Se nel “vecchio” store sono (stati installati e sono) presenti moduli che hanno aggiunto voci alle tabelle di categoria, articoli ecc. detti moduli (aggiornati all'attuale versione) dovranno essere installati anche nella nuova 1.5 prima del trasferimento dei dati stessi così fra i due database da avere lo stesso numero di campi presenti e non ottenere errori.

*Per aggiornare la versione USA la procedura può essere differente e si rimanda alla documentazione allegata a quella distribuzione. La procedura indicata NON è comunque valida per aggiornamenti fra versioni linguistiche diverse.

# PROSSIMI PASSI #
Per **SICUREZZA** devi cambiare i permessi di scrittura, in sola lettura dei files configure.php posti in /admin/includes/ ed /includes/ prima di aprire il negozio al pubblico! Inoltre sarebbe opportuno rimuovere (invece che rinominare) la cartella /zc_install per evitare tentativi di re-installazione non autorizzati!

Dei segnali di **ATTENZIONE** saranno attivi fino a quando non saranno stati effettuati questi interventi.

## CONFIGURAZIONE ##
Con questa versione sono inserite nel negozio delle pagine di spiegazione passo passo, in ogni modo ti
invitiamo a leggere le **FAQ** - Domande Frequenti i **Manuali** e seguire il **Forum** di supporto al fine di configurare prima e predisporre dopo il tuo negozio nella maniera migliore e più veloce. Per domande, chiarimenti e supporto questo è il posto giusto, abbiamo un potente motore di ricerca per termini chiave, utilizzalo! E' molto importante che tu prenda visione della Documentazione posta nella cartella /docs presente nel tuo Sito.

## IMPORTANTE ##
Lo strumento più potente per la completa gestione e personalizzazione del TUO Sito è il **Developers Tool Kit**, posto nel Pannello di Amministrazione, in Strumenti. Sarà possibile usarlo per cercare quasi
qualche cosa che potrà essere adattata o sostituita, in particolare il testo visualizzato sul Sito.
Per diventare esperti nella modifica o creazione di template, prendete visione di FAQ, articoli e manualistica presente nel Nostro Sito di supporto: [www.zen-cart.it](http://www.zen-cart.it).

## INFINE ##
In [www.zen-cart.com](http://www.zen-cart.com) oltre a trovare informazioni e supporto nel forum, vi è una sezione denominata Downloads. Al cui interno è posta una categoria 'Documentation', che contiene le
ultime versioni di manuali e documentazione in Inglese per conoscere a fondo vari aspetti riguardantifunzionalità ed aspetti gestionali del tuo negozio.

Ulteriori informazioni e dettagli nelle F.A.Q. del Sito [www.zen-cart.it](http://www.zen-cart.com)

> Siamo felici che TU abbia scelto il sistema E-commerce Zen Cart. Ricorda che il Progetto fatto di questa distribuzione, il sito che la mantiene, la documentazione ed il forum di supporto vive grazie alla TUA DONAZIONE

## MANUALE OPERATIVO DI ZEN CART ITALIANO ##
L'acquisto prevede l'iscrizione al sito di aggiornamento [Groovethenet.com](http://www.groovethenet.com) dove sono presenti oltre a ad errata corrige delle risorse e gli aggiornamenti per le versioni Zen Cart successive a quella utilizzata come riferimento per la stesura del manuale stesso.

Maggiori informazioni e riferimenti disponibili in

[http://www.zen-cart.it/manuale-operativo-zen-cart/](http://www.zen-cart.it/manuale-operativo-zen-cart/)
