class GetCurrentCourse
  def self.call
    new.perform
  end

  def perform
    Course.find_by(finish: false)
  end
end