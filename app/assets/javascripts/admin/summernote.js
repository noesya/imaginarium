/*global $ */
$(function () {
    'use strict';

    $('[data-provider="summernote"]').each(function () {
        var config = $(this).attr('data-summernote-config'),
            options = {
                toolbar: [
                    ['font', ['bold', 'italic']],
                    ['insert', ['link', 'unlink']],
                    ['view', ['codeview']]
                ],
                followingToolbar: true,
                disableDragAndDrop: true
            };
        $(this).summernote(options);
    });

    // https://github.com/summernote/summernote/issues/4170
    $("button[data-toggle='dropdown']").each(function (index) {
        $(this).removeAttr("data-toggle").attr("data-bs-toggle", "dropdown");
    });
});
