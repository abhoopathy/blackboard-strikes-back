define [
    'jquery',
    'underscore',
    'backbone',

], ($, _, Backbone
) ->

    NotificationListView = Backbone.View.extend

        initialize: ->
            _.bindAll this

            App.Events.on 'toolbar:notificationButtonClicked', @show


        appClick: (e)->
            # if clickTarget is not contained in popup
            if ($(e.target).closest(@$el).length == 0)
                @hide()

        show: ->
            console.log "hi"
            if !@visible
                @$el.show()
                @visible = true
                App.Events.off 'toolbar:notificationButtonClicked', @show
                setTimeout @attachAppClickHandler, 20

        attachAppClickHandler: -> App.Events.on 'app:click', @appClick

        hide: ->
            if @visible
                @$el.hide()
                @visible = false
                App.Events.on 'toolbar:notificationButtonClicked', @show
                setTimeout @detachAppClickHandler, 20

        detachAppClickHandler: -> App.Events.off 'app:click', @appClick


    return NotificationListView
