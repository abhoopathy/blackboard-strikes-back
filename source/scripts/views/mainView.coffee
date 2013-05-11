define [
    'jquery',
    'underscore',
    'backbone',

    'cs!views/classListView',
    'cs!views/taskListView'
    'cs!views/toolbarView',
    'cs!views/calendarPageView',
    'cs!views/pageView'

], ($, _, Backbone,

    ClassListView,
    TaskListView,
    ToolbarView,
    CalendarPageView,
    PageView) ->

    MainView = Backbone.View.extend

        el: $('.app-wrapper')

        initialize: () ->

            _.bindAll this

            @$sideCol = @$('#side-col')

            App.toolbarView = new ToolbarView()
            App.pageView = new PageView()

            App.calendarPageView = new CalendarPageView()

            App.classListView = new ClassListView
                collection: App.Collections.Classes

            App.taskListView = new TaskListView
                collection: App.Collections.Tasks

            #set initial height
            @setHeight()
            $(window).resize @setHeight

            @bindEvents()

        events:
            'click': 'appWideClick'

        appWideClick: (e) ->
            App.Events.trigger 'app:click', e

        bindEvents: ->
            App.Events.on 'openClass', @openClass
            App.Events.on 'closeClass', @closeClass
            App.Events.on 'openPage', @openPage

        computeTaskHeight: ->
            @$sideCol.height() - App.classListView.$el.height()

        setHeight: ->
            newHeight = @computeTaskHeight()
            App.taskListView.$el.height(newHeight)

        closeClass: ($listItem, animate) ->
            $hideUl = $listItem.find('.class-sublist')
            if animate
                speed = 150

                ## find height to animate
                $hideUl.hide()
                newHeight = @computeTaskHeight()
                $hideUl.show()

                $hideUl.animate {height: 'hide'}, {duration: speed, queue: false}
                App.taskListView.$el.animate {height: newHeight}, {duration: speed, queue: false}

            else
                $hideUl.hide()

            #App.calendarPageView.showAllEvents(animate)
            @currentClassID = null

        openClass: (classID, animate, $listItem) ->

            # Find divs to close and open. Close item is null if nothing is open
            $toCloseItem = if @currentClassID then $(".clsslist-itm[data-classid='#{@currentClassID}']") else null
            $toOpenItem = if $listItem then $listItem else $(".clsslist-itm[data-classid='#{classID}']")

            # Find Subnavs
            if $toCloseItem
                $closeUl = $toCloseItem.find('.class-sublist')

            $openUl = $toOpenItem.find('.class-sublist')

            if animate
                speed = 150

                ## find height to animate
                # TODO do this without dom modification
                if $toCloseItem
                    $closeUl.hide()
                $openUl.show()
                newHeight = @computeTaskHeight()
                $openUl.hide()
                if $toCloseItem
                    $closeUl.show()

                # actually animate
                if $toCloseItem
                    $closeUl.animate {height: 'hide'}, {duration: speed, queue: false}
                $openUl.animate {height: 'toggle'}, {duration: speed, queue: false}
                App.taskListView.$el.animate {height: newHeight}, {duration: speed, queue: false}

            else
                if $toCloseItem
                    $closeUl.hide()
                $openUl.show()
                @setHeight()

            @currentClassID = classID

            #App.calendarPageView.filterEvents(classID, animate)

        openPage: (classID, type, id, animate) ->
            App.Events.trigger 'openPage', classID, type, id, animate
            #App.pageViewer.openPage(classID, type, id ,animate)

    return MainView
