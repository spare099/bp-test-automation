"""Centralized locators for the Product Summary page."""


ProductSummaryLocators = {
    # --- Result table fields (whole column) ---
    "ProductNumber": "//table[@id='StyleSummaryTable']//tbody/tr/td[2]",
    "ProductSpecCode": "//table[@id='StyleSummaryTable']//tbody/tr/td[3]",
    "Family": "//table[@id='StyleSummaryTable']//tbody/tr/td[4]",
    "Class": "//table[@id='StyleSummaryTable']//tbody/tr/td[5]",
    "Seasonality": "//table[@id='StyleSummaryTable']//tbody/tr/td[6]",
    "KmartStyleID": "//table[@id='StyleSummaryTable']//tbody/tr/td[7]",
    "ProductDescription": "//table[@id='StyleSummaryTable']//tbody/tr/td[8]",
    "PrimaryColour": "//table[@id='StyleSummaryTable']//tbody/tr/td[9]",
    "SecondaryColour": "//table[@id='StyleSummaryTable']//tbody/tr/td[10]",
    "Vendor": "//table[@id='StyleSummaryTable']//tbody/tr/td[12]",

    # --- Search filter inputs ---
    "PRODUCT_NBR_SEARCH": "(//input[@id='inputProductNbr'])[1]",
    "PRODUCT_SPEC_CODE_SEARCH": "(//input[@id='inputProductSpecCode'])[1]",
    "FAMILY_SEARCH": "(//input[@id='inputFamily'])[1]",
    "CLASS_SEARCH": "(//input[@id='inputClass'])[1]",
    "SEASONALITY_SEARCH": "(//input[@id='inputSeasonality'])[1]",
    "KMART_STYLE_ID_SEARCH": "(//input[@id='inputKmartStyleId'])[1]",
    "PRODUCT_DESCRIPTION_SEARCH": "(//input[@id='inputProductDescription'])[1]",
    "PRIMARY_COLOUR_SEARCH": "(//input[@id='inputPrimaryColour'])[1]",
    "SECONDARY_COLOUR_SEARCH": "(//input[@id='inputSecondaryColour'])[1]",
    "SECONDARY_COLOUR_LONG_SEARCH": "(//input[@id='inputSecondaryColourLong'])[1]",
    "VENDOR_SEARCH": "(//input[@id='inputVendor'])[1]",

    # --- Actions / status ---
    "LOADING_ICON": "//p[@class='ng-binding' and text()='Loading...']",
    "SEARCH_BUTTON": "//button[@id='searchBtn']",
    "Checkbutton_TestPackName": "(//label[@uib-tooltip='TestPackName'])[1]/../../td[1]/input",
}