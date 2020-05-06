# 筋肉量100のマッチョなトレーナーがいるゴールドジム
# トレーナーがいないJOYFIT

class Gym
  attr_reader :name, :trainer

  def initialize(name, trainer=nil)
    @name = name
    @trainer = trainer
  end
end

class Trainer
  attr_reader :name, :muscle_quantity

  def initialize(name, muscle_quantity)
    @name = name
    @muscle_quantity = muscle_quantity
  end
end

muscle_trainer = Trainer.new('マッチョトレーナー', 100)
gold_gym = Gym.new('ゴールドジム', muscle_trainer)
joyfit = Gym.new('ジョイフィット')

# それぞれのジムのトレーナー情報を出したい
gyms = [gold_gym, joyfit]
gyms.each do |gym|
  puts "#{gym.name}: #{gym.trainer&.name || 'トレーナー不在'} / 筋肉量: #{gym.trainer&.muscle_quantity || 0}"
  # nilチェックが多くなってつらい
end

# ↓リファクタリング後

# class Gym
#   attr_reader :name, :trainer
#
#   def initialize(name, trainer=nil)
#     @name = name
#     @trainer = trainer || NoTrainer.new
#   end
# end
#
# class Trainer
#   attr_reader :name, :muscle_quantity
#
#   def initialize(name, muscle_quantity)
#     @name = name
#     @muscle_quantity = muscle_quantity
#   end
# end
#
# class NoTrainer
#   def name
#     'トレーナー不在'
#   end
#
#   def muscle_quantity
#     0
#   end
# end
#
# muscle_trainer = Trainer.new('マッチョトレーナー', 100)
# gold_gym = Gym.new('ゴールドジム', muscle_trainer)
# joyfit = Gym.new('ジョイフィット')
#
# # それぞれのジムのトレーナー情報を出したい
# gyms = [gold_gym, joyfit]
# gyms.each do |gym|
#   puts "#{gym.name}: #{gym.trainer.name} / 筋肉量: #{gym.trainer.muscle_quantity}"
# end
