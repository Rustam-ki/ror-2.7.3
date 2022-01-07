document.addEventListener("turbolinks:load", function () {
    var control = document.getElementById("user_password_confirmation");

    if (control) {
        control.addEventListener("keyup", confirmPassword);
    }
});

function confirmPassword() {
    var password = document.getElementById("user_password");
    var control = document.getElementById("user_password_confirmation");

    if (!this.value.length) {
        document.querySelector(".octicon-thumbsup").classList.add("hide");
        document.querySelector(".octicon-thumbsdown").classList.add("hide");
        return;
    } else if (this.value == password.value) {
        document.querySelector(".octicon-thumbsup").classList.remove("hide");
        document.querySelector(".octicon-thumbsdown").classList.add("hide");
        control.classList.add("border-green");
        control.classList.remove("border-red");
    } else {
        document.querySelector(".octicon-thumbsup").classList.add("hide");
        document.querySelector(".octicon-thumbsdown").classList.remove("hide");
        control.classList.add("border-red");
        control.classList.remove("border-green");
    }
}
