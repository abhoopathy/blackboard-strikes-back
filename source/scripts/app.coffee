#The App
define [
    'jquery',
    'underscore',
    'backbone',
    'cs!router'
], ($, _, Backbone, Router) ->

    App =
        initialize: ->
            Router.initialize();
