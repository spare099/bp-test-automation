---
name: buyplan-automation
description: >-
  Author new BuyPlan UI automation scenarios using Playwright (sync) +
  pytest-bdd Page Object Model. Use when adding a *.feature scenario, step
  definitions, a page object, or locators to the bp_test_automation project.
  Python only — never use page.evaluate/JavaScript.
---

# BuyPlan Automation Authoring

Framework: **Playwright sync API + `pytest-bdd`, Page Object Model. Python only, no JavaScript (`page.evaluate`).**

## Where things go
| Layer | Path | Rule |
|-------|------|------|
| Feature (Gherkin) | `features/<Name>.feature` | tag scenarios (`@Automated`, env tags) |
| Scenario binding | `features/test/test_<name>.py` | `from pytest_bdd import scenarios` → `scenarios("../<Name>.feature")` |
| Steps | `steps/<name>_steps.py` | thin `@given/@when/@then`; register module in `conftest.py` `pytest_plugins` |
| Page object | `pages/<name>_page.py` | subclass `CommonFunctions`; holds actions + asserts |
| Locators | `locators/<name>locator.py` | dict; merged into `locator` in `locators/locators.py` |
| Shared helpers | `utils/common_functions.py` | Playwright wrappers reused by all pages |

## Recipe for a new scenario
1. **Locators** — add a dict entry in `locators/<page>locator.py`; ensure it's spread into `locator` in `locators/locators.py`.
2. **Page object** — subclass `CommonFunctions`:
   ```python
   from playwright.sync_api import Page
   from utils.common_functions import CommonFunctions

   class ExamplePage(CommonFunctions):
       def __init__(self, page: Page):
           super().__init__(page)

       def do_action(self, value: str):
           self.fill_text(self.SEARCH, value)
           self.click_element(self.SEARCH_BTN)
           self.wait_for_element_to_disappear(self.LOADING)
   ```
3. **Steps** — keep thin, delegate to the page:
   ```python
   from pytest_bdd import given, when, then, parsers
   from pages.example_page import ExamplePage

   @when(parsers.parse('I search for "{value}"'))
   def search(page, value):
       ExamplePage(page).do_action(value)
   ```
   Add `"steps.example_steps"` to `pytest_plugins` in `conftest.py`.
4. **Feature + binding** — write `features/Example.feature`, then `features/test/test_example.py` with `scenarios("../Example.feature")`.

## Conventions / guardrails
- Use `CommonFunctions` helpers: `click_element`, `fill_text`, `is_element_present`, `wait_for_element_to_disappear`, `get_visible_cell_texts`.
- Reuse the shared login step `"I Login to BuyPlan Application as Planner"` from `utils/common_steps.py`.
- Prefer explicit `wait_for(...)` over `wait_for_timeout` sleeps.
- **Never** commit `pdb.set_trace()`, debug `print`, or JavaScript evaluation.
- Store scenario state in a `pytest.fixture` dict (see `product_summary_context`).

## Run
```powershell
pytest features/test/test_<name>.py -k "<TagOrName>" -s
pytest -m Automated
```
Runs headed (see `conftest.py`); targets BuyPlan nonprod (needs network + creds).
