# Meerkat

A similar artists finder sit on top of [LastFM][3].
Sorry for no tests, I'll work on that later (I know shit about Ruby)...

## Installation

You need [a LastFM API key][1] and put it inside the `config.rb` file.
On the project directory, run `bundle install` (you will need [Bundler][2] installed).

## Running

Run `rackup -p 4567` from your command line e check your browser at `http://localhost:4567`.

[1]: http://www.last.fm/api/account/create
[2]: http://bundler.io/
[3]: http://lastfm.com
