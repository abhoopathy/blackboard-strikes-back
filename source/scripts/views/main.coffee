define [
    'jquery',
    'underscore',
    'backbone',

    'cs!collections/classes',
    'cs!views/classList',

    'cs!collections/tasks',
    'cs!views/taskList'

    'cs!views/calendarPage'

], ($, _, Backbone, ClassCollection, ClassListView, TaskCollection, TaskListView, CalendarPageView) ->

    MainView = Backbone.View.extend

        el: $('#side-col')

        events: {}

        currentClassID: null

        computeTaskHeight: ->
            this.$el.height() - App.classListView.$el.height()

        setHeight: ->
            newHeight = this.computeTaskHeight()
            App.taskListView.$el.height(newHeight)

        closeClass: ($listItem, animate) ->
            $hideUl = $listItem.find('.class-sublist')
            if animate
                speed = 150

                ## find height to animate
                $hideUl.hide()
                newHeight = this.computeTaskHeight()
                $hideUl.show()

                $hideUl.animate {height: 'hide'}, {duration: speed, queue: false}
                App.taskListView.$el.animate {height: newHeight}, {duration: speed, queue: false}

            else
                $hideUl.hide()

            App.taskListView.showAllTasks(animate)
            App.calendarPageView.showAllEvents(animate)
            this.currentClassID = null

        openClass: (classID, animate, $listItem) ->

            # Find divs to close and open. Close item is null if nothing is open
            $toCloseItem = if this.currentClassID then $(".class-list-item[data-classid='#{this.currentClassID}']") else null
            $toOpenItem = if $listItem then $listItem else $(".class-list-item[data-classid='#{classID}']")

            # Find Subnavs
            if $toCloseItem
                $closeUl = $toCloseItem.find('.class-sublist')

            $openUl = $toOpenItem.find('.class-sublist')

            if animate
                speed = 150

                ## find height to animate
                # TODO do this without dom modification
                if $toCloseItem
                    $closeUl.hide()
                $openUl.show()
                newHeight = this.computeTaskHeight()
                $openUl.hide()
                if $toCloseItem
                    $closeUl.show()


                # actually animate
                if $toCloseItem
                    $closeUl.animate {height: 'hide'}, {duration: speed, queue: false}
                $openUl.animate {height: 'toggle'}, {duration: speed, queue: false}
                App.taskListView.$el.animate {height: newHeight}, {duration: speed, queue: false}

            else
                if $toCloseItem
                    $closeUl.hide()
                $openUl.show()
                this.setHeight()

            App.taskListView.filterTasks(classID, animate)
            App.calendarPageView.filterEvents(classID, animate)
            this.currentClassID = classID

        initialize: (data) ->
            ##### Handling Calendar ####
            App.calendarPageView = new CalendarPageView(data.months)

            ##### Handling Class List ####

            ## Populate classes
            this.classCollection = new ClassCollection()
            this.classCollection.add(data.classes)
            App.classListView = new ClassListView(this.classCollection)


            #### Handling Task List ####
            this.taskCollection = new TaskCollection()

            ## When a task is added, put it in the correct class
            tempClassCollection = this.classCollection
            this.taskCollection.on "add", (task) ->

                # get classModel with the classID
                classModel = tempClassCollection.get(task.get('classID'))

                # add task to classes task list
                classModel.addTask(task)

                # add shortName to task to display in tag
                shortName = classModel.get('shortName')
                task.set('shortName', shortName)

            this.taskCollection.add(data.tasks)

            App.taskListView = new TaskListView(this.taskCollection)

            #set initial height
            this.setHeight()

            $(window).resize ->
                App.mainView.setHeight()


    return MainView
