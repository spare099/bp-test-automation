"""Product Summary step definitions for pytest-bdd."""

import pytest
from pytest_bdd import given, when, then, parsers
from pages.product_summary_page import ProductSummaryPage



@pytest.fixture
def product_summary_context():
    """Scenario context for Product Summary steps."""
    return {}


@given("I open ProductSummary page for department 004")
def open_product_summary_dep_004(page):
    """Open Product Summary directly for depNo 004."""
    ps = ProductSummaryPage(page)
    ps.open_summary_for_department("004")


@given("I ensure ProductSummary has visible rows")
def ensure_product_summary_rows(page):
    """Ensure at least one visible row is available by switching half-year links."""
    ps = ProductSummaryPage(page)
    ps.ensure_rows_available()


@when(parsers.parse('I capture sample value for "{element}" search field'))
def capture_sample_value(page, product_summary_context, element):
    """Capture runtime sample value from result grid for the target field."""
    ps = ProductSummaryPage(page)
    product_summary_context["field_key"] = element
    product_summary_context["sample_value"] = ps.get_sample_value_for_field(element)


@when("I search ProductSummary using the captured sample value")
def search_with_captured_value(page, product_summary_context):
    """Search using previously captured field/sample data."""
    ps = ProductSummaryPage(page)
    ps.search_and_verify_field_results(
        product_summary_context["field_key"],
        product_summary_context["sample_value"],
    )


@then(parsers.parse('ProductSummary "{field_key}" search results should be correct'))
def verify_search_results_correct(product_summary_context, field_key):
    """Verify field context stayed consistent for scenario."""
    assert product_summary_context.get("field_key") == field_key, (
        f"Field mismatch: expected {field_key}, "
        f"got {product_summary_context.get('field_key')}"
    )
    assert product_summary_context.get("sample_value"), (
        f"Missing sample value for field {field_key}"
    )

