const opacitySlider = document.getElementById('opacity-slider');
const hueSlider = document.getElementById('hue-slider');
const cameraToggle = document.getElementById('camera-toggle');

opacitySlider.addEventListener('input', (e) => {
    document.querySelectorAll('.hud').forEach(hud => {
        hud.style.opacity = e.target.value;
    });
});

hueSlider.addEventListener('input', (e) => {
    document.querySelectorAll('.hud').forEach(hud => {
        hud.style.filter = `hue-rotate(${e.target.value}deg)`;
    });
});

cameraToggle.addEventListener('click', toggleCamera);

// Initialize the HUD system
initHUDs();
