# Background Keeper

## What does this Package do?
This Package allows you to keep your App running in the background by playing a silent mp3 in the background and hiding it from Control Centre and Now Playing

## Usage
Usage is pretty simple:
### Starting Background Keeper
```swift
BackgroundKeeper.shared.start()
```
### Stopping Background Keeper
```swift
BackgroundKeeper.shared.stop()
```

## Required Info.plist Values
The following Info.plist Values are required to make this Package work:

Array: UIBackgroundModes:

  - Item 0: String = audio
<img width="697" alt="Screenshot 2025-05-30 at 12 02 57" src="https://github.com/user-attachments/assets/819266b0-86af-465d-a936-484a4a19012a" />
