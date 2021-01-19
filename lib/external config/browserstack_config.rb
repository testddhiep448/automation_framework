class BrowserstackConfig

  def initialize
    @user = ENV['bs_user'] || 'testvdc1'
    @access_key = ENV['bs_access_key'] || 'z4gjxYshhqN7aUW7D4vP'
  end

  def hub_location
    "http://#{@user}:#{@access_key}@hub-cloud.browserstack.com/wd/hub"
  end

  def api_endpoint
    "https://#{@user}:#{@access_key}@api.browserstack.com/automate/"
  end
end
