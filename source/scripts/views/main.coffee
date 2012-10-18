define [
    'jquery',
    'underscore',
    'backbone',
    #'cs!data'

], ($, _, Backbone) ->

    MainView = Backbone.View.extend

        el: $('#side-col')

    return new MainView
