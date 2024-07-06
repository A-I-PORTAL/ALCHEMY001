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
