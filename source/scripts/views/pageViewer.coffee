define [
    'jquery',
    'underscore',
    'backbone',

    #TODO can we not have this dependency?
    'data'

    'mdown!pages/1/syllabus.md'

], ($, _, Backbone, Data, SyllabusPage) ->

    CalendarPageView = Backbone.View.extend

        el: $('.content')

        render: ()->
            this.$el.html(SyllabusPage)

        openPage: (classID, type, id ,animate) ->
            console.log "(classID: #{classID}, type: #{type}, id: #{id} ,animate: #{animate})"

        initialize: () ->



    return CalendarPageView
