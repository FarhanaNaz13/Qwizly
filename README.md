# Qwizly- Flutter Quiz App 🎯

**Flutter Version:** 3.27.2 (via FVM)
**Dart Version:** 3.6.1

A **feature-rich, offline quiz application** built in Flutter, demonstrating clean architecture, polished UI, Cubit state management, and support for LaTeX/Math formulas.


## Core Features (MVP)

### 1. Home Screen

* App title + **“Start Quiz”** button
* **Leaderboard** button

### 2. Quiz Flow

* Load questions from **assets/questions.json**
* Render **LaTeX/Math equations** in both questions and answers
* Show **1 question at a time** with 4 multiple-choice answers
* User taps to select an answer (**locked once selected**)
* **“Next” button** to move to the next question
* **Progress indicator** (e.g., Q2/10)

### 3. Results Screen

* Display **final score out of total**
* Option to **enter player name**
* Save score to **local leaderboard**

### 4. Leaderboard Screen

* Show **top scores** (player name + score)
* Sorted by **highest score first**
* **Persistent storage** using Hive

1. **APK Download:**
   [Download APK](https://drive.google.com/file/d/1cQ8ZkUo6Z3nKtwLzUuupaYadR3TOvGnQ/view?usp=sharing)

## Bonus Features

* **Timed questions** (15 seconds per question with countdown)
* **Animations** between question transitions
* **Category selection** before starting quiz
* **Dark mode support**
* Unit tests for **score calculation**
* Simple CI (GitHub Actions) running `flutter analyze` and `flutter test`
* Connect with Friends
    * Share quizzes to friends to earn points
    * Display default/mock friend list with name, avatar, and points
    * Encourages social interaction and engagement

## Requirements Met

* Works entirely **offline**
* Supports **LaTeX rendering** in questions and answers
* Data **persists between app restarts**
* Clean, **responsive UI** with polished cards and transitions
* State management with **Cubit/Bloc**

---

## Setup Steps

1. **Clone the repository:**

```bash
git clone https://github.com/FarhanaNaz13/Qwizly.git
cd Qwizly
```

2. **Install FVM and Flutter version:**

```bash
dart pub global activate fvm
fvm install
```

3. **Get dependencies:**

```bash
fvm flutter pub get
```
4. **Generate files:**

```bash
 fvm flutter pub run build_runner build --delete-conflicting-outputs
```

5. **Run the app:**

```bash
fvm flutter run
```
---

## Architecture Overview

* **State Management:** Cubit (`flutter_bloc`)
* **Dependency Injection:** `injectable` + `get_it`
* **Immutable Models & JSON:** `freezed_annotation` + `json_annotation`
* **Local Storage:** Hive (`hive` + `hive_flutter`)
* **Navigation:** `go_router`
* **UI/UX:** Polished, responsive, reusable widgets, math formula support (`flutter_math_fork`), smooth page indicators, dark/light theme

## Core Dependencies

* `flutter_math_fork` – Math formula rendering
* `flutter_bloc` – Cubit/Bloc state management
* `equatable` – Value equality for models
* `injectable` & `get_it` – Dependency injection & service locator
* `freezed_annotation` & `json_annotation` – Immutable models and JSON serialization
* `hive` & `hive_flutter` – Local storage
* `path_provider` – File system access
* `flutter_svg` – SVG assets
* `smooth_page_indicator` – Page indicators
* `go_router` – Navigation & routing
* `intl` – Date/time formatting
* `font_awesome_flutter` – Icons
* `share_plus` – Content sharing


## What’s Implemented

* Featured quiz card with dynamic quiz count and duration
* Category-based quiz filtering
* Day-specific quiz titles
* Dark/light theme support
* Cubit state management for quiz flow
* Quiz data stored locally with Hive
* Leaderboard and score tracking
* Dependency injection using `injectable` and `get_it`
* Sharing quiz info via `share_plus`
* Clean, reusable widgets

---

## What’s Skipped / Future Work

* Online API integration (currently local JSON data)
* User authentication/login
* Push notifications
* Some advanced UI enhancements
* Full test coverage (some unit tests exist, but not exhaustive)