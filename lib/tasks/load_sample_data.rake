namespace :tmc do
  desc "Load some sample data"
  task :load => :environment do
    StepComment.delete_all
    FollowedStep.delete_all
    Step.delete_all
    TacticComment.delete_all
    FollowedTactic.delete_all
    Tactic.delete_all
    User.delete_all
    Department.delete_all
    Team.delete_all
    Tactic.delete_all
    Channel.delete_all
    Event.delete_all

    @em_channel = Channel.create!(title: 'Email')
    @dm_channel = Channel.create!(title: 'Direct mail')
    @sms_channel = Channel.create!(title: 'SMS')
    @web_channel = Channel.create!(title: 'Web')
    @social_channel = Channel.create!(title: 'Social')

    tmc_team = Team.create!(team_name: 'The Marketing Calendar')
    other_team = Team.create!(team_name: 'NOT The Marketing Calendar')

    @marketing_dept = Department.create!(department_name: 'Marketing', team: tmc_team)
    @it_dept = Department.create!(department_name: 'IT', team: tmc_team)
    @creative_dept = Department.create!(department_name: 'Creative', team: tmc_team)

    preston = User.create!(email: 'pr@themarketingcalendar.com', first_name: 'Preston', last_name: 'Rohner', department: @marketing_dept)
    yves = User.create!(email: 'ya@themarketingcalendar.com', first_name: 'Yves', last_name: 'Accad', department: @it_dept)
    @users = [preston, yves]
    @users << User.create!(email: 'other1@themarketingcalendar.com', first_name: 'Joe', last_name: 'Swanson', department: @marketing_dept)
    @users << User.create!(email: 'other1@themarketingcalendar.com', first_name: 'Bob', last_name: 'Johnson', department: @creative_dept)

    current_year = 2016
    current_month = 3
    last_day_of_month = 31

    event1 = Event.create!(title: "Major Holiday Event", starts_on: make_date(current_year, current_month, 10), ends_on: make_date(current_year, current_month, 17))
    create_email(event1, "auto-generate-email-name", current_year, current_month, 10)
    create_email(event1, "auto-generate-email-name", current_year, current_month, 12)
    create_email(event1, "auto-generate-email-name", current_year, current_month, 14)
    create_dm(   event1, "auto-generate-dm-name",    current_year, current_month, 14)
    create_email(event1, "auto-generate-email-name", current_year, current_month, 15)
    create_sms(  event1, "auto-generate-sms-name",   current_year, current_month, 15)
    create_email(event1, "Extended Email", current_year, current_month, 16)

    event2 = Event.create!(title: "Emailings for Month", starts_on: make_date(current_year, current_month, 1), ends_on: make_date(current_year, current_month, 29))
    create_dm(   event2, "auto-generate-dm-name",    current_year, current_month, 1)
    create_email(event2, "auto-generate-email-name", current_year, current_month, 1)
    create_email(event2, "auto-generate-email-name", current_year, current_month, 3)
    create_email(event2, "auto-generate-email-name", current_year, current_month, 5)
    create_sms(  event2, "auto-generate-sms-name",   current_year, current_month, 5)
    create_email(event2, "auto-generate-email-name", current_year, current_month, 8)
    create_email(event2, "auto-generate-email-name", current_year, current_month, 17)
    create_email(event2, "auto-generate-email-name", current_year, current_month, 19)
    create_email(event2, "auto-generate-email-name", current_year, current_month, 22)
    create_sms(  event2, "auto-generate-sms-name",   current_year, current_month, 22)
    create_email(event2, "auto-generate-email-name", current_year, current_month, 24)
    create_email(event2, "auto-generate-email-name", current_year, current_month, 26)
    create_email(event2, "auto-generate-email-name", current_year, current_month, 29)
  end

  def create_email(event, title, y, m, d)
    if title == 'auto-generate-email-name'
      title = make_date(y, m, d).strftime('%A')[0..2] + ' Email'
    end
    em = Tactic.create!(title: title, starts_on: make_date(y, m, d) - 2.days, ends_on: make_date(y, m, d) + 1.day, event: event, channel: @em_channel)
    steps = Array.new
    steps << Step.create!(title: "Selections Complete", starts_on: make_date(y, m, d) - 2.days, ends_on: make_date(y, m, d) - 1.day, tactic: em, department: @marketing_dept)
    steps << Step.create!(title: "HTML Complete", starts_on: make_date(y, m, d) - 1.day, ends_on: make_date(y, m, d), tactic: em, department: @creative_dept)
    steps << Step.create!(title: "Deliver", starts_on: make_time(y, m, d, 12, 0), ends_on: make_date(y, m, d) + 1.day, tactic: em, department: @it_dept)

    steps.each do |step|
      if rand(0..2) == 0
        StepComment.create!(comment: 'Someone commented on this step.', step: step, user: @users[rand(0..(@users.length - 1))])
      end

      if rand(0..2) == 0
        FollowedStep.create!(step: step, user: @users[rand(0..(@users.length - 1))])
      end
    end

    4.times do |i|
      if rand(0..2) == 0
        TacticComment.create!(comment: "Comment #{i} on this tactic.", tactic: em, user: @users[rand(0..(@users.length - 1))])
      end

      if rand(0..2) == 0
        FollowedTactic.create!(tactic: em, user: @users[rand(0..(@users.length - 1))])
      end
    end
  end

  def create_sms(event, title, y, m, d)
    if title == 'auto-generate-sms-name'
      title = make_date(y, m, d).strftime('%A')[0..2] + ' SMS'
    end
    sms = Tactic.create!(title: title, starts_on: make_date(y, m, d) - 1.days, ends_on: make_date(y, m, d) + 1.day, event: event, channel: @sms_channel)
    steps = Array.new
    steps << Step.create!(title: "Message Approved", starts_on: make_date(y, m, d) - 1.days, ends_on: make_date(y, m, d), tactic: sms, department: @marketing_dept)
    steps << Step.create!(title: "Deliver", starts_on: make_time(y, m, d, 12, 0), ends_on: make_date(y, m, d) + 1.day, tactic: sms, department: @it_dept)

    steps.each do |step|
      if rand(0..2) == 0
        StepComment.create!(comment: 'Someone commented on this step.', step: step, user: @users[rand(0..(@users.length - 1))])
      end

      if rand(0..2) == 0
        FollowedStep.create!(step: step, user: @users[rand(0..(@users.length - 1))])
      end
    end

    4.times do |i|
      if rand(0..2) == 0
        TacticComment.create!(comment: "Comment #{i} on this tactic.", tactic: sms, user: @users[rand(0..(@users.length - 1))])
      end

      if rand(0..2) == 0
        FollowedTactic.create!(tactic: sms, user: @users[rand(0..(@users.length - 1))])
      end
    end
  end

  def create_dm(event, title, y, m, d)
    if title == 'auto-generate-dm-name'
      title = make_date(y, m, d).strftime('%A')[0..2] + ' SMS'
    end
    dm = Tactic.create!(title: title, starts_on: make_date(y, m, d) - 1.days, ends_on: make_date(y, m, d) + 1.day, event: event, channel: @dm_channel)
    steps = Array.new
    steps << Step.create!(title: "Art Complete", starts_on: make_date(y, m, d) - 31.day, ends_on: make_date(y, m, d) - 30.days, tactic: dm, department: @creative_dept)
    steps << Step.create!(title: "Art Approved", starts_on: make_date(y, m, d) - 30.days, ends_on: make_date(y, m, d) - 29.days, tactic: dm, department: @marketing_dept)
    steps << Step.create!(title: "Selections Complete", starts_on: make_date(y, m, d) - 2.days, ends_on: make_date(y, m, d) - 1.day, tactic: dm, department: @marketing_dept)
    steps << Step.create!(title: "File to mail house", starts_on: make_date(y, m, d) - 15.days, ends_on: make_date(y, m, d), tactic: dm, department: @marketing_dept)
    steps << Step.create!(title: "Deliver", starts_on: make_time(y, m, d, 12, 0), ends_on: make_date(y, m, d) + 1.day, tactic: dm, department: @it_dept)

    steps.each do |step|
      if rand(0..2) == 0
        StepComment.create!(comment: 'Someone commented on this step.', step: step, user: @users[rand(0..(@users.length - 1))])
      end

      if rand(0..2) == 0
        FollowedStep.create!(step: step, user: @users[rand(0..(@users.length - 1))])
      end
    end

    4.times do |i|
      if rand(0..2) == 0
        TacticComment.create!(comment: "Comment #{i} on this tactic.", tactic: dm, user: @users[rand(0..(@users.length - 1))])
      end

      if rand(0..2) == 0
        FollowedTactic.create!(tactic: dm, user: @users[rand(0..(@users.length - 1))])
      end
    end
  end

  def make_date(y, m, d)
    Time.utc(y, m, d)
  end

  def make_time(y, m, d, h, mn)
    Time.utc(y, m, d, h, mn)
  end
end
