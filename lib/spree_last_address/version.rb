module SpreeLastAddress

  # Returns the version of the currently loaded SpreeLastAddress as a <tt>Gem::Version</tt>
  def self.version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 2
    MINOR = 2
    TINY  = 1
    PRE   = nil

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
  end
end
