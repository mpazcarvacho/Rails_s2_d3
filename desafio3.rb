#Desafío3
#María Paz Carvacho

class Appointment

  attr_accessor :location, :purpose, :hour, :min
  
  def initialize (location, purpose, hour, min)
    @location = location
    @purpose = purpose
    @hour = hour
    @min = min
  end

end

class MonthlyAppointment < Appointment

  attr_accessor :day

  def initialize(location, purpose, hour, min, day)
    super(location, purpose, hour, min)
    @day = day
  end

  def occurs_on?(day)
    @day == day
  end

  def to_s
    puts "Reunión mensual en #{@location} sobre #{@purpose} el día #{@day} a la(s) #{@hour}:#{@min}."
  end

end

class DailyAppointment < Appointment

  def occurs_on?(hour, min)
    self.hour == hour and self.min == min
  end

  def to_s
    puts "Reunión diaria en #{@location} sobre #{@purpose} a la(s) #{@hour}:#{@min}."
  end
end 

class OneTimeAppointment < Appointment

  attr_accessor :day, :month, :year

  def initialize(location, purpose, hour, min, day, month, year)
    super(location, purpose, hour, min)
    @day = day
    @month = month
    @year = year
  end

  def occurs_on?(day, month, year)
    @day == day and @month == month and @year == year
  end

  def to_s
    puts "Reunión única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{year} a la(s) #{@min}:#{@hour}."
  end

end

#Instancias de prueba

hora_mensual = MonthlyAppointment.new("mi casa", "meteoritos", 18, 30, 10)
hora_mensual.to_s
puts hora_mensual.occurs_on?(10)

cita_diaria = DailyAppointment.new("mi casa", "Netflix", 17, 30)
cita_diaria.to_s
puts cita_diaria.occurs_on?(17,30)

cita_unica = OneTimeAppointment.new("mi casa", "música", 10, 15, 8, 7, 2020)
cita_unica.to_s
puts cita_unica.occurs_on?(8, 7, 2020)