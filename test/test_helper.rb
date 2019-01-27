require "rack/test"
require "test/unit"

path = File.join(File.dirname(__FILE__), "..", "lib")
$LOAD_PATH.unshift(File.expand_path(path))

require "play_tracks"
