define [
    'jquery',
    'underscore',
    'backbone',

    'cs!views/sidebar'
    'cs!views/main'

], ($, _, Backbone, SidebarView, MainView) ->

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
        this.sidebarView = new SidebarView()
        this.sidebarView.initialize()

    return {
        initialize: initialize
    }
