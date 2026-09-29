Feature: Production-safe BuyPlan sanity validation

@ProductionSanity @ProdSafe @Automated
Scenario: Validate the authenticated BuyPlan home page and critical navigation links
    Given I Login to BuyPlan Application as Planner
    And I open the BuyPlan home page
    Then the BuyPlan home page should load without broken core links

@ProductionSanity @ProdSafe @Automated
Scenario: Validate the Planner Widgets page loads summary cards
    Given I Login to BuyPlan Application as Planner
    And I open the Planner Widgets page
    Then the Planner Widgets page should load its summary cards

@ProductionSanity @ProdSafe @Automated_9999
Scenario: Validate the Product Summary page loads department data
    Given I Login to BuyPlan Application as Planner
    And I open the Product Summary page for sanity validation
    Then the Product Summary page should load department data

@ProductionSanity @ProdSafe @Automated
Scenario: Validate the Drops page loads searchable drop data
    Given I Login to BuyPlan Application as Planner
    And I open the Drops page for sanity validation
    Then the Drops page should load searchable drop data
