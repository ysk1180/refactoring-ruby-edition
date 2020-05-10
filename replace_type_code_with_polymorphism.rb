class Fan
  attr_reader :type_code, :brand_level

  def initialize(type_code, brand_level)
    @type_code = type_code
    @brand_level = brand_level
  end

  def price
    case type_code
    when :ac_motor
      brand_level * 3_000
    when :dc_motor
      brand_level * 5_000
    when :no_wing
      brand_level * 7_000
    end
  end

  # priceメソッド以外にもtypeによる条件分岐が多くなっている
end

nomal_fan = Fan.new(:ac_motor, 1)
puts nomal_fan.price

dyson_fan = Fan.new(:no_wing, 5)
puts dyson_fan.price

balmuda_fan = Fan.new(:dc_motor, 10)
puts balmuda_fan.price

# リファクタリング後
class AcMotorFan
  attr_reader :brand_level

  def initialize(brand_level)
    @brand_level = brand_level
  end

  def price
    brand_level * 3_000
  end
end

class DcMotorFan
  attr_reader :brand_level

  def initialize(brand_level)
    @brand_level = brand_level
  end

  def price
    brand_level * 5_000
  end
end

class NoWindFan
  attr_reader :brand_level

  def initialize(brand_level)
    @brand_level = brand_level
  end

  def price
    brand_level * 5_000
  end
end

nomal_fan = AcMotorFan.new(1)
puts nomal_fan.price

dyson_fan = NoWindFan.new(5)
puts dyson_fan.price

balmuda_fan = DcMotorFan.new(10)
puts balmuda_fan.price
