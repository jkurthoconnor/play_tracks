require "play_tracks/version"
require "play_tracks/array"
require "play_tracks/routing"

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
      [200, {'Content-Type' => 'text/html'}, [ text ]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    private
    def env
      @env
    end

    def env_list
      list = "<ul>"

      @env.each do |k,v|
        list << "<li>#{k}=> #{v}</li>"
      end

      list << "</ul>"
    end
  end

  class Error < StandardError; end
end
