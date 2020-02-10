# frozen_string_literal

class Grep
  def self.grep(pattern, flags, files)
    file_matches = files.map { |file| [file, grep_file(pattern, flags, file)] }
                        .reject { |_, matches|  matches.empty? }
                        .to_h

    if flags.include?('-l')
      file_matches.keys
    else
      if files.count > 1
        file_matches.map { |file, matches| matches.map { |match| [file, match].join(':') } }
      else
        file_matches.values
      end
    end.join("\n").strip
  end

  def self.grep_file(pattern, flags, file_name)
    pattern = pattern(pattern, flags)

    File.readlines(file_name).each_with_index.with_object([]) do |(line, line_number), matches|
      if (line.match(pattern) && !flags.include?('-v')) ||
         (!line.match(pattern) && flags.include?('-v'))
        line = line.strip
        line = "#{line_number + 1}:#{line}" if flags.include? '-n'

        matches << line
      end
    end
  end

  def self.pattern(pattern, flags)
    pattern = "\\A#{pattern}\n\\z" if flags.include?('-x')

    pattern = Regexp.new(pattern, flags.include?('-i'))
  end
end
