class TestWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "TADAAA!!!, this is #{args[0]} showing up #{args[1]} seconds later."
  end
end
