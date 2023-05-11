var autorefreshes = document.getElementsByClassName('js-autorefresh');
if (autorefreshes.length > 0) {
    setTimeout(function () {
        location.reload()
    }, 2000);
}

