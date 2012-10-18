define [
    'jquery',
    'underscore',
    'backbone',

    'cs!views/main'

], ($, _, Backbone, MainView) ->

    AppRouter = Backbone.Router.extend
        self: this

        routes:
            #'proj/:tag_name': 'show_project'
            #'branding': 'show_branding_page'
            '*actions': 'defaultAction'

       #analytics: () ->
       #    url = Backbone.history.getFragment()
       #    _gaq.push(['_trackPageview', "/#{url}"])


    initialize = ->
        appRouter = new AppRouter

        appRouter.on('defaultAction')
        Backbone.history.start()
        this.mainView = new MainView()

    return {
        initialize: initialize
    }
