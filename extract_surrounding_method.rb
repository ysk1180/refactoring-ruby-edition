class Person
  def sunny_day_activities
    puts 'work from home'
    puts 'running' # 晴れの日はランニングする
    puts 'play games'
  end

  def rain_day_activities
    puts 'work from home'
    puts 'taking a nap' # 雨の日は外に出たくないので昼寝する
    puts 'play games'
  end
end

person1 = Person.new
person1.sunny_day_activities
person1.rain_day_activities

# 「サンドイッチメソッドの抽出」でリファクタリング↓

class Person
  def activities
    puts 'work from home'
    yield
    puts 'play games'
  end
end

person2 = Person.new
person2.activities { puts 'running' }
person2.activities { puts 'taking a nap' }

