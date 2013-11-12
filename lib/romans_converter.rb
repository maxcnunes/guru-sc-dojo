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
    map_count = {}
    chars.each do |char|
      map_count[char] = (map_count[char] || 0) + 1
    end

    VLD.each do |vld|
      return false if map_count[vld] && map_count[vld] > 1
    end

    IXCM.each do |ixcm|
      return false if map_count[ixcm] && map_count[ixcm] > 3
    end    
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