module Meerkat
    module Routes
        class Index < Base
            set :views, 'app/views'
            set :root, Application.root
            set :erb, escape_html: true
            get '/' do
                erb :index
            end
        end
    end
end
