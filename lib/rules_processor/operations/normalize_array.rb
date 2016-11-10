module NormalizeArray

  private

  def normalized_value(value)
    if value.is_a?(String)
      value.tr(',.:', '').split.map(&:strip).map(&:downcase)
    elsif value.is_a?(Array)
      value.map(&:to_s).map(&:strip).map(&:downcase)
    else
      fail "Not supported comparison for #{value.class.inspect}"
    end
  end

end