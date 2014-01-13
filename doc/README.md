Einleitung
----------
Im vorliegenden Projekt ging es um die Umsetzung einer Software zum Einlesen von Ereignissen und anschließenden zeitlichen Prüfen der zeitlichen Relationen zwischen diesen Ereignissen. Die Eingabe sollte dabei auch einen Existanzquantor verarbeiten und Aussagen mit diesm auf Korrektheit prüfen können. Dabei sollte z.B. angegeben werden können, dass ein Ereignis A mit mindestens einem der Ereignisse {B,C,D,E} in einer Beziehung steht.

Über diese gegebene Aufgabenstellung hinaus, sollte aus persönlichem Ehrgeiz die Verwendung mehrerer hintereinandergereihter Existenzquantoren ermöglicht werden.

Zur Umsetzung und insbesondere um die in der Vorlesung erworbenen Kennsnisse der Sprache LISP zu vertiefen, wurde zur Implementierung die Sprache LISP gewählt. Ein weiterer Grund für die Umsetzung in LISP liegt in der Tatsache begründet, dass sich das gegebene Problem sehr gut in einer funktionalen Programmiersprache umsetzen lässt.


Umsetzung
---------

Existenzquantorkonzept:

Die Existenzbedingung ist erfüllt sobald mindestens eine Lösung gefunden wird, die valide ist.
Daher ist der Grundgedanke unserer Umsetzung die Ergebnisse der Tests jeder möglichen Lösung durch ein logisches oder zu verknüpfen.
Ist mehr als ein Existenzquantor angegeben, wird jede mögliche Kombination der möglichen Lösungen getestet.
Definiert z.B. ein Existenzquantor eine Verbindung von A nach B oder C und ein weiterer eine andere Verbindung von C oder A nach B, so werden die Kombinationen (AB CA), (AB CB), (AB CA CB), (AC CA), (AC CB), (AC CA CB), (AB AC CA), (AB AC CB) und (AB AC CA CB) getestet. Funktioniert mindestens eine, so sind die Existenzbedingung für alle Quantoren erfüllt.

Um diese Menge aller möglichen Kombinationen zu generieren (Funktion allexquantcombinations) wird die Potenzmenge (ausgeschlossen die leere Menge, da ja mindestens eine Möglichkeit erhalten bleiben muss, damit die Existenzbedingung erfüllt ist) des letzen Existenzquantors rekursiv mit der Potenzmenge des jeweils vorherigen Existenzquantors vollständig verknüpft (kartesisches Produkt).

Test einer einzelnen Dreiecksbeziehung:

Jede einzelne Möglichkeit oder die einzige Möglichkeit, wenn kein Existenzquantor angegeben ist, wird getestet (Funktion test), indem alle drei Einzeltests (Funktion testsingle) durchgeführt werden.

Dafür wird jeweils die Funktion combine aufgerufen und die Schnittmenge gebildet, genau wie es in Allen'sche Zeitlogik auf dem Papier auch passiert. 

Util:

- mapsingle & mapcomb
- keyvalue/(s)/tester & hashmap


Test
----
Für das Testen des LISP-Programms wurde eine separate Ordnerstruktur erstellt: Im Ordner test/ liegen die Unterordner success/ und fail/ erstellt. Da hoher Automatisierungsgrad beim Testen Entdeckungswahrscheinlichkeit von Fehlern drastisch erhöht und manuellen Fehlern beim Testen vorbeugt, sollte eine eigene Testsuite für die Tests erstellt werden. Hierzu wurden alle Fälle, die erfolgreich sein sollten im Unterordner success/ in einzelne Dateien abgelegt, alle Fälle die fehlschlagen sollten im Ordner fail/. Direkt im Ordner test/ wurde ein makefile (makefile.lsp) erstellt, das sämtliche Tests per Load-Befehl einbindet. 

Zum Testen wurde folgendermaßen Vorgegangen:
Mangels Automatisierungs-Möglichkeit wurden als erstes alle 169 Möglichkeiten der P-Matrix nach dem Vier-Augen-Prinzip überprüft. Anschließend wurden folgende Randbedingungen aufgestellt:
- Eine  Dreiecksbeziehung sollte logisch korrekt als wahr oder falsch erkannt werden
- Ein Existenzquantor, der nur eine Beziehung beinhaltet, sollte logisch korrekt je nach Eingabewerten als korrekt oder falsch erkannt werden
- Ein Existenzquantor, der als ersten Parameter eine Ecke des Dreiecks und als zweiten Parameter mehrere Ecken des Dreiecks beinhaltet, sollte nach den Regeln der Allen-Logik als korrekt oder falsch erkannst werden
- Ein Existenzquantor, der mehrere Ecken des Dreiecks im ersten und mehrere Ecken im zweiten Parameter beinhaltet, sollte nach der Allen-Logik als korrekt oder falsch erkannt werden
- Ein Existenzquantor, der mehrere Ecken des Dreiecks im ersten Parameter und nur eine Ecke im zweiten Parameter beinhaltet, sollte nach den Regeln der Allen-Logik als korrekt oder falsch erkannt werden
- Mehrere Existenzquantoren sollten nach den Regeln der Allen-Logik als korrekt oder falsch erkannt werden
- Ein Existenzquantor mit einer Beziehung zu sich selbst, wie etwa (r_exist 'A 'A '(X)), wobei X für eine beliebige Beziehung steht, sollte fehlschlagen

Daraus wurden Äquivalenzklassen gebildet und aus jeder Äquivalenzklasse ein Testfall erstellt. Wenn möglich wurden dabei mit einem Testfall mehrere Möglichkeiten abgedeckt. Diese Testfälle wurden mit dem Vier-Augen-Prinzip von Hand durchgerechnet. Anschließend wurde getestet, ob das in LISP umgesetzte Programm die selbe Lösung liefert. 

Folgende Testfälle wurden erstellt:
fail:
