require 'torquebox-messaging'

class PublishService
  def initialize(opts={})
  end  

  def start
    Thread.new { run }
  end

  def stop
   
  end

  def run
    puts 'publishing'
    queue = TorqueBox::Messaging::Queue.new('/queues/testing')
    queue.publish_and_receive("my message body", :properties => { :age => 60 })
    puts 'published message'
  end
end 