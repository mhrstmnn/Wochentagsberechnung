# Make sure the test filenames start with the letter 't'.
# To run the tests, simply execute `nimble test`.

import unittest, wochentagsberechnung

test "Keine Argumente":
  const result = "Unpassende Anzahl an Argumenten übergeben"
  check main(@[]) == @[result]

test "Zu viele Argumente":
  const result = "Unpassende Anzahl an Argumenten übergeben"
  check main(@["", "", ""]) == @[result]
  check main(@["", ""]) == @[result]

test "Ungültiges Datum":
  const result = "Ungültiges Datum angegeben"
  check main(@[""]) == @[result]

test "Ungültiger Tag":
  const result = "Ungültiger Tag angegeben"
  check main(@["32.01.2000"]) == @[result]
  check main(@["32.1.2000"]) == @[result]

test "Ungültiger Monat":
  const result = "Ungültiger Monat angegeben"
  check main(@["01.13.2000"]) == @[result]
  check main(@["1.13.2000"]) == @[result]

test "Ungültiges Jahr":
  const result = "Ungültiges Jahr angegeben"
  check main(@["01.01.1000"]) == @[result]
  check main(@["1.1.1000"]) == @[result]
  check main(@["01.02.1000"]) == @[result]
  check main(@["1.2.1000"]) == @[result]
