
define [
    'underscore',
    'backbone',

], (_, Backbone) ->

    EventModel = Backbone.Model.extend

        defaults: {
            eventID: '1'
            classID: ''
            fullName: ''
            tasks: []
            time: {}
        }

        addTask: (task) ->
            tasks = this.get('tasks')
            tasks.push(task)

    return ClassModel
