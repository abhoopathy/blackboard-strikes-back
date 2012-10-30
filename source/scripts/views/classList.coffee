define [
    'jquery',
    'underscore',
    'backbone',

    'jade!templates/classes'

], ($, _, Backbone, ClassListTemplate) ->

    ClassListView = Backbone.View.extend

        el: $('.class-list-container')

        events: {
            'click .class-list-item-text': 'classItemClicked'
        }

        render: ->
            compiledTemplate = ClassListTemplate {classes: this.collection.toJSON() }
            this.$el.html compiledTemplate

        classItemClicked: (e) ->
            $listItem = $(e.target).closest('.class-list-item')
            classID = $listItem.attr('data-classid')

            #collapse
            if classID == App.mainView.currentClassID
                App.router.navigate("")
                App.mainView.closeClass($listItem, true)

            #expand
            else
                App.router.navigate("class/#{classID}")
                App.mainView.openClass(classID, true, $listItem)

        initialize: (collection) ->
            this.collection = collection
            this.render()

    return ClassListView
