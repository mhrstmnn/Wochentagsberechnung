import unittest, wochentagsberechnung

test "01.01.1700":
  const result = "Der 01.01.1700 war ein Freitag"
  check main(@["01.01.1700"]) == @[result]
  check main(@["1.1.1700"]) == @[result]

test "14.07.1789":
  const result = "Der 14.07.1789 war ein Dienstag"
  check main(@["14.07.1789"]) == @[result]
  check main(@["14.7.1789"]) == @[result]

test "01.01.1800":
  const result = "Der 01.01.1800 war ein Mittwoch"
  check main(@["01.01.1800"]) == @[result]
  check main(@["1.1.1800"]) == @[result]

test "18.01.1892":
  const result = "Der 18.01.1892 war ein Montag"
  check main(@["18.01.1892"]) == @[result]
  check main(@["18.1.1892"]) == @[result]

test "01.01.1900":
  const result = "Der 01.01.1900 war ein Montag"
  check main(@["01.01.1900"]) == @[result]
  check main(@["1.1.1900"]) == @[result]

test "23.05.1949":
  const result = "Der 23.05.1949 war ein Montag"
  check main(@["23.05.1949"]) == @[result]
  check main(@["23.5.1949"]) == @[result]

test "09.11.1989":
  const result = "Der 09.11.1989 war ein Donnerstag"
  check main(@["09.11.1989"]) == @[result]
  check main(@["9.11.1989"]) == @[result]

test "03.10.1999":
  const result = "Der 03.10.1999 war ein Sonntag"
  check main(@["03.10.1999"]) == @[result]
  check main(@["3.10.1999"]) == @[result]

test "01.01.2000":
  const result = "Der 01.01.2000 war ein Samstag"
  check main(@["01.01.2000"]) == @[result]
  check main(@["1.1.2000"]) == @[result]

test "24.02.2023":
  const result = "Der 24.02.2023 war ein Freitag"
  check main(@["24.02.2023"]) == @[result]
  check main(@["24.2.2023"]) == @[result]
