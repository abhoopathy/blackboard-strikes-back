define [
    'underscore',
    'backbone',
    'cs!models/task'

], (_, Backbone, TaskModel) ->

    TaskCollection = Backbone.Collection.extend
        model: TaskModel

    return TaskCollection
