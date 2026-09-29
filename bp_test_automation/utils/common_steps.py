from pytest_bdd import given

from pages.login_page import LoginPage


@given("I Login to BuyPlan Application as Planner", target_fixture="logged_in_page")
def login_as_planner(page):
    """Login to BuyPlan application as Planner."""
    # Clear cookies
    page.context.clear_cookies()

    # Navigate to planner URL

    # Perform Microsoft login
    login = LoginPage(page)
    login.microsoft_login()
    return page

