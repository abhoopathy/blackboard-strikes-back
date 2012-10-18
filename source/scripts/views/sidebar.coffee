define [
    'jquery',
    'underscore',
    'backbone',

], ($, _, Backbone) ->

    MainView = Backbone.View.extend

        el: $('body')

        $classes: $('#side-col .class-list-container')
        $tasks: $('#side-col .task-list-container')
        $sidecol: $('#side-col')

        events: {
            'click .class-list-item-text': 'expandClassListItem'
        }

        computeTaskHeight: ->
            this.$sidecol.height() - this.$classes.height()

        expandClassListItem: (e) ->
            $listItem = $(e.target).closest('.class-list-item')
            classID = $listItem.attr('data-classid')

            # get classID from dom element
            classID = $listItem.attr('data-classid')

            # find subnavigation, get height of class list
            $ul = $($listItem).find('.class-sublist');

            $ul.toggle()
            newHeight = this.$sidecol.height() - this.$classes.height();
            $ul.toggle()

            $ul.animate {height: 'toggle'}, {duration: 150, queue: false}
            this.$tasks.animate {height: newHeight}, {duration: 150, queue: false}


        initialize: ->
            console.log "hi"

    return SidebarView
