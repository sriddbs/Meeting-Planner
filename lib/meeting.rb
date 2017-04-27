require "time"

class Meeting
  attr_accessor :name, :duration, :start_time, :scheduled

  def initialize name, duration
    @name = name
    @duration = duration[/\d+/].to_i
    @scheduled = false
  end

  def pretty_print
    puts [@start_time.strftime("%I:%M %p"), @name, @duration].join(" ")
  end
end