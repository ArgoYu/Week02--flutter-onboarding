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

Complete the TODOs in these files only:

1. `lib/models/onboarding_item.dart`
2. `lib/data/onboarding_data.dart`
3. `lib/widgets/onboarding_card.dart`
4. `lib/pages/onboarding_page.dart`

### Image Field Rule (Week 2)

For Week 2, treat `image` as an emoji string (not an asset path).
Examples: `"🩺"`, `"🎯"`, `"🤖"`.
Render it with `Text(item.image)`.

### Expected Functional Result

- Onboarding item model includes required fields: `title`, `description`, `image`.
- `onboardingItems` contains at least 3 pages of data.
- `OnboardingCard` renders real data from the model, not placeholder text.
- Indicator style clearly distinguishes active and inactive states.
- Next button behavior:
  - If not last page: move to next page.
  - If last page: navigate to `HomePage`.
- `HomePage` is already scaffolded; students focus on onboarding flow logic.
- No unresolved `TODO(student)` placeholders remain in required files.

## Common Mistakes (Read This If You Get Stuck)

- Leaving `TODO(student)` in required files causes autograder failure.
- Missing named `required` parameters in `OnboardingItem` constructor causes autograder failure.
- Adding fewer than 3 `OnboardingItem(...)` entries causes autograder failure.
- Using a branch name that does not start with `week2-` can prevent push-triggered CI from running.

## Recommended Validation

```bash
flutter analyze
```

## Week2 Autograding (Local + GitHub Actions)

This repository includes an autograding workflow and script for Week2.

- Workflow file: `.github/workflows/week2.yml`
- Grader script: `scripts/grade_week2.py`

### GitHub Actions Trigger Rules

- Push to branches matching `week2-*`
- Pull Request targeting `main`
- If your branch name does not start with `week2-`, push-based autograding will not run.

### What the Autograder Checks

1. `lib/models/onboarding_item.dart`
   - `OnboardingItem` class exists
   - `final String title`, `description`, `image`
   - constructor uses named `required` parameters for all fields
2. `lib/data/onboarding_data.dart`
   - `onboardingItems` contains at least 3 `OnboardingItem(...)` entries
3. `lib/widgets/onboarding_card.dart`
   - renders `item.image`, `item.title`, `item.description`
   - no unresolved `TODO(student)` placeholders
4. `lib/pages/onboarding_page.dart`
   - updates `currentIndex` in `onPageChanged` via `setState`
   - indicator uses active/inactive logic based on `currentIndex`
   - next button handles both next-page and finish flow
   - navigates to `HomePage` with `Navigator`
   - no unresolved `TODO(student)` placeholders
5. Home page check
   - if `lib/pages/home_page.dart` exists, it must not contain TODO placeholders
   - otherwise, `HomePage` inside `onboarding_page.dart` must not contain TODO placeholders

### CI Steps

```bash
flutter pub get
flutter analyze
python3 scripts/grade_week2.py
```

`flutter test` is optional for Week2 and currently disabled in CI.

### Run Autograder Locally

```bash
python3 scripts/grade_week2.py
```

Example passing output:

```text
=== Week2 Autograder ===
[PASS] lib/models/onboarding_item.dart: model fields and required constructor OK.
[PASS] lib/data/onboarding_data.dart: contains at least 3 OnboardingItem entries (3).
[PASS] lib/widgets/onboarding_card.dart: renders item.image, item.title, and item.description.
[PASS] lib/pages/onboarding_page.dart: page change, indicator, and navigation logic OK.
[PASS] HomePage (in lib/pages/onboarding_page.dart) has no TODO placeholders.

Result: PASSED
```

- If any required check fails, script exits with code `1` (CI fails).
- If all checks pass, script exits with code `0` (CI passes).

## Git Workflow Requirements

1. Create a feature branch (do not work directly on `main`):

```bash
git checkout -b week2-yourname
```

Branch naming is strict for push CI: it must start with `week2-`.

2. Commit your work:

```bash
git add .
git commit -m "Week2: complete onboarding assignment"
```

3. Push branch:

```bash
git push -u origin week2-yourname
```

4. Open a Pull Request targeting `main` with title format:

```text
Week2 - Your Name
```

Optional GitHub CLI command:

```bash
gh pr create --base main --head week2-yourname --title "Week2 - Your Name"
```

## Evaluation Focus

- App runs successfully.
- Required onboarding functionality is complete.
- Widget structure and layout readability.
- Code clarity and maintainability.
