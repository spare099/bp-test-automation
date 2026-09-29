"""Product Summary page object for BuyPlan application (pure Python, no JS)."""

from playwright.sync_api import Page

from utils.common_functions import CommonFunctions


class ProductSummaryPage(CommonFunctions):
    """Page object for the Product Summary page."""

    TABLE_ID = "StyleSummaryTable"
    LOADING_ICON = "//p[@class='ng-binding' and text()='Loading...']"
    SEARCH_BUTTON = "//button[@id='searchBtn']"

    # field_key -> search input id + 1-based result-table column index.
    FIELD_CONFIG = {
        "ProductNumber": {"input_id": "inputProductNbr", "column_index": 3},
        "ProductSpecCode": {"input_id": "inputProductSpecCode", "column_index": 4},
        "Family": {"input_id": "inputFamily", "column_index": 5},
        "Class": {"input_id": "inputClass", "column_index": 6},
        "Seasonality": {"input_id": "inputSeasonality", "column_index": 7},
        "KmartStyleID": {"input_id": "inputKmartStyleId", "column_index": 8},
        "ProductDescription": {"input_id": "inputProductDescription", "column_index": 9},
        "PrimaryColour": {"input_id": "inputPrimaryColour", "column_index": 10},
        "SecondaryColour": {"input_id": "inputSecondaryColour", "column_index": 11},
        "Vendor": {"input_id": "inputVendor", "column_index": 12},
    }

    def __init__(self, page: Page):
        super().__init__(page)

    # --- locator builders ---
    def _column_cells_locator(self, column_index: int) -> str:
        """XPath for label cells of a column across ALL result rows.

        ProductNumber nests the label under span/; other columns put label
        directly under td. Using //label covers both structures.
        """
        return (
            f"//table[@id='{self.TABLE_ID}']//tbody/tr"
            f"/td[{column_index}]//label"
        )

    def _search_input_locator(self, input_id: str) -> str:
        """XPath for a search filter input by its id."""
        return f"//input[@id='{input_id}']"

    def _result_table_locator(self) -> str:
        return f"//table[@id='{self.TABLE_ID}']"

    def _result_rows_locator(self) -> str:
        return f"//table[@id='{self.TABLE_ID}']//tbody/tr"

    def _config_for(self, field_key: str) -> dict:
        assert field_key in self.FIELD_CONFIG, (
            f"Unknown Product Summary field: {field_key}"
        )
        return self.FIELD_CONFIG[field_key]

    # --- navigation / setup ---
    def open_summary_for_department(self, dep_no: str = "004"):
        """Open Product Summary URL for a specific department."""
        url = (
            "https://buyplan-nonprod.int.ap-southeast-2.nonprod."
            f"a-sharedinfra.net/BuyPlan/Summary?depNo={dep_no}"
        )
        self.page.goto(url)
        self.page.wait_for_load_state("domcontentloaded")
        self.wait_for_element_to_disappear(self.LOADING_ICON, timeout=60000)
        self.page.locator(self._result_table_locator()).first.wait_for(
            state="visible", timeout=60000
        )

    def ensure_rows_available(self):
        """Wait for the first result row and assert visible rows exist."""
        self.page.locator(self._result_rows_locator()).first.wait_for(
            state="visible", timeout=60000
        )
        assert self._visible_row_count() > 0, (
            "ProductSummary has no visible result rows"
        )

    # --- reads ---
    def _visible_row_count(self) -> int:
        """Count visible result rows under the table tbody."""
        rows = self.page.locator(self._result_rows_locator())
        count = 0
        for index in range(rows.count()):
            if rows.nth(index).is_visible():
                count += 1
        return count

    # --- search actions ---
    def _wait_for_search_refresh(self):
        self.page.wait_for_timeout(800)
        self.wait_for_element_to_disappear(self.LOADING_ICON, timeout=20000)

    def _find_visible_enabled(self, selector: str):
        """Return the first visible+enabled locator match, or None if there are none."""
        elements = self.page.locator(selector)
        for index in range(elements.count()):
            candidate = elements.nth(index)
            if candidate.is_visible() and candidate.is_enabled():
                return candidate
        return None

    def _first_visible_enabled(self, selector: str):
        """Return the first visible+enabled locator match, else the first match."""
        target = self._find_visible_enabled(selector)
        if target is not None:
            return target
        elements = self.page.locator(selector)
        assert elements.count() > 0, f"No elements found for selector '{selector}'"
        return elements.first

    def click_search(self):
        """Trigger the search. The grid filters on Enter (submitted in
        set_filter_value); the dedicated search button is optional and only
        clicked when a visible+enabled instance is present."""
        button = self._find_visible_enabled(self.SEARCH_BUTTON)
        if button is not None:
            button.scroll_into_view_if_needed(timeout=20000)
            button.click(timeout=20000)
        self._wait_for_search_refresh()

    def set_filter_value(self, input_id: str, value: str):
        """Fill the active (visible+enabled) filter input and submit it."""
        target = self._first_visible_enabled(self._search_input_locator(input_id))
        target.fill(value)
        target.dispatch_event("input")
        target.dispatch_event("change")
        target.press("Enter")

    def clear_all_filters(self):
        for config in self.FIELD_CONFIG.values():
            self.set_filter_value(config["input_id"], "")

    def get_active_filter_value(self, input_id: str) -> str:
        """Return the active filter input's value, stripped and lowercased."""
        target = self._first_visible_enabled(self._search_input_locator(input_id))
        return (target.input_value() or "").strip().lower()

    # --- high-level flows ---
    def get_sample_value_for_field(self, field_key: str) -> str:
        """Return the first non-empty visible sample value for the field."""
        config = self._config_for(field_key)
        cells = self.page.locator(
            self._column_cells_locator(config["column_index"])
        )
        assert cells.count() > 0, f"No cells found for field '{field_key}'"

        for index in range(cells.count()):
            cell = cells.nth(index)
            # Skip frozen-column clones and other non-visible matches.
            if not cell.is_visible():
                continue
            text = " ".join((cell.inner_text() or "").split()).strip()
            if not text:
                text = (cell.get_attribute("title") or "").strip()
            if text:
                return text

        assert False, (
            f"No visible non-empty values found for field '{field_key}'"
        )

    def search_and_verify_field_results(self, field_key: str, search_text: str):
        """Search by a field and verify results match the entered value."""
        config = self._config_for(field_key)
        input_id = config["input_id"]

        expected = (search_text or "").strip()
        assert expected, f"Search text is empty for field {field_key}"

        self.clear_all_filters()
        self.set_filter_value(input_id, expected)
        self.click_search()

        active_value = self.get_active_filter_value(input_id)
        assert active_value == expected.lower(), (
            f"{field_key} filter value mismatch. "
            f"Expected '{expected.lower()}', got '{active_value}'"
        )

        assert self._visible_row_count() > 0, (
            f"No rows returned for {field_key} search '{expected}'"
        )

        cells = self.get_visible_cell_texts(
            self._column_cells_locator(config["column_index"])
        )
        matches = [text for text in cells if expected.lower() in text.lower()]
        assert matches, (
            f"No matching rows found for {field_key} search '{expected}'"
        )
