class Register
  def initialize
    @properties = {
      'Baltic Avenue' => { cost: 60, rent: 100, owned: false }
    }
  end

  def is_property?(location)
     @properties.include?(location)
  end

  def cost(location)
    @properties[location][:cost]
  end

  def rent(location)
    @properties[location][:rent]
  end

  def owned?(location)
    return true unless @properties.include?(location)

    @properties[location][:owned]
  end

  def bought(location)
    @properties[location][:owned] = true
  end
end