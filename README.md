# Week 02 Flutter Onboarding Homework

This repository is the Week 02 Flutter training assignment.
The current project is a Flutter onboarding flow with several TODO markers for students to complete.

## Learning Goals

By finishing this assignment, students should be able to:

1. Understand Flutter project structure and code organization.
2. Build UI with `Scaffold`, `Column`, `Row`, `Container`, and `PageView`.
3. Define and use a Dart data model.
4. Connect UI to data-driven rendering.
5. Handle simple page state and navigation.
6. Use a standard Git branch -> commit -> PR workflow.

## Actual Repository Structure

```text
week02_flutter_onboarding
├── README.md
├── pubspec.yaml
├── lib
│   ├── main.dart
│   ├── models
│   │   └── onboarding_item.dart
│   ├── data
│   │   └── onboarding_data.dart
│   ├── widgets
│   │   └── onboarding_card.dart
│   └── pages
│       └── onboarding_page.dart
└── test
    └── widget_test.dart
```

## Prerequisites

- Git
- Flutter SDK (compatible with the project)

Check environment:

```bash
git --version
flutter --version
flutter doctor
```

## Run the Project

From repository root:

```bash
flutter pub get
flutter run
```

## Assignment Scope (What to Implement)

Complete the TODOs in these files:

1. `lib/models/onboarding_item.dart`
2. `lib/data/onboarding_data.dart`
3. `lib/widgets/onboarding_card.dart`
4. `lib/pages/onboarding_page.dart`

### Expected Functional Result

- Onboarding item model includes required fields (title, description, image).
- `onboardingItems` contains at least 3 pages of data.
- `OnboardingCard` renders data from the model, not placeholder text.
- Indicator style clearly distinguishes active and inactive states.
- Next button behavior:
  - If not last page: move to next page.
  - If last page: navigate to `HomePage`.
- `HomePage` is already scaffolded; students focus on onboarding flow logic.

## Recommended Validation

```bash
flutter analyze
```

## Git Workflow Requirements

1. Create a feature branch (do not work directly on `main`):

```bash
git checkout -b week2-yourname
```

2. Commit your work:

```bash
git add .
git commit -m "Week2: complete onboarding assignment"
```

3. Push branch:

```bash
git push -u origin week2-yourname
```

4. Open a Pull Request with title format:

```text
Week2 - Your Name
```

## Evaluation Focus

- App runs successfully.
- Required onboarding functionality is complete.
- Widget structure and layout readability.
- Code clarity and maintainability.
