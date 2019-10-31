UPPERCASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
LOWERCASE = "abcdefghijklmnopqrstuvwxyz".split('')

def caesar_cipher(string, shift_number)
    i = 0
    while i < string.length
        string[i] = caesar_shift(string[i], shift_number)
        i += 1
    end
    string
end

def caesar_shift(letter, shift_number)
    new_shift = LOWERCASE.index(letter.downcase).to_i + shift_number
    if (new_shift >= 26)
        new_shift -= 26
    end

    if (LOWERCASE.include?(letter))
        return LOWERCASE[new_shift]
    elsif (UPPERCASE.include?(letter))
        return UPPERCASE[new_shift]
    else
        return letter
    end

end

string = "Abcd Efg, HIJK lmnop... QrStuvw, XYZ!!!"
string = caesar_cipher(string, 5)
puts string