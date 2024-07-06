# ALCHEMY AR HUD

This project implements an Augmented Reality Heads-Up Display (HUD) system with multiple interconnected interfaces.

## Setup

1. Clone this repository:
   ```
   git clone https://github.com/A-I-PORTAL/ALCHEMY.git
   ```

2. Navigate to the project directory:
   ```
   cd ALCHEMY
   ```

3. Open the project in Visual Studio Code.

## Development in Visual Studio Code

1. Install the "Live Server" extension for VSCode.

2. Right-click on `index.html` and select "Open with Live Server".

3. The app should now be running in your default browser.

## Testing AR Functionality

To test AR features:

1. Use a mobile device or enable mobile device emulation in your browser's developer tools.

2. Ensure you're using HTTPS or localhost, as most browsers require a secure context for camera access.

3. Click the "Toggle Camera" button to activate the device camera.

## Implementing ASI Functionality

Future ASI (Artificial Superintelligence) functionality can be added in the `js/ai.js` file (to be created). Ensure to update `index.html` to include this new script when implemented.

## File Structure

- `index.html`: Main HTML file
- `css/style.css`: Styles for the app
- `js/main.js`: Main JavaScript file
- `js/hud.js`: HUD-specific functionality
- `js/ar.js`: AR-specific functionality
- `img/`: Directory containing HUD images
