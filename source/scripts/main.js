//Define shortcut aliases

require.config({
    paths: {
        jquery: 'libs/jquery/jquery-1.8.0.min',
        underscore: 'libs/underscore/underscore-min',
        backbone: 'libs/backbone/backbone-min',
        markdown: 'libs/markdown/markdownConverter'
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

require(['cs!app'], function(App, Data) {
    App.initialize();
});
