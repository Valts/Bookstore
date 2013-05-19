
def celsius_to_fahrenheit(celsius)
  return celsius * 9 / 5 + 32
end

def is_long_year(year)
  return year % 4 == 0
  #return Date.leap?(year)
end

puts celsius_to_fahrenheit(20.0)

puts is_long_year(2013)

