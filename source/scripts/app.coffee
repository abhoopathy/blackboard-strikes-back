window.App =
    Views: {}
    Collections: {}

#The App
define [
    'jquery',
    'underscore',
    'backbone',
    'data',
    'cs!router',
    'cs!collections/classes',
    'cs!collections/tasks',
    'cs!views/mainView',

], ($, _, Backbone,
    Data,
    Router,
    ClassCollection,
    TaskCollection,
    MainView
) ->

    initialize = ->

        ### PubSub ###
        ## 'openClass', 'openPage'
        App.Events = _.extend({}, Backbone.Events)

        ### Data Module ###
        App.Data = Data

        ### Router ###
        App.router = Router.initialize()


        ### Class Collection ###
        App.Collections.Classes = (new ClassCollection())
            .add(Data.classes)


        ### Task Collection ###
        App.Collections.Tasks = (new TaskCollection())
            .on "add", (task) ->
                # get classModel with the classID
                classModel = App.Collections.Classes.get(task.get('classID'))

                # add task to classes task list
                classModel.addTask(task)

                # add shortName to task to display in tag
                shortName = classModel.get('shortName')
                task.set('shortName', shortName)
            .add(Data.tasks)


        ### Main View ###
        App.mainView = new MainView()


    return {
        initialize: initialize
    }
