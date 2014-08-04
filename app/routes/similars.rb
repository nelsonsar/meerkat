module Meerkat
    module Routes
        class Similars < Base
            get '/similars' do
                artist = params[:artist]
                model = Models::Similar.new
                similars = model.getSimilar(artist)
                if similars.empty?
                    status 404
                    erb :not_found, :locals => {:name => artist}
                else
                    erb :similars, :locals => {:similars => similars}
                end
            end
        end
    end
end
