# class Item
#   def initialize(name, origin_country = nil)
#     @name = name
#     @origin_country = origin_country
#   end
#
#   def description
#     puts "商品名:#{@name} / 補足:#{additional_description}"
#   end
# end
#
# class DomesticItem < Item
#   def additional_description
#     '国内産です'
#   end
# end
#
# class ImportedItem < Item
#   def additional_description
#     "#{@origin_country}で作られました"
#   end
# end
#
# DomesticItem.new('イヤホン').description
# ImportedItem.new('スマートフォン', 'アメリカ').description

# ↓リファクタリング後↓

module Item
  def initialize(name, origin_country = nil)
    @name = name
    @origin_country = origin_country
  end

  def description
    puts "商品名:#{@name} / 補足:#{additional_description}"
  end
end

class DomesticItem
  include Item

  def additional_description
    '国内産です'
  end
end

class ImportedItem
  include Item

  def additional_description
    "#{@origin_country}で作られました"
  end
end

DomesticItem.new('イヤホン').description
ImportedItem.new('スマートフォン', 'アメリカ').description

