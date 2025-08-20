# Qwizly- Flutter Quiz App 🎯
[![Demo Video](https://img.shields.io/badge/Watch%20Demo-%F0%9F%8E%A5-red)](https://drive.google.com/file/d/1K0a3aoPbwzfi1tlJ7xtvHwwLryGUQ1e-/view?usp=sharing)

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

## 📸 App Screenshots

<p align="center">
  <!-- First 20 screenshots as inline images -->
  <a href="https://drive.google.com/uc?export=view&id=1JVWyHrmPqaNg3c6mWtll8K5SyldArocU"><img src="https://drive.google.com/uc?export=view&id=1JVWyHrmPqaNg3c6mWtll8K5SyldArocU" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1J_F0pMzD79f_SbcgkspR_BeKyygLFA8r"><img src="https://drive.google.com/uc?export=view&id=1J_F0pMzD79f_SbcgkspR_BeKyygLFA8r" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1JaFbGyOnYu-dwBafTh3xDzg0-IRKQ5O0"><img src="https://drive.google.com/uc?export=view&id=1JaFbGyOnYu-dwBafTh3xDzg0-IRKQ5O0" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1Jck9NEr5iFHaG-hQalx2KWYPicCp6q-4"><img src="https://drive.google.com/uc?export=view&id=1Jck9NEr5iFHaG-hQalx2KWYPicCp6q-4" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1Jd4GFjMbX_eu1PUZv71bUuHkeomVsBQd"><img src="https://drive.google.com/uc?export=view&id=1Jd4GFjMbX_eu1PUZv71bUuHkeomVsBQd" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1Jgyn9n2evlxLX6fM-7KKcIVnrjzBR3ZV"><img src="https://drive.google.com/uc?export=view&id=1Jgyn9n2evlxLX6fM-7KKcIVnrjzBR3ZV" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1IyxK8R-d6f4Erm-QHPUc5zV3heurt0Rd"><img src="https://drive.google.com/uc?export=view&id=1IyxK8R-d6f4Erm-QHPUc5zV3heurt0Rd" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1J-EAIzIgonmJiB7IInMa5T4kgBqK3yGU"><img src="https://drive.google.com/uc?export=view&id=1J-EAIzIgonmJiB7IInMa5T4kgBqK3yGU" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1JqWDzNwbpkmZi7uaCl_QCTYjZc5FC9IF"><img src="https://drive.google.com/uc?export=view&id=1JqWDzNwbpkmZi7uaCl_QCTYjZc5FC9IF" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1JuPLlZnxDoEJhxBlYXHVOdOhG4Gpqf9V"><img src="https://drive.google.com/uc?export=view&id=1JuPLlZnxDoEJhxBlYXHVOdOhG4Gpqf9V" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1JLZI0QplmcQrnhmKpPT_2e2EmZstMDa8"><img src="https://drive.google.com/uc?export=view&id=1JLZI0QplmcQrnhmKpPT_2e2EmZstMDa8" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1Jo8yqaiFFsW6F0Hj-Qjl0fj5t2GM2IwK"><img src="https://drive.google.com/uc?export=view&id=1Jo8yqaiFFsW6F0Hj-Qjl0fj5t2GM2IwK" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1JoQQHkOKGu0es0_kWkIWzZFWjHE_tIcr"><img src="https://drive.google.com/uc?export=view&id=1JoQQHkOKGu0es0_kWkIWzZFWjHE_tIcr" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1Ix9BwneN_B-w5H55yNWP6yre5MxAmh0J"><img src="https://drive.google.com/uc?export=view&id=1Ix9BwneN_B-w5H55yNWP6yre5MxAmh0J" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1JKOHuzk4PZu6mn7PIV58MVQp5I8rA8rc"><img src="https://drive.google.com/uc?export=view&id=1JKOHuzk4PZu6mn7PIV58MVQp5I8rA8rc" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1JDANq2BCdzwArUpmkPPiUGAfbtGP8S4_"><img src="https://drive.google.com/uc?export=view&id=1JDANq2BCdzwArUpmkPPiUGAfbtGP8S4_" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1JHeX7T9jpBnbtW6QZ6Xsj5nENSwIn2Fx"><img src="https://drive.google.com/uc?export=view&id=1JHeX7T9jpBnbtW6QZ6Xsj5nENSwIn2Fx" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1J4Q8wMnMCz4IwvlcGDS2l065-ytOKhC3"><img src="https://drive.google.com/uc?export=view&id=1J4Q8wMnMCz4IwvlcGDS2l065-ytOKhC3" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1JB4Xk748hlb9TFu2jZpVjY8J8jVNXd8x"><img src="https://drive.google.com/uc?export=view&id=1JB4Xk748hlb9TFu2jZpVjY8J8jVNXd8x" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1J4dnp3Mz0Yb4rv8G8WN3BOsAlAky9iyW"><img src="https://drive.google.com/uc?export=view&id=1J4dnp3Mz0Yb4rv8G8WN3BOsAlAky9iyW" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1JRCwEAMtZoAlMv0II1FgFJ4FZ_uzlNMU"><img src="https://drive.google.com/uc?export=view&id=1JRCwEAMtZoAlMv0II1FgFJ4FZ_uzlNMU" width="200" /></a>
  <a href="https://drive.google.com/uc?export=view&id=1JUHY3-JXn2TuDnVW7WBECakkpa2p1boN"><img src="https://drive.google.com/uc?export=view&id=1JUHY3-JXn2TuDnVW7WBECakkpa2p1boN" width="200" /></a>
</p>


1. **APK Download:**
   [Download APK](https://drive.google.com/file/d/1zAlw5jp__-kqrJpS8kBv22HfvumN3ZPe/view?usp=sharing)

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
* User authentication / login
* Push notifications
* Some advanced UI enhancements
* Full test coverage (some unit tests exist, but not exhaustive)
* Refactor hardcoded colors into `AppColors` / `ThemeData`
* Replace magic numbers with constants for readability
* Add accessibility features (semantics labels for images/icons)
* Reduce code duplication in layered containers (helper methods)
* Improve responsiveness (avoid fixed heights like 250)
* Finalize button interactions (decorative vs functional)
