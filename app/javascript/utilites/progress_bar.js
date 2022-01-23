document.addEventListener("turbolinks:load", function () {
    var control = document.getElementById("progress-bar");

    if (control) {
        control.textContent = "Пройдено " + control.dataset.progress + "%";
        control.style.width = control.dataset.progress + "%";
    }
});