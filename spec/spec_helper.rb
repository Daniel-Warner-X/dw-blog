Bundler.require(:default, :test)
# get necessary gems
require 'rspec'
require 'capybara/poltergeist'
require 'capybara/dsl'
require 'rack/jekyll'
require 'rack/test'
require 'phantomjs/poltergeist'
RSpec.configure do |config|
    config.include Capybara::DSL

    # get config info
    $jekyll_config = YAML.load_file('_config.yml')
    $baseurl = $jekyll_config['baseurl'].to_s
    $test_pages = $jekyll_config['test_pages']

    # set up capybara and register the jekyll site via rack
    Capybara.current_driver = :poltergeist
    Capybara.javascript_driver = :poltergeist
    Capybara.app = Rack::Jekyll.new(force_build: false)
end