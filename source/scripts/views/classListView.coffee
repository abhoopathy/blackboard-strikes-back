define [
    'jquery',
    'underscore',
    'backbone',

    'jade!templates/classes'

], ($, _, Backbone, ClassListTemplate) ->

    ClassListView = Backbone.View.extend

        el: $('.class-list')

        events:
            'click .clsslist-itm > ul > li > a': 'classSubPageClicked'
            'click .clsslist-itm': 'classItemClicked'

        render: ->
            @$el.html ClassListTemplate {classes: @collection.toJSON() }

        classSubPageClicked: (e) -> e.stopPropagation()

        classItemClicked: (e) ->
            $listItem = $(e.target).closest('.clsslist-itm')
            classID = $listItem.attr('data-classid')

            #collapse
            if classID == App.mainView.currentClassID
                App.router.navigate("")
                App.Events.trigger 'closeClass', $listItem, true

            #expand
            else
                App.router.navigate("class/#{classID}")
                App.Events.trigger 'openClass', classID, true

        initialize: () -> @render()

    return ClassListView
