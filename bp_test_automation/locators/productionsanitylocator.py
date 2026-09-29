"""Centralized locators for the Production Sanity (read-only health) checks.

Kept separate from the page object so selectors can be shared across
page objects and step definitions, and maintained in one place.
"""


ProductionSanityLocators = {
    # """Locator constants for the Production Sanity page checks."""

    # --- Home navigation links ---
    "PLANNER_WIDGET_LINK": "//a[contains(@href,'/Planner/Widgets?depNo=004')]",
    "PRODUCT_SUMMARY_LINK": "//a[contains(@href,'/BuyPlan/Summary?depNo=004')]",
    "DROPS_LINK": "//a[contains(@href,'/Planner/Drops?depNo=004')]",

    # --- Product Summary ---
    "PRODUCT_SUMMARY_ROWS": "#StyleSummaryTable tbody tr",

    # --- Drops ---
    "DROPS_SEARCH_FIELD": "#styleNoText",
    "DROPS_GRID_CELLS": "//*[@data-calname and @data-oid]",
    "DROPS_ZERO_VALUE": "//span[@class='value' and normalize-space()='0']",
    "DROPS_VALUE_CELLS": "//span[contains(@class,'value') and normalize-space()]",

    # --- Widgets ---
    "WIDGET_HEADINGS": "//h5",

    # --- Shared controls / status ---
    "HALF_YEAR_LINKS": "//ul[contains(@class,'halfYear')]//a",
    "LOADING_ICON": "//p[@class='ng-binding' and text()='Loading...']"
    }