define [
    'jquery',
    'underscore',
    'backbone',

    'cs!collections/tasks'
    'jade!templates/tasks'

    'cs!collections/classes'
    'jade!templates/classes'

], ($, _, Backbone, TaskCollection, TasksTemplate, ClassCollection, ClassesTemplate ) ->

    SidebarView = Backbone.View.extend

        el: $('#side-col')

        $classes: $('.class-list-container')
        $tasks: $('.task-list-container')
        $sidecol: $('#side-col')

        events: {
            'click .class-list-item-text': 'expandClassListItem'
        }

        computeTaskHeight: ->
            this.$sidecol.height() - this.$classes.height()

        expandClassListItem: (e) ->
            $listItem = $(e.target).closest('.class-list-item')
            classID = $listItem.attr('data-classid')

            # get classID from dom element
            classID = $listItem.attr('data-classid')

            # find subnavigation, get height of class list
            $ul = $($listItem).find('.class-sublist');

            $ul.toggle()
            newHeight = this.$sidecol.height() - this.$classes.height();
            $ul.toggle()

            $ul.animate {height: 'toggle'}, {duration: 150, queue: false}
            this.$tasks.animate {height: newHeight}, {duration: 150, queue: false}

            #if ($(this).hasClass('.expanded')) {
            #    $(this).removeClass('.expanded');
            #    $('.task-list-item').fadeIn();
            #} else {
            #    $(this).addClass('.expanded');
            #    $('.task-list-item > .task-list-item-tag:not(.color'+class_id+')').each(function () {
            #        $(this).closest('.task-list-item').fadeOut();
            #    });
            #}

        initialize: ->

            ## Set tasks height using taskHeight function
            #this.$tasks.height  this.computeTaskHeight()

            ##### Handling Class List

            ## Populate classes
            #this.classCollection = new ClassCollection()
            #this.classCollection.add([
            #    { id: '1', fullName: 'User Centered Research and Evaluation', shortName: ' UCRE' },
            #    { id: '2', fullName: 'Cognitive Modelling', shortName: 'CogMod' },
            #    { id: '3', fullName: 'Evolution & History of Life', shortName: 'Evol' },
            #    { id: '4', fullName: 'Entrepreneurship for CS', shortName: 'Entrepr' },
            #    { id: '5', fullName: 'Interpretation and Argument', shortName: 'Interp' },
            #]);

            ## Compile class list template and put in class list container
            #compiledClassesTemplate = ClassesTemplate {classes: this.classCollection.toJSON() }
            #this.$classes.html compiledClassesTemplate


            ##### Handling Tasks

            ## Populate tasks data
            #this.taskCollection = new TaskCollection()

            ### When a task is added, put it in the correct class
            #tempClassCollection = this.classCollection
            #this.taskCollection.on "add", (task) ->

            #    # get classModel with the classID
            #    classModel = tempClassCollection.get(task.get('classID'))

            #    # add task to classes task list
            #    classModel.addTask(task)

            #    # add shortName to task to display in tag
            #    shortName = classModel.get('shortName')
            #    task.set('shortName', shortName)

            #this.taskCollection.add([
            #    { id: '1', classID: '1', taskName: 'Assignment #4', dueDate: 'Wed 10/17, 11am', status: 'active', checked: false },
            #    { id: '2', classID: '4', taskName: 'SS HW #3', dueDate: 'Thu 10/18 in class', status: 'active', checked: false },
            #    { id: '3', classID: '3', taskName: 'Read Ch. 11, 12', dueDate: 'Thu 10/18', status: 'active', checked: false },
            #    { id: '4', classID: '2', taskName: 'Unit 1', dueDate: 'Tues 10/16 in class', status: 'active', checked: false },
            #    { id: '5', classID: '2', taskName: 'SS HW #2', dueDate: 'Thu 10/11 in class', status: 'active', checked: false },
            #    { id: '6', classID: '5', taskName: 'Assignment #3', dueDate: 'Wed 10/10, 11am', status: 'pending grade', checked: true }
            #])

            # Compile task list template and put in task list container
            compiledTasksTemplate = TasksTemplate {tasks: this.taskCollection.toJSON() }
            this.$tasks.html compiledTasksTemplate


    return SidebarView
