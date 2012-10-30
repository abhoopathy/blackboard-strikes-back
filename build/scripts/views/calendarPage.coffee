define [
    'jquery',
    'backbone',

    'jade!templates/calendar'
    'jade!templates/event'

], ($, Backbone, CalendarTemplate, EventTemplate) ->

    CalendarPageView = Backbone.View.extend

        el: $('.content')

        render: (monthNumber)->
            month = this.collection[monthNumber]
            compiledTemplate = CalendarTemplate(month)
            this.$el.html compiledTemplate

            _.each month.events, (event) ->
                $calCell = $(".cal-cell[data-day='#{event.day}']")
                    .append EventTemplate(event)

        showAllEvents: (animate) ->
            this.$events = if this.$events then this.$events else $('.cal-event')
            if animate
                this.$events.fadeIn(50)
            else
                this.$events.show()

        filterEvents: (classID, animate) ->
            this.$events = if this.$events then this.$events else $('.cal-event')
            eventsToShow = this.$events.filter "[data-classid='#{classID}']"
            eventsToHide = _.filter this.$events, (div) -> $(div).attr('data-classid') != classID

            if animate
                this.$(eventsToShow).fadeIn(50)
                this.$(eventsToHide).fadeOut(50)
            else
                this.$(eventsToShow).show()
                this.$(eventsToHide).hide()


        initialize: (collection) ->
            this.collection = collection
            currentMonthNumber = (new Date()).getMonth()+1
            this.render(currentMonthNumber)


    return CalendarPageView
