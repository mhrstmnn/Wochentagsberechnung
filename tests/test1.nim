# Make sure the test filenames start with the letter 't'.
# To run the tests, simply execute `nimble test`.

import unittest, wochentagsberechnung

test "Keine Argumente":
  check parseDate(@[]) == "Unpassende Anzahl an Argumenten übergeben"

test "Zu viele Argumente":
  const result = "Unpassende Anzahl an Argumenten übergeben"
  check parseDate(@["", "", ""]) == result
  check parseDate(@["", ""]) == result

test "Ungültiges Datum":
  check parseDate(@[""]) == "Ungültiges Datum angegeben"

test "Ungültiger Tag":
  const result = "Ungültiger Tag angegeben"
  check parseDate(@["32.01.2000"]) == result
  check parseDate(@["32.1.2000"]) == result

test "Ungültiger Monat":
  const result = "Ungültiger Monat angegeben"
  check parseDate(@["01.13.2000"]) == result
  check parseDate(@["1.13.2000"]) == result

test "Ungültiges Jahr":
  const result = "Ungültiges Jahr angegeben"
  check parseDate(@["01.01.1000"]) == result
  check parseDate(@["1.1.1000"]) == result
  check parseDate(@["01.02.1000"]) == result
  check parseDate(@["1.2.1000"]) == result
