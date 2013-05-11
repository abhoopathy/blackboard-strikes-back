define [
    'jquery',
    'underscore',
    'backbone',
    'jade!templates/chatListTemplate',

], ($, _, Backbone,
    ChatListTemplate
) ->

    ChatListView = Backbone.View.extend

        initialize: ->
            _.bindAll this

            @collection = new Backbone.Collection()

            @collection.add [
                {
                    personID: 2
                    name: 'Jen Mankoff'
                    role: 'Instructor'
                    classID: 1
                    status: "online"

                    #TODO: programmatic
                    shortName: "UCRE"
                },
                {
                    personID: 1
                    name: 'Russel DeStilo'
                    role: 'TA'
                    classID: 2
                    status: "online"

                    #TODO: programmatic
                    shortName: "CogMod"
                },
                {
                    name: 'Bill Courtright'
                    role: 'Instructor'
                    classID: 3
                    status: "offline"

                    #TODO: programmatic
                    shortName: "Evolution"
                }
            ]

            @render()

            App.Events.on 'toolbar:chatButtonClicked', @show


        appClick: (e)->
            # if clickTarget is not contained in popup
            if ($(e.target).closest(@$el).length == 0)
                @hide()

        render: ->
            @$el.html ChatListTemplate
                people: @collection.toJSON()

        show: ->
            if !@visible
                @$el.show()
                @visible = true
                App.Events.off 'toolbar:chatButtonClicked', @show
                setTimeout @attachAppClickHandler, 20

        attachAppClickHandler: -> App.Events.on 'app:click', @appClick


        hide: ->
            if @visible
                @$el.hide()
                @visible = false
                App.Events.on 'toolbar:chatButtonClicked', @show
                setTimeout @detachAppClickHandler, 20

        detachAppClickHandler: -> App.Events.off 'app:click', @appClick




    return ChatListView
