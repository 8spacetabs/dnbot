class Integer
  def to_reaction_monkey_edition
    map = {
     0 => "0⃣",
     1 => "1⃣",
     2 => "2⃣",
     3 => "3⃣",
     4 => "4⃣",
     5 => "5⃣",
     6 => "6⃣",
     7 => "7⃣",
     8 => "8⃣",
     9 => "9⃣"
    }.each do |i, r|
      return r if self == i
    end
  end
end
