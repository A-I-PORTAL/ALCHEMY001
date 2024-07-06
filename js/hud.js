const hudContainer = document.getElementById('hud-container');
let currentHud = 'GATEWAY1';
const huds = {
    GATEWAY1: { img: 'img/GATEWAY1.jpg', buttons: [
        { x: 50, y: 50, target: 'HUD1' }
    ]},
    HUD1: { img: 'img/HUD1.jpg', buttons: [
        { x: 25, y: 25, target: 'LIBRARY1' },
        { x: 75, y: 75, target: 'GATEWAY1' }
    ]},
    LIBRARY1: { img: 'img/LIBRARY1.jpg', buttons: [
        { x: 50, y: 50, target: 'ALCHEMIST1' },
        { x: 25, y: 75, target: 'GATEWAY1' }
    ]},
    ALCHEMIST1: { img: 'img/ALCHEMIST1.jpg', buttons: [
        { x: 50, y: 50, target: 'GATEWAY1' }
    ]}
};

function initHUDs() {
    Object.keys(huds).forEach(hudName => {
        const hudElement = document.createElement('div');
        hudElement.className = 'hud';
        hudElement.id = hudName;
        hudElement.style.backgroundImage = `url(${huds[hudName].img})`;
        hudElement.style.display = hudName === currentHud ? 'block' : 'none';

        huds[hudName].buttons.forEach(button => {
            const buttonElement = document.createElement('div');
            buttonElement.className = 'hud-button';
            buttonElement.style.left = `${button.x}%`;
            buttonElement.style.top = `${button.y}%`;
            buttonElement.addEventListener('click', () => changeHUD(button.target));
            hudElement.appendChild(buttonElement);
        });

        hudContainer.appendChild(hudElement);
    });
}

function changeHUD(newHud) {
    document.getElementById(currentHud).style.display = 'none';
    document.getElementById(newHud).style.display = 'block';
    currentHud = newHud;
}

function miniaturizeHUD(hudName) {
    const hudElement = document.getElementById(hudName);
    hudElement.classList.add('minimized');
}

function maximizeHUD(hudName) {
    const hudElement = document.getElementById(hudName);
    hudElement.classList.remove('minimized');
}

// Double-click to close minimized HUDs
hudContainer.addEventListener('dblclick', (e) => {
    if (e.target.classList.contains('hud') && e.target.classList.contains('minimized')) {
        e.target.style.display = 'none';
    }
});
