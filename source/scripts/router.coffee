define [
    'jquery',
    'underscore',
    'backbone',


], ($, _, Backbone ) ->

    Router = Backbone.Router.extend

        routes:
            'class/:id': 'openClass'
            'class/:id/:type/:sectionTag': 'openPage'
            'class/:id/:type/:taskID': 'openPage'
            '*actions': 'defaultAction'

        openClass: (classID) ->
            App.Events.trigger 'openClass', classID, false
            #App.mainView.openClass classID, false

        openPage: (classID, type, id, sectionTag) ->
            App.Events.trigger 'openPage', classID, type, id, false
            #App.mainView.openPage(classID, type, id, false)

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
