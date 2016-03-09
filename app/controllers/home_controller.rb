class HomeController < ApplicationController
  def index
    @upcoming_tasks = Task.where("due_date > :today", today: DateTime.now).order("due_date ASC").limit(6)
    @recent_tasks = Task.where("status = 0").order("updated_at DESC").limit(6)
    @projects_by_tasks = []
    Task.pluck('project_id').inject(Hash.new(0)) { |h,v| h[v] += 1; h }.max_by(6) {|k,v| v}.each {|k,v| @projects_by_tasks << Project.find(k)}
    @bookings_upcoming = Booking.where("start_datetime > :now", now: DateTime.now).order("start_datetime ASC").limit(6)
  end
end
