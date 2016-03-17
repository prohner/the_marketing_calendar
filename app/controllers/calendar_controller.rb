class CalendarController < ApplicationController
  def index
  end

  def events
    # events = [{
    #       id: "event-1",
    #       text: "event.title",
    #       type: 'project',
    #       start_date: '3/7/2016',
    #       end_date: '3/10/2016',
    #       open: true
    #     }]
    #
    # render json: { data: events, links: Array.new }

    render json: '[{"id":111,"title":"Event1","start":"2016-03-07","end":"2016-03-10","url":"http:\/\/yahoo.com\/"},{"id":222,"title":"Event2","start":"2016-03-20","end":"2016-03-22","url":"http:\/\/yahoo.com\/"}]'
  end
end
