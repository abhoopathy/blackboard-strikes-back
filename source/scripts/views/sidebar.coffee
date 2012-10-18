define [
    'jquery',
    'underscore',
    'backbone',
    #'cs!data'

], ($, _, Backbone) ->

    SidebarView = Backbone.View.extend

        el: $('#side-col')

        $classes: $('.class-list-container')
        $tasks: $('.task-list-container')
        $sidecol: $('#side-col')

        events: {
            'click .class-list-item': 'expandClassListItem'
        }

        computeTaskHeight: ->
            this.$sidecol.height() - this.$classes.height()

        expandClassListItem: ->
            #console.log(this)

        init: ->

            # Set tasks height using taskHeight function
            this.$tasks.height  this.computeTaskHeight()

            # Add click handler to

    return new SidebarView
