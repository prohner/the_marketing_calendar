# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
debugging = true

ready = ->
  console.log 'executing ready()'
  if typeof $('#calendar').fullCalendar != 'undefined'
    console.log '  loading calendar'
    $('#calendar').fullCalendar {
      editable: true
      header: {
        left: 'prev,next,today'
        center: 'title'
        right: 'month,basicWeek,basicDay'
      }
      weekNumbers: true
      loading: (isLoading, view) ->
        if isLoading
          $('#loading').show()
          $('#reveal-snap-toggle').hide()
        else
          $('#loading').hide()
          $('#reveal-snap-toggle').show()
      timeFormat: 'h:mm t{ - h:mm t} '
      dragOpacity: "0.5"
      eventSources: [
      	{
      		url: 'http://localhost:3000/calendar/events.json'
      		ignoreTimezone: true
      		crossDomain: true
      		jsonp: true
      		error: () ->
      			alert "there was an error while fetching events"
      	}
      ]

      eventRender: (event, element) ->
        console.log "Checking '" + event.title + "'" if debugging
        $(element).addClass(event.cssClass)
        # if hidden_category_groups.indexOf(event.category_group_id) >= 0
        #   # console.log "  Event '" + event.title + "' category is hidden" if debugging
        #   $(element).hide();

      eventAfterRender: (event, element, view) ->
        $(element).attr "id", "event-id-" + event.id

      eventClick: (event, jsEvent, view) ->
        console.log event.title + " was clicked" if debugging
    }

$(document).ready(ready);
$(document).on('page:load', ready);
