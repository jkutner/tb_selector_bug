require 'torquebox-messaging'

class ReceiveService
  def initialize(opts={})
  end

  def start
    Thread.new { run }
  end

  def stop
    @done = true
  end

  def run
    until @done
      queue = TorqueBox::Messaging::Queue.new('/queues/testing')
      queue.receive_and_publish(:selector => "age = 10") do |m|
        puts "m=#{m}"
        "got it"
      end
      sleep(1)
    end
  end
end 