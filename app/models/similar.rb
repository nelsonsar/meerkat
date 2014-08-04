module Meerkat
    module Models
        class Similar
            BASE_URL='http://ws.audioscrobbler.com/2.0/'
            METHOD='artist.getsimilar'
            FORMAT='json'
            IMAGE_SIZE='large'

            @@apiKey = '';

            def initialize()
                @@apiKey = Meerkat::API_KEY
            end

            def getSimilar(artist)
                params = {:params => {
                    :method => METHOD,
                    :artist => artist,
                    :api_key => @@apiKey,
                    :format => FORMAT,
                    :limit => 10
                }}
                response = RestClient.get BASE_URL, params
                collection = JSON.parse(response)
                if collection['similarartists'].has_key?('@attr')
                    return transformCollectionToPresentation collection['similarartists']['artist']
                end

                return []
            end

            private
            def transformCollectionToPresentation(artistList)
                result = []
                artistList.each do |item|
                    name = item['name']
                    url = item['url']
                    image = getMediumImageFromCollection(item['image'])
                    hash = { :name => name, :url => url, :image => image }
                    result.push(hash)
                end

                return result
            end

            def getMediumImageFromCollection(images)
                if images.nil?
                    return ''
                end

                images.each do |item|
                    if item["size"] == IMAGE_SIZE
                        return item['#text']
                    end
                end
            end
        end
    end
end
