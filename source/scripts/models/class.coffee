
define [
    'underscore',
    'backbone',

], (_, Backbone) ->

    ClassModel = Backbone.Model.extend

        defaults: {
            classID: '1'
            fullName: ''
            shortName: ''
            tasks: []
        }

        addTask: (task) ->
            tasks = this.get('tasks')
            tasks.push(task)

    return ClassModel
