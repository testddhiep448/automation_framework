class LocalConfig

  def initialize
    @host = ENV['local_ip'] || '127.0.0.1'
    @port = ENV['local_port'] || '4444'
  end

  def hub_location
    "http://#{@host}:#{@port}/wd/hub"
  end

end
