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
            '': 'home'

        home: ->
            #this.show_project('venmoHomepage')

       #analytics: () ->
       #    url = Backbone.history.getFragment()
       #    _gaq.push(['_trackPageview', "/#{url}"])


    returnable =

        sidebarView: SidebarView

        initialize: ->
            app_router = new AppRouter
            Backbone.history.start()
            this.sidebarView.init()
