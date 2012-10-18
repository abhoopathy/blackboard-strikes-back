define [
    'jquery',
    'underscore',
    'backbone',

    'jade!templates/tasks'

], ($, _, Backbone, TasksTemplate ) ->

    TaskListView = Backbone.View.extend

        el: $('.task-list-container')

        events: {
        }

        render: ->
            # Compile task list template and put in task list container
            compiledTasksTemplate = TasksTemplate {tasks: this.collection.toJSON() }
            this.$el.html compiledTasksTemplate

        initialize: (collection) ->
            this.collection = collection
            this.render()

    return TaskListView
