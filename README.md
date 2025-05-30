# Background Keeper

## What does this Package do?
This Package allows you to keep your App running in the background by playing a silent mp3 in the background and hiding it from Control Centre and Now Playing

## Required Info.plist Values
The following Info.plist Values are required to make this Package work:

Array: UIBackgroundModes:

  - Item 0: String = audio
<img width="697" alt="Screenshot 2025-05-30 at 12 02 57" src="https://github.com/user-attachments/assets/819266b0-86af-465d-a936-484a4a19012a" />

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

### Full Example
```swift
// Test Background Keeper

import SwiftUI
import BackgroundKeeper

struct ContentView: View {
    @State private var timer: Timer?

    var body: some View {
        Form {
            Section("Background Keeper") {
                Button("Start Background Keeper") {
                    BackgroundKeeper.shared.start()
                }
                Button("Stop Background Keeper") {
                    BackgroundKeeper.shared.stop()
                }
            }
            Section("Notification Timer") {
                if timer != nil {
                    Button("Stop Notification Timer") {
                        stopTimer()
                    }
                } else {
                    Button("Send Notification Timer") {
                        startTimer()
                    }
                }
                Text("Notifications only appear when the app is not visible on Screen so this is the Perfect way to test Background Activity! Notifications can only be sent if the app is either active or in the background but still active.")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
        .onAppear {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("All set!")
                } else if let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    func startTimer() {
            stopTimer() // Stop any existing timer
            timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
                print("Triggered")
                let content = UNMutableNotificationContent()
                content.title = "This is a Notification"
                content.subtitle = "If you can see this it means it works!"
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
        }
        
        func stopTimer() {
            timer?.invalidate()
            timer = nil
        }
}
```
