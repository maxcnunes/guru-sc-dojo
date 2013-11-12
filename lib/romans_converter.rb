class RomansConverter
#TODO refactoring

  NUMBERS = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000,
  }

  VLD = %w{ V L D }
  IXCM = %w{ I X C M }
  IXC = %w{ I X C }

  def to_roman(s)
    total = 0
    chars = s.split(//)

    raise "invalid chars"  unless is_valid_roman_number?(chars)
    raise "invalid semantic" unless valid_semantic?(chars)

    chars.each_with_index do |char, index|
      if has_special_chars?(char)  && is_next_greater?(chars, char, index)
        total -= NUMBERS[char]
      else
        total += NUMBERS[char]  
      end
    end

    total
  end
  

  def valid_semantic?(chars) 
    return false if VLD.any?  { |vld| chars.count(vld) > 1 }
    return false if IXCM.any? { |ixcm| chars.count(ixcm) > 3 }
    return true
  end

  def has_special_chars?(char)
    IXC.include?(char)
  end

  def is_last_index?(chars, index)
    index == chars.size - 1
  end

  def is_next_greater?(chars, char, index)
    !is_last_index?(chars, index) && NUMBERS[char] <  NUMBERS[chars[index + 1]]
  end

  def is_valid_roman_number?(chars)
    chars.any?  { |char| NUMBERS.include?(char) }
  end

end