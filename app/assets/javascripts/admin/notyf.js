/*global Notyf */
window.addEventListener('DOMContentLoaded', function () {
    'use strict';
    var notyfAlerts = document.getElementsByClassName('js-notyf-alert'),
        notyfNotices = document.getElementsByClassName('js-notyf-notice'),
        notyf = new Notyf();

    if (notyfAlerts.length > 0) {
        notyf.open({
            type: 'error',
            position: {
                x: 'center',
                y: 'bottom'
            },
            message: notyfAlerts[0].innerText,
            duration: 9000,
            ripple: true,
            dismissible: true
        });
    }
    if (notyfNotices.length > 0) {
        notyf.open({
            type: 'success',
            position: {
                x: 'center',
                y: 'bottom'
            },
            message: notyfNotices[0].innerText,
            duration: 9000,
            ripple: true,
            dismissible: true
        });
    }
});
