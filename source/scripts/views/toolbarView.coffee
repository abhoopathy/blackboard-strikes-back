define [
    'jquery',
    'underscore',
    'backbone',
    'cs!views/chatListView',
    'cs!views/notificationListView',

    'jade!templates/toolbarTemplate',

], ($, _, Backbone,
    ChatListView
    NotificationListView
    ToolbarTemplate
) ->

    ToolbarView = Backbone.View.extend

        el: $('.toolbar')

        events:
            'click .tbar-btn-chat'          : 'chatButtonClicked'
            'click .tbar-btn-settings'      : 'settingsButtonClicked'
            'click .tbar-btn-notifications' : 'notificationButtonClicked'

        #TODO: it would be cool if we could hack global events into backbone
        # events hash, and take out this extra step.
        # OR pattern match events on attributes. that would also be cool.
        chatButtonClicked: -> App.Events.trigger "toolbar:chatButtonClicked"
        settingsButtonClicked: -> App.Events.trigger "toolbar:settingsButtonClicked"
        notificationButtonClicked: -> App.Events.trigger "toolbar:notificationButtonClicked"

        initialize: ->
            @render()
            App.Views.ChatListView = new ChatListView {el: $('.chat-list')}
            App.Views.NotificationListView = new ChatListView {el: $('.notification-list')}


        render: -> @$el.html ToolbarTemplate()


    return ToolbarView
