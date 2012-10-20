define [
    'jquery',
    'underscore',
    'backbone',


], ($, _, Backbone ) ->

    Router = Backbone.Router.extend
        routes:
            'class/:id': 'openClass'
            '*actions': 'defaultAction'

        openClass: (classID) ->
            App.mainView.openClass(classID, false)

       #analytics: () ->
       #    url = Backbone.history.getFragment()
       #    _gaq.push(['_trackPageview', "/#{url}"])


    initialize = ->
        router = new Router
        Backbone.history.start()
        return router


    return {
        initialize: initialize
    }
