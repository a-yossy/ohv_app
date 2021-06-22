jQuery(document).bind('ready ajaxComplete', function() {
    $('.select-drop').change(function() {
        $(this).parent().submit();
    });
});
