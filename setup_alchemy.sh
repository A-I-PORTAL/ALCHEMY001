#!/bin/bash

# Set up project directory
PROJECT_DIR="$HOME/Desktop/ALCHEMY"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR" || exit

# Create directory structure
mkdir -p css js img

# Create files
touch .gitignore README.md index.html css/style.css js/main.js js/hud.js js/ar.js

# Add content to .gitignore
cat > .gitignore << EOL
.DS_Store
node_modules/
*.log
EOL

# Add content to README.md
cat > README.md << EOL
# ALCHEMY AR HUD

This project implements an Augmented Reality Heads-Up Display (HUD) system with multiple interconnected interfaces.

## Setup

1. Clone this repository:
   \`\`\`
   git clone https://github.com/A-I-PORTAL/ALCHEMY.git
   \`\`\`

2. Navigate to the project directory:
   \`\`\`
   cd ALCHEMY
   \`\`\`

3. Open the project in Visual Studio Code.

## Development in Visual Studio Code

1. Install the "Live Server" extension for VSCode.

2. Right-click on \`index.html\` and select "Open with Live Server".

3. The app should now be running in your default browser.

## Testing AR Functionality

To test AR features:

1. Use a mobile device or enable mobile device emulation in your browser's developer tools.

2. Ensure you're using HTTPS or localhost, as most browsers require a secure context for camera access.

3. Click the "Toggle Camera" button to activate the device camera.

## Implementing ASI Functionality

Future ASI (Artificial Superintelligence) functionality can be added in the \`js/ai.js\` file (to be created). Ensure to update \`index.html\` to include this new script when implemented.

## File Structure

- \`index.html\`: Main HTML file
- \`css/style.css\`: Styles for the app
- \`js/main.js\`: Main JavaScript file
- \`js/hud.js\`: HUD-specific functionality
- \`js/ar.js\`: AR-specific functionality
- \`img/\`: Directory containing HUD images
EOL

# Add content to index.html
cat > index.html << EOL
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ALCHEMY AR HUD</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div id="ar-overlay"></div>
    <div id="hud-container"></div>
    <div id="controls">
        <input type="range" id="opacity-slider" min="0" max="1" step="0.1" value="0.7">
        <input type="range" id="hue-slider" min="0" max="360" step="1" value="0">
    </div>
    <button id="camera-toggle">Toggle Camera</button>
    <script src="js/hud.js"></script>
    <script src="js/ar.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
EOL

# Add content to css/style.css
cat > css/style.css << EOL
body {
    margin: 0;
    padding: 0;
    overflow: hidden;
}

#ar-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
}

#hud-container {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none;
}

.hud {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    transition: all 0.3s ease;
}

.hud.minimized {
    width: 10%;
    height: 10%;
    top: 10px;
    left: 10px;
}

.hud-button {
    position: absolute;
    width: 30px;
    height: 30px;
    background-color: rgba(255, 255, 255, 0.5);
    border-radius: 50%;
    cursor: pointer;
    pointer-events: auto;
}

#controls {
    position: fixed;
    bottom: 20px;
    left: 20px;
    z-index: 1000;
}

#camera-toggle {
    position: fixed;
    top: 20px;
    right: 20px;
    z-index: 1000;
}
EOL

# Add content to js/main.js
cat > js/main.js << EOL
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
        hud.style.filter = \`hue-rotate(\${e.target.value}deg)\`;
    });
});

cameraToggle.addEventListener('click', toggleCamera);

// Initialize the HUD system
initHUDs();
EOL

# Add content to js/hud.js
cat > js/hud.js << EOL
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
        hudElement.style.backgroundImage = \`url(\${huds[hudName].img})\`;
        hudElement.style.display = hudName === currentHud ? 'block' : 'none';

        huds[hudName].buttons.forEach(button => {
            const buttonElement = document.createElement('div');
            buttonElement.className = 'hud-button';
            buttonElement.style.left = \`\${button.x}%\`;
            buttonElement.style.top = \`\${button.y}%\`;
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
EOL

# Add content to js/ar.js
cat > js/ar.js << EOL
const arOverlay = document.getElementById('ar-overlay');
let stream = null;

function toggleCamera() {
    if (stream) {
        const tracks = stream.getTracks();
        tracks.forEach(track => track.stop());
        arOverlay.innerHTML = '';
        stream = null;
    } else {
        if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
            navigator.mediaDevices.getUserMedia({ video: { facingMode: 'environment' } })
                .then(newStream => {
                    stream = newStream;
                    const videoElement = document.createElement('video');
                    videoElement.srcObject = stream;
                    videoElement.play();
                    arOverlay.innerHTML = '';
                    arOverlay.appendChild(videoElement);
                })
                .catch(error => console.error('Error accessing camera:', error));
        } else {
            console.error('Camera API not supported');
        }
    }
}
EOL

# Create placeholder HUD images
touch img/GATEWAY1.jpg img/HUD1.jpg img/LIBRARY1.jpg img/ALCHEMIST1.jpg

echo "Project structure created at $PROJECT_DIR"
echo "Remember to add your HUD images to the 'img' folder"
echo "To run the project, open index.html in a web browser or use Live Server in VSCode"

# Initialize git repository
git init
git add .
git commit -m "Initial commit"

# Add GitHub remote (you'll need to create the repository on GitHub first)
git remote add origin https://github.com/A-I-PORTAL/ALCHEMY.git
git branch -M main
git push -u origin main

echo "Project initialized and pushed to GitHub"