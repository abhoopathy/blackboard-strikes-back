window.App = {}

#The App
define [
    'jquery',
    'underscore',
    'backbone',
    'cs!router',
    'cs!views/main'
], ($, _, Backbone, Router, MainView ) ->

    window.App =
        initialize: ->
            App.mainView = new MainView()
            App.router = Router.initialize();
