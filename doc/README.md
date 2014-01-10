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

Dafür wird die  

Util:

- mapsingle & mapcomb
- keyvalue/(s)/tester & hashmap

Test
----
