define [
    'jquery',
    'underscore',
    'backbone',

    'jade!templates/calendar'
    'jade!templates/event'

], ($, _, Backbone, CalendarTemplate, EventTemplate) ->

    CalendarPageView = Backbone.View.extend

        el: $('.content')

        ## Given a monthNumber (10 for october), render
        ## that much using collection data
        render: (monthNumber)->

            # Get Month Data
            month = this.collection[monthNumber]

            # Generate fake data for this month,
            this.fakeData month, 20
            this.reoccuringData month

            # Compile calendar template
            compiledTemplate = CalendarTemplate(month)
            this.$el.html compiledTemplate

            # For each event compile event template
            # and put it in calendar
            calPageView = this;
            _.each month.events, (event) ->
                event.time12 = calPageView.format12hrTime( event.time )
                $calCell = $(".cal-cell[data-day='#{event.day}']")
                    .append EventTemplate(event)


        ## Takes 4 digit, 24 hr time and returns 12hr string
        ## abbreviated for calendar
        ## i.e. 900 -> 9a, 2200 -> 10p
        format12hrTime: (time24) ->

            # TODO make this work for all times 1200-1259
            if time24 == 1200
                return '12p'
            time24 = time24 + ''

            # get hour and minute
            if time24.length > 3
                hr = time24.substr(0,2)
                min = time24.substr(2)
            else
                hr = time24.substr(0,1)
                min = time24.substr(1)

            # add am and pm
            if (hr < 12)
                ampm = 'a'
            else
                hr = hr - 12
                ampm = 'p'

            # truncate minutes if they are 00
            if min == '00'
                min = ''
            else
                hr = hr + ":"

            return hr + min + ampm

        ## Generate events from reoccuring data
        reoccuringData: (month) ->
            _.each(month.reoccuring, (reoccur) ->
                for i in [0..4]
                    evt = {
                        classID: reoccur.classID
                        name: reoccur.name
                        day: i*7 + reoccur.day
                        time: reoccur.time
                    }
                    if evt.day <= month.days
                        month.events.push(evt)
            )


        ## Generate fake event data
        fakeData: (month, numEvents) ->

            # General function to pick random element of array
            pickRandom = (arr) -> arr[_.random(0, arr.length-1)]

            # Generate array of random times [1000, 1300,...]
            times = _.union( (_.map [15..23],(n)->n*100)
                             (_.map [15..23],(n)->n*100+30) )

            # Array of possible event names
            eventNames = ["Office Hours", "Exam Review", "Exam", "Quiz", "Guest Lecture"]

            numDays = month.days
            numClasses = App.data.classes.length

            # Add fake events using pickRandom function
            start = month.events.length+1
            for i in [start..start+numEvents]
                event = {
                    "classID": pickRandom [1..numClasses]
                    "name": pickRandom eventNames
                    "day": pickRandom [1..numDays]
                    "time": pickRandom times
                }
                month.events.push(event)


        ## Show all calendar events. If animate is true, animate UI.
        showAllEvents: (animate) ->
            this.$events = if this.$events then this.$events else $('.cal-event')
            if animate
                this.$events.fadeIn(50)
            else
                this.$events.show()


        ## Show only events matching this calendar ID. If animate is
        ## true, animate UI.
        filterEvents: (classID, animate) ->

            this.$events =
                if this.$events then this.$events else $('.cal-event')

            # get events that match classID
            eventsToShow =
                this.$events.filter "[data-classid='#{classID}']"

            # get events that don't match classID
            eventsToHide =
                _.filter this.$events,
                         (div) -> $(div).attr('data-classid') != classID

            # Do hide/show work, animating if needed
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
