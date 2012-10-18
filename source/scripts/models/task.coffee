
define [
    'underscore',
    'backbone',

], (_, Backbone) ->

    TaskModel = Backbone.Model.extend

        defaults: {
            taskID: ''
            taskName: 'new task'
            dueDate: 'due'
            status: ''
            classID: '1'
        }

    return TaskModel
