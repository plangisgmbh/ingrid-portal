---
# ID des GUI Elements
guid: 3645
# optional ID der Objektklasse
oid: 6
# title, used as window title
title: Basisdaten
---

# Basisdaten

Herkunft und Art der zugrundeliegenden Daten. Im Allgemeinen sind dies die Datensätze, auf die der Dienst aufgesetzt ist. Allgemein sollen die Herkunft oder die Ausgangsdaten der Daten beschrieben werden, die in dem Dienst / der Anwendung bzw. dem Informationssystem benutzt, gespeichert, angezeigt oder weiterverarbeitet werden. Zusätzlich kann die Art der Daten (z. B. digital, automatisch ermittelt oder aus Umfrageergebnissen, Primärdaten, fehlerbereinigte Daten) angegeben werden. Der Eintrag kann hier direkt über die Auswahl der Registerkarte "Text" erfolgen oder es können Verweise eingetragen werden, indem der Link "Verweis anlegen/bearbeiten" angewählt wird.

## Beispiel:

Messdaten von Emissionen in bestimmten Betrieben

# ISO Abbildung

Bei Angabe einer Objektreferenz wird die Abbildung auf ```<srv:operatesOn uuidref="UUID_OF_COUPLED_DATASET">``` (ISO 19119) vorgenommen.

Bei Angabe eines Verweises HTTP-GET-Requests wird die Abbildung auf ```<transferOptions><MD_DigitalTransferOptions><onLine>``` (Domain: 277) vorgenommen.

Bei Angabe eines Textes wird dieser auf ```<LI_Source><description>``` (Domain: 93) abgebildet.
