define [
    'jquery',
    'underscore',
    'backbone',

    'jade!templates/classes'

], ($, _, Backbone, ClassListTemplate ) ->

    ClassListView = Backbone.View.extend

        el: $('.class-list-container')

        events: {
        }

        render: ->
            compiledTemplate = ClassListTemplate {classes: this.collection.toJSON() }
            this.$el.html compiledTemplate

        initialize: (collection) ->
            this.collection = collection
            this.render()

    return ClassListView
