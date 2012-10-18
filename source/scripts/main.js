//Define shortcut aliases

require.config({
    paths: {
        jquery: 'libs/jquery/jquery-1.8.0.min',
        underscore: 'libs/underscore/underscore-min',
        backbone: 'libs/backbone/backbone-min'
    },

    shim: {
        backbone: {
            deps: ['underscore', 'jquery'],
            exports: 'Backbone'
        },
        underscore: {
            exports: '_'
        },
        jquery: {
            exports: '$'
        }
    }

});

require(['cs!app'], function(App) {
    App.initialize();
});
