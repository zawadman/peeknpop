# Peek N Pop

Peek N Pop is a simple Flutter + Flame guessing game where a hidden object sits behind a wall of balloons. The player pops balloons one by one to reveal small glimpses of the object, then tries to guess what the item is before the full image is exposed.

## Gameplay

The current prototype sets up:

- A themed background scene
- A hidden object placed near the center of the screen
- Multiple balloon layers arranged in a bloom shape
- Tap-to-pop balloon interaction
- Balloon sway animation for a more playful feel

In the current build, the player reveals the object by popping balloons and guesses visually. A text-input or score-based guessing system has not been added yet.

## Built With

- [Flutter](https://flutter.dev/) for the app shell
- [Flame](https://flame-engine.org/) for the 2D game loop and components
- Dart 3

## Project Structure

```text
lib/
  main.dart
  game/
    components/
      background_component.dart
      balloon_unit_component.dart
      balloon_visual_component.dart
      hidden_object_component.dart
      pivot_component.dart
      string_visual_component.dart
    systems/
      balloon_spawn_system.dart
      peeknpop_game.dart
```

## How It Works

- `PeeknPopGame` loads the scene, background, hidden object, and balloon cluster.
- `HiddenObjectComponent` renders the object the player is trying to identify.
- `PivotComponent` acts as the anchor point for the balloon arrangement.
- `BalloonSpawnSystem` creates layered balloon sections with different string lengths and spread angles.
- `BalloonUnitComponent` handles sway motion and removal when popped.
- `BalloonVisualComponent` listens for taps and triggers the pop behavior.

## Assets

This project currently includes:

- Balloon sprites
- A birthday-themed background
- A sample hidden object image: `cake.png`

You can swap the hidden object by changing the sprite path used in `lib/game/systems/peeknpop_game.dart`.

## Getting Started

### Prerequisites

- Flutter SDK installed
- A device emulator, simulator, or desktop/web target enabled

Check your setup with:

```bash
flutter doctor
```

### Install Dependencies

```bash
flutter pub get
```

### Run the Game

```bash
flutter run
```

## Supported Platforms

This repository includes platform folders for:

- Android
- iOS
- Web
- macOS
- Windows
- Linux

## Current State

Peek N Pop is an early prototype focused on the core visual interaction: hiding an object behind animated balloons and letting the player reveal it by popping them.

Possible next steps:

- Add a name-entry guessing UI
- Track score based on how early the guess is made
- Randomize hidden objects from a larger asset set
- Add win/lose states
- Add sound effects and pop particles

## Development Notes

- Main entry point: `lib/main.dart`
- Core game scene: `lib/game/systems/peeknpop_game.dart`
- Balloon layout logic: `lib/game/systems/balloon_spawn_system.dart`

## License

No license is currently specified in this repository.
