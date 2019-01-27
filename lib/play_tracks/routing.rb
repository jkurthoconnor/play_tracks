module PlayTracks
  class Application
    def get_controller_and_action(env)
      _, contr, act, after = env["PATH_INFO"].split("/", 4)
      contr = contr.capitalize
      contr += "Controller"

      [Object.const_get(contr), act]
    end
  end
end

