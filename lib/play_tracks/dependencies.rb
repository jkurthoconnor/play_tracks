class Object
  def self.const_missing(c)
    return nil if @in_const_missing_call

    @in_const_missing_call = true
    require PlayTracks.to_underscore(c.to_s)
    klass = Object.const_get(c)
    @in_const_missing_call = false

    klass
  end
end


