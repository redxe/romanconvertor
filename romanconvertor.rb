#!/usr/bin/env ruby

def fromRoman(roman_numeral)

    roman_numerals = {
        "I" => 1,
        "V" => 5,
        "X" => 10,
        "L" => 50,
        "C" => 100,
        "D" => 500,
        "M" => 1000
    }

    arabic_numeral = 0

    for i in (0..roman_numeral.length - 1)
        unless roman_numerals.keys.include? roman_numeral[i]
            raise TypeError
        end
        if i > 0 and roman_numerals[roman_numeral[i]] > roman_numerals[roman_numeral[i-1]]
            arabic_numeral += roman_numerals[roman_numeral[i]] - 2 * roman_numerals[roman_numeral[i-1]]
        else
            arabic_numeral += roman_numerals[roman_numeral[i]]
        end
    end

    return arabic_numeral

end

def toRoman(arabic_numeral)

    roman_numerals = {
    	1000 => "M",
        900 => "CM",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
    }

    if arabic_numeral < 1 or arabic_numeral > 3999
        raise RangeError
    end

    roman_numeral = ""
    i = 0

    while arabic_numeral > 0
        quotient = arabic_numeral / roman_numerals.keys[i]
        quotient.times do |x|
            arabic_numeral -= roman_numerals.keys[i]
            roman_numeral += roman_numerals.values[i]
        end
        i += 1
    end

    return roman_numeral

end