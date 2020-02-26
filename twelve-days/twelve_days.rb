# frozen_string_literal

class TwelveDays
  DAY_COUNT = %w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh
                 twelfth).freeze
  private_constant :DAY_COUNT

  GIFTS = ['two Turtle Doves', 'three French Hens', 'four Calling Birds',
           'five Gold Rings', 'six Geese-a-Laying', 'seven Swans-a-Swimming',
           'eight Maids-a-Milking', 'nine Ladies Dancing', 'ten Lords-a-Leaping',
           'eleven Pipers Piping', 'twelve Drummers Drumming'].freeze
  private_constant :GIFTS

  LAST_GIFT = 'a Partridge in a Pear Tree.'.freeze
  private_constant :LAST_GIFT

  def self.song
    new.song
  end

  def song(count = 12, verses = [])
    return verses.join("\n\n") + "\n" if count.zero?

    song(count - 1, [day(count) + gifts(count), *verses])
  end

  private

  def day(count)
    "On the #{DAY_COUNT[count - 1]} day of Christmas my true love gave to me: "
  end

  def gifts(count)
    return 'a Partridge in a Pear Tree.' if count == 1

    count.downto(2).map { |i| GIFTS[i - 2] }.push("and #{LAST_GIFT}").join(', ')
  end
end
