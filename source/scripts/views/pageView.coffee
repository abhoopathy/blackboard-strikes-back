define [
    'jquery',
    'underscore',
    'backbone',
    'markdown',

    #TODO can we not have this dependency?
    'data'

], ($, _, Backbone, Markdown, Data) ->

    CalendarPageView = Backbone.View.extend

        el: $('.content')


        render: (classID, type, id, animate)->

            view = this
            $.ajax
                url: "scripts/pages/#{classID}/#{type}/#{id}.md"
                dataType: "text"
                success: (text) ->
                    view.$el.html (Markdown.makeHtml text)

        openPage: (classID, type, id ,animate) ->
            #console.log "(classID: #{classID}, type: #{type}, id: #{id} ,animate: #{animate})"
            this.render(classID, type, id, animate)

        initialize: () ->


    return CalendarPageView
