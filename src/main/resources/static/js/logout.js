function confirmLogout() {
    const ok = confirm("Are you sure you want to logout?");
    if (ok) {
        document.getElementById("logoutForm").submit();
    }
}
