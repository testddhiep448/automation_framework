require 'singleton'

class EnvironmentConfig
  include Singleton

  attr_accessor :data

  def initialize
    @data = {}
  end

  def read_data(environment)
    @data = YAML.load_file("test data/#{environment}_environment.yml")
  end
end
