# class Tasks < Array
#   def finish(task)
#     puts 'Well done!'
#     delete(task)
#   end
#
#   def list
#     each { |task| puts task }
#   end
# end
#
# tasks = Tasks.new
# tasks.push('clean room')
# tasks.push('study ruby')
#
# tasks.list
# tasks.finish('clean room')
# tasks.list

require 'forwardable'

class Tasks
  extend Forwardable

  def_delegators :@tasks, :each, :delete, :push

  def initialize
    @tasks = [] # Array.new でも同じ
  end

  def finish(task)
    puts 'Well done!'
    delete(task)
  end

  def list
    each { |task| puts task }
  end
end

tasks = Tasks.new
tasks.push('clean room')
tasks.push('study ruby')

tasks.list
tasks.finish('clean room')
tasks.list
