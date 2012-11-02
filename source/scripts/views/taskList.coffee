define [
    'jquery',
    'underscore',
    'backbone',

    'jade!templates/tasks'

], ($, _, Backbone, TasksTemplate ) ->

    TaskListView = Backbone.View.extend

        el: $('.task-list-container')

        events: {
            'click .task-list-item': 'taskItemClicked'
            'click .task-list-item-box': 'checkBoxClicked'
        }

        render: ->
            # Compile task list template and put in task list container
            compiledTasksTemplate = TasksTemplate {tasks: this.collection.toJSON() }
            this.$el.html compiledTasksTemplate

        #TODO do we need this shit? just for animation?
        taskItemClicked: (e) ->
            #e.preventDefault()
            #$taskItem = $(e.target).closest('.task-list-item')

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
            this.$tasks = if this.$tasks then this.$tasks else $('.task-list-item')
            if animate
                this.$tasks.animate {height: 'show'}, {duration: 150, queue: false}
            else
                this.$tasks.show()

        filterTasks: (classID, animate) ->
            this.$tasks = if this.$tasks then this.$tasks else $('.task-list-item')
            tasksToShow = this.$tasks.filter "[data-classid='#{classID}']"
            tasksToHide = _.filter this.$tasks, (div) -> $(div).attr('data-classid') != classID

            if animate
                this.$(tasksToShow).fadeIn(50)
                this.$(tasksToHide).fadeOut(50)
            else
                this.$(tasksToShow).show()
                this.$(tasksToHide).hide()

        initialize: (collection) ->
            this.collection = collection
            this.render()

    return TaskListView
