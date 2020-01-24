class Raindrops
  LYRICS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }

  def self.convert(n)
    song = LYRICS.keys
                 .map { |d| (n % d).zero? ? LYRICS[d] : '' }
                 .join
    song.empty? ? n.to_s : song
  end
end
