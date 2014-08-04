require 'rubygems'
require 'bundler'

Bundler.require
$: << File.expand_path('../', __FILE__)

require 'config'
require 'app/routes'
require 'app/models'

module Meerkat
    class Application < Sinatra::Application
        configure do
            disable :method_override
            disable :static
            set :api_key, 'a82914a33ff5b85ca4940f40b0372386'
        end

        use Rack::Deflater
        use Routes::Index
        use Routes::Similars
    end
end
