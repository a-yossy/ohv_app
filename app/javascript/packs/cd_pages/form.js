$(function(){
    var formCount = 0;
    $('.js-add-song-form').on('click',function(){
        formCount += 1;
        $('input:hidden[name="form_count"]').val(formCount);
        const htmlContainer = `<label htmlFor="cd_form_object_songs_name">Name</label>
            <input className="form-control" type="text" name="cd_form_object[songs][name_${formCount}]" id="cd_form_object_songs_name${formCount}">
    <label htmlFor="cd_form_object_songs_track_number">Track number</label>
    <input className="form-control" type="number" name="cd_form_object[songs][track_number_${formCount}]"
       id="cd_form_object_songs_track_number${formCount}">`
        $(".js-song-form").append(htmlContainer);
    });
});
