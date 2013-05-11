define [
    'jquery',
    'underscore',
    'backbone',

    'jade!templates/tasks'

], ($, _, Backbone, TasksTemplate ) ->

    TaskListView = Backbone.View.extend

        el: $('.task-list')

        events:
            'click .tsklst-itm': 'taskItemClicked'
            'click .tsklst-itm-box': 'checkBoxClicked'

        initialize: () ->

            _.bindAll this

            @render()

            App.Events.on 'openClass', @filterTasks
            App.Events.on 'closeClass', @showAllTasks

        render: -> @$el.html TasksTemplate({tasks: @collection.toJSON()})

        #TODO do we need this shit? just for animation?
        taskItemClicked: (e) ->
            #e.preventDefault()
            #$taskItem = $(e.target).closest('.tsklist-itm')

            #classID = $taskItem.attr('data-classID')
            #type = 'task'
            #id = $taskItem.attr('data-taskID')

            #App.mainView.openPage(classID, type, id, true)
            #App.router.navigate("#/#{classID}/task/#{id}")

        checkBoxClicked: (e) ->
            e.preventDefault()
            e.stopPropagation()
            console.log "checkBoxClicked"

        showAllTasks: (animate) ->
            @$tasks = if @$tasks then @$tasks else $('.tsklist-itm')
            if animate
                @$tasks.animate {height: 'show'}, {duration: 150, queue: false}
            else
                @$tasks.show()

        filterTasks: (classID, animate) ->
            @$tasks = if @$tasks then @$tasks else @$('.tsklist-itm')
            tasksToShow = @$tasks.filter "[data-classid='#{classID}']"
            tasksToHide = _.filter @$tasks, (div) -> $(div).attr('data-classid') != classID

            if animate
                @$(tasksToShow).fadeIn(50)
                @$(tasksToHide).fadeOut(50)
            else
                @$(tasksToShow).show()
                @$(tasksToHide).hide()

    return TaskListView
