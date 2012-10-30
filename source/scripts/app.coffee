window.App = {}

#The App
define [
    'jquery',
    'underscore',
    'backbone',

    'cs!router',
    'cs!views/main',

    'cs!views/classList',
    'cs!views/taskList',

], ($, _, Backbone, Router, MainView, ClassList, TaskList) ->
    window.App =

        initialize: ->
            $.ajax {
                url: "scripts/data.json"
                dataType: 'json'
                success: (data) ->
                    App.data = data
                    App.mainView = new MainView()
                    App.router = Router.initialize();
            }

