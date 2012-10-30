define [
    'jquery',
    'underscore',
    'backbone',

    'jade!templates/calendar'
    'jade!templates/event'

], ($, _, Backbone, CalendarTemplate, EventTemplate) ->

    CalendarPageView = Backbone.View.extend

        el: $('.content')

        render: (monthNumber)->
            month = this.collection[monthNumber]
            this.fakeData month
            compiledTemplate = CalendarTemplate(month)
            this.$el.html compiledTemplate

            _.each month.events, (event) ->
                $calCell = $(".cal-cell[data-day='#{event.day}']")
                    .append EventTemplate(event)

        fakeData: (month) ->

            numDays = month.days
            numClasses = App.data.classes.length

            # pick from array
            pickRandom = (arr) -> arr[_.random(0, arr.length-1)]

            # to get random event name
            times = _.union( (_.map [9..11], (n) -> n + "a"), (_.map [1..10], (n) -> n + "p") )

            # to get random event name
            eventNames = ["Office Hours", "Exam Review", "Quiz", "Guest Lecture"]

            start = month.events.length+1
            for i in [start..start+50]
                id = i
                event = {
                    "id": id
                    "classID": pickRandom [1..numClasses]
                    "name": pickRandom eventNames
                    "day": pickRandom [1..numDays]
                    "time": pickRandom times
                }
                month.events.push(event)

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
