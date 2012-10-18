define [
    'underscore',
    'backbone',
    'cs!models/class'

], (_, Backbone, ClassModel) ->

    ClassCollection = Backbone.Collection.extend
        model: ClassModel

        getShortName: (class_id) -> this.get(class_id)

        getFullName: (class_id) -> this.get(class_id)

    return ClassCollection
