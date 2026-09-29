# AGENTS.md — BuyPlan Test Automation

Playwright (sync API) + `pytest-bdd`, Page Object Model. **Python only — never use `page.evaluate`/JavaScript.**

## Layout
```
features/        # *.feature (Gherkin) + features/test/test_*.py binds them via scenarios("../X.feature")
steps/           # @given/@when/@then step defs (thin: delegate to page objects)
pages/           # Page objects, inherit utils.common_functions.CommonFunctions
locators/        # per-page dicts (e.g. ProductSummaryLocators); merged into `locator` in locators/locators.py
utils/           # common_functions.py (Playwright helpers), common_steps.py (shared steps e.g. login)
conftest.py      # registers step modules via pytest_plugins; browser launch args (headed, maximized)
```

## Conventions
- **Pages**: subclass `CommonFunctions`, `def __init__(self, page): super().__init__(page)`. Put all locators in `locators/`, actions/asserts in the page object.
- **Steps**: keep thin — instantiate the page and call one method. New step modules must be added to `conftest.py` `pytest_plugins`.
- **Locators**: add to the page's dict in `locators/`; access globally via `from locators.locators import locator` then `locator["Key"]`.
- **Waits**: use `CommonFunctions` helpers (`click_element`, `fill_text`, `wait_for_element_to_disappear`, `is_element_present`, `get_visible_cell_texts`). No hard sleeps unless unavoidable.
- **Never** leave `pdb.set_trace()` or debug prints in committed code.
- New scenario = feature file + matching `features/test/test_*.py` with `scenarios("../<Name>.feature")`.

## Run
```powershell
# from bp_test_automation/
pytest features/test/test_product_summary.py -k "ProductSummary_006" -s
pytest -m Automated          # by tag
```
Login uses `common_steps` "I Login to BuyPlan Application as Planner"; env is BuyPlan nonprod (needs network/creds), runs headed.
