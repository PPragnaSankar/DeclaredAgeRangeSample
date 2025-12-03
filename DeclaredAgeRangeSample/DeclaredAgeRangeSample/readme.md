# Child-P

A SwiftUI app designed for parent devices to enable advanced features based on the user's age range, using the `DeclaredAgeRange` framework.

## Features

- Displays a message indicating the app is running on a parent device.
- Requests the user's age range using the `DeclaredAgeRange` API.
- Enables advanced features for users aged 18 and above.
- Handles declined sharing and unknown age range responses gracefully.

## Requirements

- Xcode 26 or later
- iOS 26.0 or later
- Swift 5.5 or later

## Setup

1. Clone the repository.
2. Open `Child-P.xcodeproj` in Xcode.
3. Ensure the `DeclaredAgeRange` framework is included in your project.
4. Build and run on a device with iOS 26 or later.

## Usage

- On launch, the app requests the user's age range.
- If the user is 18 or older, the "Advanced Features" button is enabled.
- If the user is younger or declines sharing, advanced features remain disabled.
