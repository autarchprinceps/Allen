Einleitung
----------

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
