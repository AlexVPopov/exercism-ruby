# frozen_string_literal

class BeerSong
  def self.recite(bottles, verses, lyrics = [])
    return lyrics.join("\n") if verses.zero?

    recite(bottles - 1, verses - 1, lyrics.push(verse(bottles)))
  end

  def self.verse(bottles)
    <<~VERSE
      #{first_line(bottles)}
      #{second_line(bottles)}
    VERSE
  end

  def self.first_line(bottles)
    case bottles
    when (2..99)
      "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer."
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer."
    else
      "No more bottles of beer on the wall, no more bottles of beer."
    end
  end

  def self.second_line(bottles)
    case bottles
    when (3..99)
      "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall."
    when 2
      "Take one down and pass it around, 1 bottle of beer on the wall."
    when 1
      "Take it down and pass it around, no more bottles of beer on the wall."
    else
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    end
  end
end
