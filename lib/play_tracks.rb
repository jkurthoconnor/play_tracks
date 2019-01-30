require "play_tracks/version"
require "play_tracks/array"
require "play_tracks/routing"
require "play_tracks/util"
require "play_tracks/dependencies"

module PlayTracks
  class Application
    def call(env)
      if env["PATH_INFO"].include?('favicon')
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      if env["PATH_INFO"].eql?("/")
        contr = "HomeController"
        klass, act = [Object.const_get(contr), "index"]
      else
        klass, act = get_controller_and_action(env)
      end

      # apparently, via some magic when Object.const_get returns 
      # what ammounts to the file name, this is used to  load the file,
      # thus the class within it, so `klass.new` works b/c `klass` references
      # the class itself, not the file
      controller = klass.new(env)
      text = begin 
               controller.send(act)
             rescue
               raise "That was stupid. Try something else."
             end

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

      env.each do |k,v|
        list << "<li>#{k}=> #{v}</li>"
      end

      list << "</ul>"
    end
  end

  class Error < StandardError; end
end
