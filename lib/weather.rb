
# could this beb simplified to 1 line? 
class Weather
  def report
    random = (1..10).to_a.sample
    random < 10 ? :sunny : :stormy
  end
end
