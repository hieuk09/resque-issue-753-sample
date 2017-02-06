module Tp
  # NOTE: Why isn't this in config? In order to load config, we need to have
  #       the time zone set. If we put the time zone in config, we can't
  #       load config. That's why it's in here.
  def self.time_zone
    @time_zone ||= 'UTC'.freeze
  end

  # This method is used for counting lines of code
  # Simply call Tp.count_lines('rb') in your console to get the number lines of ruby code
  # Or similarly, 'haml', 'erb', 'js', 'css', etc.
  def self.count_lines(ext)
    o = 0 # Number of files
    n = 0 # Number of lines of code
    m = 0 # Number of lines of comments

    files = Dir.glob('./**/*.' + ext)

    files.each do |f|
      next if f.index('vendor')
      next if FileTest.directory?(f)
      o += 1
      i = 0
      File.new(f).each_line do |line|
        if line.strip[0] == '#'
          m += 1
          next
        end
        i += 1
      end
      n += i
    end

    puts "#{o.to_s} files."
    puts "#{n.to_s} lines of code."
    puts "#{(n.to_f/o.to_f).round(2)} LOC/file."
    puts "#{m.to_s} lines of comments."
  end
end
