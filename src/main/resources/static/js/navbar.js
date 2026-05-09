document.addEventListener("DOMContentLoaded", function () {

    // =====================
    // 1️⃣ Add Back Buttons dynamically to all submenus
    // =====================
    document.querySelectorAll(".nav-expand").forEach(function (expandItem) {
        const subMenu = expandItem.querySelector(".nav-expand-content");

        if (subMenu) {
            const backItem = document.createElement("li");
            backItem.className = "nav-item";

            backItem.innerHTML = `
                <a class="nav-link nav-back-link" href="#">
                    <i class="ri-arrow-left-s-line"></i> Back
                </a>
            `;

            subMenu.insertAdjacentElement("afterbegin", backItem);
        }
    });

    // =====================
    // 2️⃣ Expand Menu Click (submenu open)
    // =====================
    document.querySelectorAll(".nav-expand-link").forEach(function(item) {
        item.addEventListener("click", function(e) {
            e.preventDefault();
            const parentLi = this.closest(".nav-expand");
            parentLi.classList.add("active");
        });
    });

    // =====================
    // 3️⃣ Back Button Click (submenu close)
    // =====================
    document.addEventListener("click", function(e) {
        const backLink = e.target.closest(".nav-back-link");
        if (backLink) {
            const parentExpand = backLink.closest(".nav-item.nav-expand");
            parentExpand.classList.remove("active");
        }
    });

    // =====================
    // 4️⃣ Burger Menu Click (main nav open/close)
    // =====================
    document.querySelector(".menu-burger").addEventListener("click", function() {
        document.querySelector(".nav-drill").classList.toggle("active");
    });

    // =====================
    // 5️⃣ Close button click
    // =====================
    document.querySelector(".close").addEventListener("click", function() {
        document.querySelector(".nav-drill").classList.remove("active");

        document.querySelectorAll(".nav-item.nav-expand.active").forEach(function(item) {
            item.classList.remove("active");
        });
    });

    // =====================
    // 6️⃣ Outside click close nav
    // =====================
    document.addEventListener("click", function(e) {
        const nav = document.querySelector(".nav-drill");
        const burger = document.querySelector(".menu-burger");

        if (!nav.contains(e.target) && !burger.contains(e.target)) {
            nav.classList.remove("active");

            document.querySelectorAll(".nav-item.nav-expand.active").forEach(function(item) {
                item.classList.remove("active");
            });
        }
    });

});
