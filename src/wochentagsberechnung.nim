# https://de.wikipedia.org/wiki/Wochentagsberechnung

import std/[os, strutils, times]

proc sameDay(date: DateTime): bool =
  return year(date) == year(now()) and
      month(date) == month(now()) and
      monthday(date) == monthday(now())

proc calculateWeekday(d, m, y, c: int): int =
  result = (d + int(2.6 * float(m) - 0.2) + y + int(y / 4) + int(c / 4) - 2 * c) mod 7
  if result < 0: result += 7

proc resultMessage(day, month, year, w: int): string =
  let date = parse($day & "-" & $month & "-" & $year, "d-M-yyyy")
  result = "Der " & date.format("dd-MM-yyyy").replace('-', '.') & " "

  if sameDay(date): result &= "ist"
  elif date < now(): result &= "war"
  elif date > now(): result &= "wird"

  result &= " ein "

  case w
  of 0: result &= "Sonntag"
  of 1: result &= "Montag"
  of 2: result &= "Dienstag"
  of 3: result &= "Mittwoch"
  of 4: result &= "Donnerstag"
  of 5: result &= "Freitag"
  of 6: result &= "Samstag"
  else: result = "Es konnte kein Wochentag ermittelt werden"

proc parseDate*(arguments = commandLineParams()): string =
  if arguments.len != 1: return "Unpassende Anzahl an Argumenten übergeben"

  var values = arguments[0].split('.')
  if values.len != 3: return "Ungültiges Datum angegeben"

  let
    day = parseInt(values[0])
    month = parseInt(values[1])
    year = parseInt(values[2])
    januaryOrFebruary = month == 1 or month == 2

  if day < 1 or day > 31: return "Ungültiger Tag angegeben"
  if month < 1 or month > 12: return "Ungültiger Monat angegeben"
  if (year < 1000 or year > 9999) or (year == 1000 and januaryOrFebruary):
    return "Ungültiges Jahr angegeben"
  if januaryOrFebruary: values[2] = intToStr(parseInt(values[2]) - 1)

  var m: int
  case month
  of 1: m = 11
  of 2: m = 12
  else: m = month - 2

  let
    y = parseInt(values[2][2..3])
    c = parseInt(values[2][0..1])
    w = calculateWeekday(day, m, y, c)

  return resultMessage(day, month, year, w)

when isMainModule:
  echo parseDate()
