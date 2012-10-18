define [
    'jquery',
    'underscore',
    'backbone',

    'cs!models/task'
    'jade!templates/tasks'

], ($, _, Backbone, TaskModel, TasksTemplate ) ->

    TaskView = Backbone.View.extend

        tagName: '.task-list-item'

        collection: TaskCollection

        events: {
        }

        render: ->
            # Compile task list template and put in task list container
            compiledTasksTemplate = TasksTemplate {tasks: this.taskCollection.toJSON() }
            this.$tasks.html compiledTasksTemplate

        initialize: ->

            # # Populate tasks data
            # this.taskCollection = new TaskCollection()

            # ## When a task is added, put it in the correct class
            # tempClassCollection = this.classCollection
            # this.taskCollection.on "add", (task) ->

            #     # get classModel with the classID
            #     classModel = tempClassCollection.get(task.get('classID'))

            #     # add task to classes task list
            #     classModel.addTask(task)

            #     # add shortName to task to display in tag
            #     shortName = classModel.get('shortName')
            #     task.set('shortName', shortName)

            # this.taskCollection.add([
            #     { id: '1', classID: '1', taskName: 'Assignment #4', dueDate: 'Wed 10/17, 11am', status: 'active', checked: false },
            #     { id: '2', classID: '4', taskName: 'SS HW #3', dueDate: 'Thu 10/18 in class', status: 'active', checked: false },
            #     { id: '3', classID: '3', taskName: 'Read Ch. 11, 12', dueDate: 'Thu 10/18', status: 'active', checked: false },
            #     { id: '4', classID: '2', taskName: 'Unit 1', dueDate: 'Tues 10/16 in class', status: 'active', checked: false },
            #     { id: '5', classID: '2', taskName: 'SS HW #2', dueDate: 'Thu 10/11 in class', status: 'active', checked: false },
            #     { id: '6', classID: '5', taskName: 'Assignment #3', dueDate: 'Wed 10/10, 11am', status: 'pending grade', checked: true }
            # ])



    return SidebarView
