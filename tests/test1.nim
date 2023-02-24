# Make sure the test filenames start with the letter 't'.
# To run the tests, simply execute `nimble test`.

import unittest, wochentagsberechnung

test "24.02.2023":
  check main(@["24.02.2023"]) == @["Der 24.2.2023 ist ein Freitag"]
  check main(@["24.2.2023"]) == @["Der 24.2.2023 ist ein Freitag"]

test "01.01.1000":
  check main(@["01.01.1000"]) == @["Der 1.1.1000 war ein Mittwoch"]
  check main(@["1.1.1000"]) == @["Der 1.1.1000 war ein Mittwoch"]

test "01.01.1900":
  check main(@["01.01.1900"]) == @["Der 1.1.1900 war ein Montag"]
  check main(@["1.1.1900"]) == @["Der 1.1.1900 war ein Montag"]

test "01.01.2000":
  check main(@["01.01.2000"]) == @["Der 1.1.2000 war ein Samstag"]
  check main(@["1.1.2000"]) == @["Der 1.1.2000 war ein Samstag"]

