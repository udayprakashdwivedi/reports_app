document.addEventListener("DOMContentLoaded", function () {
    const toggle = document.getElementById("toggle-password");
    const passwordField = document.getElementById("password-field");
    const eyeIcon = document.getElementById("eye-icon");

    if (toggle && passwordField && eyeIcon) {
        toggle.addEventListener("click", function () {
            const type = passwordField.getAttribute("type") === "password" ? "text" : "password";
            passwordField.setAttribute("type", type);

            eyeIcon.classList.toggle("bi-eye");
            eyeIcon.classList.toggle("bi-eye-slash");
        });
    }
});
