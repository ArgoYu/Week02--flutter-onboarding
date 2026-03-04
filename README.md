
# Flutter Week 2 Onboarding Repository

This repository is used for **Week 2 Flutter training**.  
Students will practice Flutter fundamentals and the professional Git workflow used in real development teams.

The focus of this training is to understand:

- Flutter project structure
- Dart basics
- Flutter widgets
- Layout using Column and Row
- Git workflow (clone → branch → commit → push → pull request)

---

# Learning Goals

By the end of this exercise, students should be able to:

1. Clone a GitHub repository
2. Run a Flutter application locally
3. Understand where Flutter code lives inside a project
4. Modify UI widgets
5. Use Git branches to submit changes
6. Open a Pull Request for review

---

# Repository Structure

```

flutter-onboarding-week2
│
├── README.md
│
├── docs
│   ├── week2_assignment.md
│   └── rubric.md
│
└── starter_app
├── lib
│   ├── main.dart
│   └── home_screen.dart
│
├── pubspec.yaml
└── other flutter files

```

Explanation:

### `starter_app/`
This folder contains the Flutter project students will run and modify.

### `docs/week2_assignment.md`
Detailed assignment instructions.

### `docs/rubric.md`
How the assignment will be evaluated.

---

# Prerequisites

Before starting, make sure the following are installed:

### Git
Check with:

```

git --version

```

### Flutter SDK
Check with:

```

flutter --version

```

### Verify Flutter environment

Run:

```

flutter doctor

```

Flutter Doctor will show if anything is missing.

Students must fix all critical issues before continuing.

---

# Step 1 — Clone the Repository

Clone the repository from GitHub.

```

git clone [https://github.com/YOUR_GITHUB_USERNAME/flutter-onboarding-week2.git](https://github.com/YOUR_GITHUB_USERNAME/flutter-onboarding-week2.git)

```

Move into the repository:

```

cd flutter-onboarding-week2

```

---

# Step 2 — Run the Flutter Project

Navigate to the Flutter project folder.

```

cd starter_app

```

Install dependencies.

```

flutter pub get

```

Run the application.

```

flutter run

```

If everything is configured correctly, a simple Flutter application will launch.

---

# Step 3 — Understand the Flutter Project

Most Flutter code lives inside the **lib/** folder.

```

starter_app/lib

```

Important files:

### `main.dart`

This is the **entry point** of the Flutter application.

The application starts here and calls:

```

runApp()

```

### `home_screen.dart`

This file contains the UI that students will modify for the assignment.

---

# Step 4 — The Assignment

Students will modify the UI in:

```

starter_app/lib/home_screen.dart

```

The final UI must include:

- A large title text
- A subtitle text
- A Row containing:
  - an icon
  - a label
- A button
- A Column layout
- Spacing using SizedBox
- A styled Container

The button must print the following message to the console when pressed:

```

Week 2 assignment completed

```

Full instructions can be found in:

```

docs/week2_assignment.md

```

---

# Step 5 — Create a Branch

Students must NOT work directly on the `main` branch.

Create a new branch using the following format:

```

week2-yourname

```

Example:

```

git checkout -b week2-yanbing

```

---

# Step 6 — Commit Changes

After completing the assignment, stage the changes.

```

git add .

```

Commit the changes.

```

git commit -m "Week2: complete Flutter UI assignment"

```

---

# Step 7 — Push to GitHub

Push the branch to GitHub.

```

git push -u origin week2-yourname

```

---

# Step 8 — Open a Pull Request

Go to the GitHub repository page.

GitHub will suggest creating a Pull Request.

Create a Pull Request with the title:

```

Week2 - Your Name

```

Fill out the checklist in the PR template.

---

# Code Review

After submitting the Pull Request, the instructor will review the code.

The review may include comments on:

- Widget structure
- Layout quality
- Code readability
- Flutter best practices

Students may be asked to update their code before the Pull Request is approved.

---

# Common Flutter Commands

Install dependencies:

```

flutter pub get

```

Run the application:

```

flutter run

```

Format code:

```

flutter format .

```

Clean project:

```

flutter clean

```

---

# Important Flutter Concept

Flutter uses a **widget-based architecture**.

Everything you see on the screen is a widget:

- Text
- Buttons
- Layout containers
- Images
- Icons

Widgets are nested together to build the user interface.

Example structure:

```

Column
├── Text
├── Text
├── Row
│    ├── Icon
│    └── Text
└── Button

```

Learning how widgets combine to form a UI is one of the most important skills in Flutter development.

---

# Evaluation Criteria

Assignments will be evaluated based on:

| Category | Points |
|--------|--------|
| Application runs successfully | 2 |
| Required widgets implemented | 4 |
| Layout and spacing quality | 2 |
| Code clarity and structure | 2 |

Total: **10 points**

---

# Professional Workflow Reminder

This exercise simulates a real software development workflow:

1. Clone repository
2. Create branch
3. Implement feature
4. Commit changes
5. Push branch
6. Submit Pull Request
7. Code review

This workflow is used by most professional engineering teams.

---

# Instructor

Argo Yu  
Computer Engineering  
Flutter Development Training
```

