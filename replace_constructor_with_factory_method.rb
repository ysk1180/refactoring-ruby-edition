class Car
  def initialize(price)
    @price = price
  end

  def guarantee?
    false
  end
end

class ForeinCar < Car
  def guarantee?
    false
  end
end

class HighGradeCar < Car
  def guarantee?
    true
  end
end

imported = false
price = 200

# 車のインスタンスを条件分岐を使って作っている箇所が複数あって辛い
car1 = if imported
         ForeinCar.new(price)
       elsif price > 100
         HighGradeCar.new(price)
       else
         Car.new(price)
       end
puts car1.guarantee? # -> true

# リファクタリング後

class Car
  def initialize(price)
    @price = price
  end

  def guarantee?
    false
  end

  def self.create(imported, price) # ファクトリメソッド
    if imported
      ForeinCar.new(price)
    elsif price > 100
      HighGradeCar.new(price)
    else
      new(price)
    end
  end
end

car2 = Car.create(imported, price)
puts car2.guarantee?
