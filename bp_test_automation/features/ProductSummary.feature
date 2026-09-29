@JenkinRun
Feature: ProductSummary search validations

@ProductSummary_006 @AWS_NonProd @Automated
Scenario Outline: Validate ProductSummary search correctness for each search box
    Given I Login to BuyPlan Application as Planner
    And I open ProductSummary page for department 004
    And I ensure ProductSummary has visible rows
    When I capture sample value for "<FieldKey>" search field
    And I search ProductSummary using the captured sample value
    Then ProductSummary "<FieldKey>" search results should be correct

Examples:
    | FieldKey           |
    | ProductNumber      |
    | ProductSpecCode    |
    | Family             |
    | Class              |
    | Seasonality        |
    | KmartStyleID       |
    | ProductDescription |
    | PrimaryColour      |
    | SecondaryColour    |
    | Vendor             |

