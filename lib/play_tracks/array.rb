class Array
  def sum(start=0)
    inject(start, &:+)
  end

  def prepend_count
    map.with_index { |e, idx| "#{idx + 1}:#{e}" }
  end
end
