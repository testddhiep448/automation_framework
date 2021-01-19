require 'active_support/logger'
class MainLogger

  def self.logger
    @logger ||= Logger.new(STDOUT)
  end
end
