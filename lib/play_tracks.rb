require "play_tracks/version"
require "play_tracks/array"

module PlayTracks
  class Application
    def call(env)
      `echo debug > debug`;
      if env["PATH_INFO"].include?('favicon')
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200,
       {'Content-Type' => 'text/html'},
       ["Hello, there", text ]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end

  class Error < StandardError; end
end
