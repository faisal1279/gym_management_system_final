window.addEventListener("load", () => {
    document.querySelector(".animated-model").classList.add("show");
});


    window.addEventListener("load", function(){
    document.querySelector(".hero-content").classList.add("show");
    document.querySelector(".model").classList.add("show");
});

    // About hero section
    const img = document.querySelector(".hero-img");

    window.addEventListener("scroll", () => {
    const rect = img.getBoundingClientRect();

    if(rect.top < window.innerHeight - 100){
    img.classList.add("show");
}
});
