class CalendarController < ApplicationController
  def index
  end

  def events
    events = Event.all.map do |event|
      {
        :id => "event-#{event.id}",
        :title => event.title,
        :description => event.title,
        :tooltip => "#{event.title} tooltip",
        :start => event.starts_on,
        :end => event.ends_on,
        :color => "#C7D8F7",
        :borderColor => "#B7C8E7",
        :textColor => "#3f3f3f",
        :allDay => true,
        :type => :event
      }
    end

    tactics = Tactic.all.map do |tactic|
      {
        :id => "tactic-#{tactic.id}",
        :title => tactic.title,
        :description => tactic.title,
        :start => tactic.starts_on.noon,
        :realStart => tactic.starts_on.noon,
        :alternateStart => (tactic.ends_on - 1.day),
        :end => tactic.ends_on,
        :color => "rgb(147,215,147)",
        :borderColor => "#d1efc4",
        :textColor => "#3f3f3f",
        :allDay => true,
        :type => :tactic
      }
    end

    tactic = Tactic.first
    tactics =
      [{
        :id => "tactic-#{tactic.id}",
        :title => tactic.title,
        :description => tactic.title,
        :start => tactic.starts_on.noon,
        :realStart => tactic.starts_on.noon,
        :alternateStart => (tactic.ends_on - 1.day),
        :end => tactic.ends_on,
        :color => "rgb(147,215,147)",
        :borderColor => "#d1efc4",
        :textColor => "#3f3f3f",
        :allDay => true,
        :type => :tactic,
        :cssClass => "tactic-#{tactic.id}"
      }]

    steps = tactic.steps.all.map do |step|
      {
        :id => "step-#{step.id}",
        :title => step.title,
        :description => step.tactic.title + ' - ' + step.title,
        :start => step.starts_on,
        :end => step.ends_on,
        :color => "#dddddd",
        :borderColor => "#cdcdcd",
        :textColor => "#3f3f3f",
        :allDay => true,
        :type => :step,
        :cssClass => "tactic-#{step.tactic.id}"
      }
    end

    render :json => (events + tactics + steps)
  end
end
