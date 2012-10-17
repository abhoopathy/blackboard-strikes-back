$(document).ready(function() {
    $('.class-list-item').click(function () {
        $ul = $(this).find('.class-sublist');
        $ul.slideToggle(150);
        console.log( $('.class-list-container').height() );

//        $('.task-list-item > .task-list-item-tag:not(.color1)').each(function () {
//            $(this).closest('.task-list-item').fadeOut();
//        });
    });


});
