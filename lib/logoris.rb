class Logoris

  VERSION = "0.1.0"

  # The optional out_file to log stdout events.
  # @return [String]
  attr_accessor :out_file

  # The optional error_file to log stderr events.
  # @return [String]
  attr_accessor :error_file

  # The optional error_file to log both stdout and stderr events.
  # @return [String]
  attr_accessor :log_file

  # @param [Hash] args Logoris options
  # @option options [Boolean] :out_file the file to log stdout events
  # @option options [Boolean] :error_file the file to log stderr events
  # @return [void]
  def initialize(args={})
    @out_file   = false # Do not log stdout events to a file by default.
    @error_file = false # Do not log stderr events to a file by default.
    @log_file   = false # Do not log both stdout and stderr events to a file by default.
    out_file    = args[:out_file]   if args[:out_file]   # Set file for stdout, if given.
    error_file  = args[:error_file] if args[:error_file] # Set file for stderr, if given.
    log_file    = args[:log_file]   if args[:log_file]   # Set file for stdout and stderr, if given.
  end

  # @param [String] message
  # @return [void]
  def out(message)
    STDOUT.puts message
    to_log(@out_file, message) if @out_file
    to_log(@log_file, message) if @log_file
  end

  # @param [String] message 
  # @return [void]
  def error(message)
    STDERR.puts message
    to_log(@error_file, message) if @error_file
    to_log(@log_file, message)   if @log_file
  end

  # @param [String] file 
  # @return [void]
  def error_file=(file)
    FileUtils.touch(file) unless log_exists?(file)
    @error_file = file
  end

  # @param [String] file 
  # @return [void]
  def out_file=(file)
    FileUtils.touch(file) unless log_exists?(file)
    @out_file = file
  end
  
  # @param [String] file 
  # @return [void]
  def log_file=(file)
    FileUtils.touch(file) unless log_exists?(file)
    @log_file = file
  end

  # @param [String] file 
  # @param [String] message 
  # @return [void]
  def to_log(file, message)
    File.open(file, 'a') { |f| f.puts message }
    to_log(@log_file, message) if @log_file
  end

  # @param [String] file 
  # @return [Boolean]
  def log_exists?(file)
    File.exists?(file)
  end

end
