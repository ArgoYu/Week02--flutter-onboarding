#!/usr/bin/env python3
"""Autograder for Week2 Flutter onboarding assignment."""

from __future__ import annotations

import re
import sys
from pathlib import Path
from typing import List


ROOT = Path(__file__).resolve().parents[1]


class Grader:
    def __init__(self) -> None:
        self.failures: List[str] = []
        self.passes: List[str] = []

    def pass_check(self, message: str) -> None:
        self.passes.append(message)

    def fail_check(self, message: str) -> None:
        self.failures.append(message)

    def read_required(self, relative_path: str) -> str:
        path = ROOT / relative_path
        if not path.exists():
            self.fail_check(f"Missing required file: {relative_path}")
            return ""
        return path.read_text(encoding="utf-8")

    @staticmethod
    def strip_comments(text: str) -> str:
        without_block = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
        without_line = re.sub(r"//.*", "", without_block)
        return without_line

    @staticmethod
    def strip_strings(text: str) -> str:
        return re.sub(r"'([^'\\]|\\.)*'|\"([^\"\\]|\\.)*\"", "", text, flags=re.S)

    def check_onboarding_item(self) -> None:
        path = "lib/models/onboarding_item.dart"
        text = self.read_required(path)
        if not text:
            return

        code = self.strip_comments(text)

        if not re.search(r"class\s+OnboardingItem\s*{", code):
            self.fail_check(f"{path}: missing `class OnboardingItem`.")
            return

        for field in ("title", "description", "image"):
            if not re.search(rf"final\s+String\s+{field}\s*;", code):
                self.fail_check(
                    f"{path}: missing field `final String {field};`."
                )

        ctor_match = re.search(
            r"OnboardingItem\s*\(\s*{(?P<body>.*?)\}\s*\)\s*;",
            code,
            flags=re.S,
        )
        if not ctor_match:
            self.fail_check(
                f"{path}: missing constructor with named parameters."
            )
            return

        ctor_body = ctor_match.group("body")
        for required_param in (
            "required this.title",
            "required this.description",
            "required this.image",
        ):
            if required_param not in ctor_body:
                self.fail_check(
                    f"{path}: constructor must include `{required_param}`."
                )

        if not any(item.startswith(f"{path}:") for item in self.failures):
            self.pass_check(f"{path}: model fields and required constructor OK.")

    def check_onboarding_data(self) -> None:
        path = "lib/data/onboarding_data.dart"
        text = self.read_required(path)
        if not text:
            return

        code = self.strip_comments(text)
        if "onboardingItems" not in code:
            self.fail_check(f"{path}: missing `onboardingItems` definition.")
            return

        item_count = len(re.findall(r"\bOnboardingItem\s*\(", code))
        if item_count < 3:
            self.fail_check(
                f"{path}: expected at least 3 OnboardingItem entries, found {item_count}."
            )
            return

        self.pass_check(
            f"{path}: contains at least 3 OnboardingItem entries ({item_count})."
        )

    def check_onboarding_card(self) -> None:
        path = "lib/widgets/onboarding_card.dart"
        text = self.read_required(path)
        if not text:
            return

        if "TODO(student)" in text:
            self.fail_check(f"{path}: contains unresolved TODO(student) placeholder(s).")
            return

        code = self.strip_strings(self.strip_comments(text))
        missing = []
        for token in ("item.image", "item.title", "item.description"):
            if token not in code:
                missing.append(token)

        if missing:
            self.fail_check(
                f"{path}: must render model values. Missing references: {', '.join(missing)}."
            )
            return

        self.pass_check(
            f"{path}: renders item.image, item.title, and item.description."
        )

    def check_onboarding_page(self) -> None:
        path = "lib/pages/onboarding_page.dart"
        text = self.read_required(path)
        if not text:
            return

        code = self.strip_comments(text)

        on_page_changed_ok = re.search(
            r"onPageChanged\s*:\s*\(\s*index\s*\)\s*{.*?setState\s*\(\s*\(\s*\)\s*{.*?currentIndex\s*=\s*index\s*;",
            code,
            flags=re.S,
        )
        if not on_page_changed_ok:
            self.fail_check(
                f"{path}: must update currentIndex in onPageChanged using setState."
            )

        indicator_state_ok = (
            re.search(r"final\s+isActive\s*=\s*index\s*==\s*currentIndex\s*;", code)
            and "isActive ?" in code
        )
        if not indicator_state_ok:
            self.fail_check(
                f"{path}: missing active/inactive indicator logic based on currentIndex."
            )

        nav_ok = re.search(
            r"Navigator\.of\(context\)\.pushReplacement\s*\(",
            code,
        ) and re.search(r"HomePage", code)
        if not nav_ok:
            self.fail_check(
                f"{path}: must navigate to HomePage with Navigator on completion."
            )

        next_logic_ok = re.search(
            r"void\s+_onNextPressed\s*\(\)\s*{.*?if\s*\(.*?\)\s*{.*?_finishOnboarding\s*\(\s*\)\s*;.*?}\s*else\s*{.*?_goToNextPage\s*\(\s*\)\s*;.*?}",
            code,
            flags=re.S,
        )
        if not next_logic_ok:
            self.fail_check(
                f"{path}: `_onNextPressed` must handle next page vs finish navigation."
            )

        if "TODO(student)" in text:
            self.fail_check(f"{path}: contains unresolved TODO(student) placeholder(s).")

        if not any(item.startswith(f"{path}:") for item in self.failures):
            self.pass_check(f"{path}: page change, indicator, and navigation logic OK.")

    def check_home_page(self) -> None:
        home_path = ROOT / "lib/pages/home_page.dart"
        onboarding_path = ROOT / "lib/pages/onboarding_page.dart"

        if home_path.exists():
            text = home_path.read_text(encoding="utf-8")
            if "TODO" in text:
                self.fail_check(
                    "lib/pages/home_page.dart: must not contain TODO placeholders."
                )
                return
            self.pass_check("lib/pages/home_page.dart: no TODO placeholders found.")
            return

        if onboarding_path.exists():
            text = onboarding_path.read_text(encoding="utf-8")
            home_match = re.search(
                r"class\s+HomePage\s+extends\s+StatelessWidget\s*{.*?^\}",
                text,
                flags=re.S | re.M,
            )
            if home_match:
                if "TODO" in home_match.group(0):
                    self.fail_check(
                        "HomePage (in lib/pages/onboarding_page.dart) contains TODO placeholders."
                    )
                else:
                    self.pass_check(
                        "HomePage (in lib/pages/onboarding_page.dart) has no TODO placeholders."
                    )
                return

        self.fail_check(
            "Missing HomePage implementation: expected lib/pages/home_page.dart "
            "or HomePage class in lib/pages/onboarding_page.dart."
        )

    def run(self) -> int:
        self.check_onboarding_item()
        self.check_onboarding_data()
        self.check_onboarding_card()
        self.check_onboarding_page()
        self.check_home_page()

        print("=== Week2 Autograder ===")
        for item in self.passes:
            print(f"[PASS] {item}")
        for item in self.failures:
            print(f"[FAIL] {item}")

        if self.failures:
            print(f"\nResult: FAILED ({len(self.failures)} issue(s))")
            return 1

        print("\nResult: PASSED")
        return 0


def main() -> int:
    return Grader().run()


if __name__ == "__main__":
    sys.exit(main())
