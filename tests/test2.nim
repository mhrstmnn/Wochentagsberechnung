import unittest, wochentagsberechnung

test "01.01.1700":
  const result = "Der 01.01.1700 war ein Freitag"
  check parseDate(@["01.01.1700"]) == result
  check parseDate(@["1.1.1700"]) == result

test "14.07.1789":
  const result = "Der 14.07.1789 war ein Dienstag"
  check parseDate(@["14.07.1789"]) == result
  check parseDate(@["14.7.1789"]) == result

test "01.01.1800":
  const result = "Der 01.01.1800 war ein Mittwoch"
  check parseDate(@["01.01.1800"]) == result
  check parseDate(@["1.1.1800"]) == result

test "18.01.1892":
  const result = "Der 18.01.1892 war ein Montag"
  check parseDate(@["18.01.1892"]) == result
  check parseDate(@["18.1.1892"]) == result

test "01.01.1900":
  const result = "Der 01.01.1900 war ein Montag"
  check parseDate(@["01.01.1900"]) == result
  check parseDate(@["1.1.1900"]) == result

test "23.05.1949":
  const result = "Der 23.05.1949 war ein Montag"
  check parseDate(@["23.05.1949"]) == result
  check parseDate(@["23.5.1949"]) == result

test "09.11.1989":
  const result = "Der 09.11.1989 war ein Donnerstag"
  check parseDate(@["09.11.1989"]) == result
  check parseDate(@["9.11.1989"]) == result

test "03.10.1999":
  const result = "Der 03.10.1999 war ein Sonntag"
  check parseDate(@["03.10.1999"]) == result
  check parseDate(@["3.10.1999"]) == result

test "01.01.2000":
  const result = "Der 01.01.2000 war ein Samstag"
  check parseDate(@["01.01.2000"]) == result
  check parseDate(@["1.1.2000"]) == result

test "24.02.2023":
  const result = "Der 24.02.2023 war ein Freitag"
  check parseDate(@["24.02.2023"]) == result
  check parseDate(@["24.2.2023"]) == result
