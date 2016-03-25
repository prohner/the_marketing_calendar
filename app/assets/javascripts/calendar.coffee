# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
debugging = true

ready = ->
  console.log 'executing ready()'

  $('#popover-test').popover { placement: 'bottom' }

  title = "Filter Settings"
  d = "
    <table border=0>
      <tr>
        <td>View &nbsp; &nbsp;</td>
        <td nowrap>
          <input type='radio' value='exec' checked>Executive &nbsp; &nbsp;
          <input type='radio' value='mgr'>Manager &nbsp; &nbsp;
          <input type='radio' value='oper'>Operator
        </td>
      </tr>
    </table>
  "
  $('#calendar-menu-filter').popover {
			title: title
			html: true
			template: '<div class="popover popover-width-control" style="max-width: 1000px!important; xwidth:600px; xheight:350px;"><div class="popover-arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>',
			content: d
			placement: 'bottom'
			container: '#calendar'
		}

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
        # console.log "Checking '" + event.title + "'" if debugging
        if event.cssRules != undefined
          # console.log 'Event type ' + event.type + ' Rules: ' + event.cssRules
          $('<style>.' + event.cssClass + ' {' + event.cssRules + '}</style>').appendTo('head');
        $(element).addClass event.cssClass

        if event.type == 'tactic'
          $(element).css "font-style", "italic"

        if event.type == 'event'
          $(element).css "font-weight", "bold"
          $(element).css "font-style", "italic"
          event.rendering = 'background'

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
