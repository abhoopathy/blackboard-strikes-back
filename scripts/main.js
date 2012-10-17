// http://dl.dropbox.com/u/5354845/wboard/index.html

$(document).ready(function() {

    var $classes = $('.class-list-container');
    var $tasks = $('.task-list-container');
    var $sidecol = $('.side-col');

    $tasks.height($sidecol.height() - $classes.height());

    $('.class-list-item').click(function () {

        var $ul = $(this).find('.class-sublist');
        var class_id = $(this).attr('data-classid');
        console.log(class_id);
        

        $ul.toggle();
        var new_height = $sidecol.height() - $classes.height();
        $ul.toggle();

        $ul.animate( {height: 'toggle'}, {duration: 150, queue: false} );
        $tasks.animate( {height: new_height}, {duration: 150, queue: false} );

        if ($(this).hasClass('.expanded')) {
            $(this).removeClass('.expanded');
            $('.task-list-item').fadeIn();
        } else {
            $(this).addClass('.expanded');
            $('.task-list-item > .task-list-item-tag:not(.color'+class_id+')').each(function () {
                $(this).closest('.task-list-item').fadeOut();
            });
        }

    });


});
