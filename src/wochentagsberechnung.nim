# https://de.wikipedia.org/wiki/Wochentagsberechnung

import std/[os, strutils, strformat, times]

proc main*(arguments = commandLineParams()): seq[string] =
  if arguments.len != 1:
    result.add("Unpassende Anzahl an Argumenten übergeben")
    return

  var values = arguments[0].split('.')
  if values.len != 3:
    result.add("Ungültiges Datum angegeben")
    return

  let day = parseInt(values[0])
  if day < 1 or day > 31: result.add("Ungültiger Tag angegeben")

  let month = parseInt(values[1])
  if month < 1 or month > 12: result.add("Ungültiger Monat angegeben")
  var
    m: int
    januaryOrFebruary = false
  case month
  of 1:
    m = 11
    januaryOrFebruary = true
  of 2:
    m = 12
    januaryOrFebruary = true
  else: m = month - 2

  let year = parseInt(values[2])
  if year < 1000 or year > 9999: result.add("Ungültiges Jahr angegeben")

  if result.len == 0:
    let date = parse(fmt"{day}-{month}-{year}", "d-M-yyyy")
    var resultMessage = fmt"Der {day}.{month}.{year} "
    if date < now(): resultMessage &= "war"
    elif date > now(): resultMessage &= "wird"
    else: resultMessage &= "ist"
    resultMessage &= " ein "
    if januaryOrFebruary:
      values[2] = values[2][0..2] & intToStr(parseInt($values[2][3]) - 1)
    let
      y = parseInt(values[2][2..3])
      c = parseInt(values[2][0..1])
      w = (day + int(2.6 * float(m) - 0.2) + y + int(y / 4) + int(c / 4) - 2 * c) mod 7
    case w
    of 0: resultMessage &= "Sonntag"
    of 1: resultMessage &= "Montag"
    of 2: resultMessage &= "Dienstag"
    of 3: resultMessage &= "Mittwoch"
    of 4: resultMessage &= "Donnerstag"
    of 5: resultMessage &= "Freitag"
    of 6: resultMessage &= "Samstag"
    else: discard
    result.add(resultMessage)

let output = main()
for line in output: echo line
