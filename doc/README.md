Einleitung
----------
Im vorliegenden Projekt ging es um die Umsetzung einer Software zum Einlesen von Ereignissen und anschließenden zeitlichen Prüfen der zeitlichen Relationen zwischen diesen Ereignissen. Die Eingabe sollte dabei auch einen Existanzquantor verarbeiten und Aussagen mit diesm auf Korrektheit prüfen können. Dabei sollte z.B. angegeben werden können, dass ein Ereignis A mit mindestens einem der Ereignisse {B,C,D,E} in einer Beziehung steht. 
Über diese gegebene Aufgabenstellung hinaus, sollte aus persönlichem Ehrgeiz die Verwendung mehrerer hintereinandergereihter Existenzquantoren ermöglicht werden.

Hierbei wurde Umsetzung und insbesondere um die in der Vorlesung erworbenen Kennsnisse der Sprache LISP zu vertiefen, die Sprache LISP zur Implementierung gewählt. Ein weiterer Grund für die Umsetzung in LISP liegt in der Tatsache begründet, dass sich das gegebene Problem sehr gut in einer funktionalen Programmiersprache umsetzen lässt.


Umsetzung
---------

Existenzquantorkonzept:
Die Existenzbedingung ist erfüllt sobald mindestens eine Lösung gefunden wird, die valide ist.
Daher ist der Grundgedanke unserer Umsetzung die Ergebnisse der Tests jeder möglichen Lösung durch ein logisches oder zu verknüpfen.
Ist mehr als ein Existenzquantor angegeben, wird jede mögliche Kombination der möglichen Lösungen getestet.
Definiert z.B. ein Existenzquantor eine Verbindung von A nach B oder C und ein weiterer eine andere Verbindung von C oder A nach B, so werden die Kombinationen (AB CA), (AB CB), (AB CA CB), (AC CA), (AC CB), (AC CA CB), (AB AC CA), (AB AC CB) und (AB AC CA CB) getestet. Funktioniert mindestens eine, so sind die Existenzbedingung für alle Quantoren erfüllt.
Um diese Menge aller möglichen Kombinationen zu generieren (Funktion allexquantcombinations) wird die

Test einer einzelnen Dreiecksbeziehung:

Test
----
