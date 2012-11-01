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
    window.App = {}
    App.mainView = new MainView()
    App.router = Router.initialize()
