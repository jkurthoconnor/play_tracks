require "play_tracks/version"
require "play_tracks/array"

module PlayTracks
  class Application
    def call(env)
      `echo debug > debug`;
      [200,
       {'Content-Type' => 'text/html'},
       [[1,2,3,4].prepend_count.to_s] ]
    end
  end

  class Error < StandardError; end
end
