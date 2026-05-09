document.addEventListener("DOMContentLoaded", function () {

    const toggleForms = document.querySelectorAll(".toggle-form");

    toggleForms.forEach(form => {
        form.addEventListener("submit", function (e) {

            const isActive = form.dataset.active === "true";

            const message = isActive
                ? "Are you sure you want to deactivate this trainer?"
                : "Are you sure you want to activate this trainer?";

            if (!confirm(message)) {
                e.preventDefault();
            }
        });
    });

});
