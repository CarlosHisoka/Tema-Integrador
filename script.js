let lastInfoId = null;

function mostrar(infoId) {
    const infoBox = document.getElementById(infoId);
    if (lastInfoId && lastInfoId !== infoId) {
        const lastInfoBox = document.getElementById(lastInfoId);
        lastInfoBox.style.display = "none";
    }
    if (infoBox.style.display === "block") {
        infoBox.style.display = "none";
    } else {
        infoBox.style.display = "block";
    }
    lastInfoId = infoId;
}

function redirectToAboutPage() {
    window.location.href = "Sobre.html";
}
