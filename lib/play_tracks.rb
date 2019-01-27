require "play_tracks/version"

module PlayTracks
  class Application
    def call(env)
      [200,
       {'Content-Type' => 'text/html'},
       ["Hello from Ruby on Play Tracks."]]
    end
  end

  class Error < StandardError; end
end
