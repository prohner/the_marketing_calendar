class CalendarController < ApplicationController
  def index
  end

  def channels
    channels = Channel.all.map do |channel|
      {
        :id => channel.id,
        :title => channel.title
      }
    end
    render :json => {items: channels}
  end

  def events
    colors = [["PaleGoldenrod", "Black", "OrangeRed"],
      ["MistyRose", "Black", "Red"],
      ["LightCyan", "Black", "Green"],
      ["PapayaWhip", "Black", "Salmon"],
      ["PowderBlue", "Black", "RoyalBlue"],
      ["FloralWhite", "Black", "Teal"],
      ["Linen", "Black", "PowderBlue"],
      ["HoneyDew", "Black", "Gainsboro"],
      ["CornSilk", "Black", "Coral"],
      ["AliceBlue", "Black", "Aqua"],
    ]

    user = current_user
    tactics = []
    steps = []
    user.department.team.events.map do |event|
      # puts "EVENT: #{event.title}"
      tactics = tactics + event.tactics.map do |tactic|
        bg = colors[tactic.id % colors.length][0]
        fg = colors[tactic.id % colors.length][1]
        border = colors[tactic.id % colors.length][2]
        bg_img = ActionController::Base.helpers.asset_path(tactic.channel.icon)

        steps = steps + tactic.steps.map do |step|
          # puts "      STEP: #{step.title}"
          {
            :id => "step-#{step.id}",
            :title => "#{step.title}",
            :description => step.tactic.title + ' - ' + step.title,
            :start => step.starts_on,
            :end => step.ends_on,
            # :color => "#dddddd",
            # :borderColor => "#cdcdcd",
            # :textColor => "#3f3f3f",
            :allDay => true,
            :type => :step,
            :cssClass => "tactic-#{step.tactic.id}",
            :channel => step.tactic.channel.id,
            :department => step.department.id,
            :tacticStart => step.tactic.starts_on
          }
        end

        c = "border-color:lightgray !important; "\
            "xborder-left-color:#{border} !important; "\
            "xborder-left-width:thick !important; "\
            "color:#{fg};"\
            "background-color:#{bg}!important;"\
            "background-image:url(\"#{bg_img}\") !important;"\
            "background-repeat:no-repeat !important;"\
            "background-position:left;"\
            "padding-left:17px;"
        # puts "   TACTIC: #{tactic.title} (#{tactic.id})"

        {
          :id => "tactic-#{tactic.id}",
          :title => "#{tactic.title}",
          :description => tactic.title,
          :start => (tactic.starts_on.noon - 11.hours),
          :realStart => tactic.starts_on.noon,
          :alternateStart => (tactic.ends_on - 1.day),
          :end => tactic.ends_on,
          :color => "RoyalBlue",
          :borderColor => "#d1efc4",
          :textColor => fg,
          :allDay => true,
          :type => :tactic,
          :cssClass => "tactic-#{tactic.id}",
          :cssRules => c,
          :channel => tactic.channel.id
        }
      end
    end
    render :json => (tactics + steps)
  end
end
