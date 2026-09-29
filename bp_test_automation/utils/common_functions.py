"""Reusable pure-Python Playwright helpers shared by all page objects."""

from playwright.sync_api import Page


class CommonFunctions:
    """Base class with common Playwright interactions (no JavaScript)."""

    def __init__(self, page: Page):
        self.page = page

    # --- basic interactions ---
    def click_element(self, selector, timeout: int = 20000):
        """Click the first matching, visible element."""
        element = self.page.locator(selector).first
        element.wait_for(state="visible", timeout=timeout)
        element.click(timeout=timeout)

    def fill_text(self, selector, text: str, timeout: int = 20000):
        """Fill text into the first matching, visible input."""
        element = self.page.locator(selector).first
        element.wait_for(state="visible", timeout=timeout)
        element.fill(text)

    def is_element_present(self, selector, timeout: int = 5000) -> bool:
        """Return True if the element becomes visible within the timeout."""
        try:
            self.page.locator(selector).first.wait_for(state="visible", timeout=timeout)
            return True
        except Exception:
            return False

    def wait_for_element_to_disappear(self, selector, timeout: int = 20000):
        """Wait until the element is hidden/detached (best effort)."""
        try:
            self.page.locator(selector).first.wait_for(state="hidden", timeout=timeout)
        except Exception:
            # Element may never have appeared; nothing to wait for.
            pass

    # --- reads ---
    def get_visible_cell_texts(self, element_locator) -> list[str]:
        """Return normalized text from every visible element matching the locator."""
        texts: list[str] = []
        cells = self.page.locator(element_locator)
        for index in range(cells.count()):
            cell = cells.nth(index)
            if cell.is_visible():
                text = " ".join((cell.inner_text() or "").split()).strip()
                if text:
                    texts.append(text)
        return texts
