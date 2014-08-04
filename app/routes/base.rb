module Meerkat
    module Routes
        class Base < Sinatra::Application
            set :views, 'app/views'
            set :root, Application.root
            set :erb, escape_html: true
        end
    end
end
