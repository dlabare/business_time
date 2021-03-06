require 'active_support/time'

module BusinessTime
  
  class BusinessDays
    def initialize(days)
      @days = days
    end

    def after(time = Time.now)
      time = Time.zone ? Time.zone.parse(time.strftime("%d/%m/%Y %I:%M %p %Z")) : Time.parse(time.strftime("%d/%m/%Y %I:%M %p %Z"))
      @days.times do
        begin
          time = time + 1.day
        end until Time.workday?(time)
      end
      time
    end
    
    alias_method :from_now, :after
    alias_method :since, :after
    
    def before(time = Time.now)
      time = Time.zone ? Time.zone.parse(time.strftime("%d/%m/%Y %I:%M %p %Z")) : Time.parse(time.strftime("%d/%m/%Y %I:%M %p %Z"))
      @days.times do
        begin
          time = time - 1.day
        end until Time.workday?(time)
      end
      time
    end
    
    alias_method :ago, :before
    alias_method :until, :before
  
  end  
  
end
