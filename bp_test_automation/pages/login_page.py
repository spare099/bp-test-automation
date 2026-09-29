"""Login page object for BuyPlan application."""

import time
from playwright.sync_api import Page


class LoginPage:
    """Page object for the login/authentication page."""
    def __init__(self, page: Page):
        self.page = page

    def click_sign_in_link(self):
        self.click_element(self.SIGN_IN_LINK)

    def click_sign_out_confirmation(self):
        self.click_element(self.SIGN_OUT_CONFIRMATION)

    def click_sign_out_link(self):
        self.click_element(self.SIGN_OUT_LINK)

    def click_profile_icon(self):
        self.click_with_js(self.PROFILE_ICON)

    def click_login_button(self):
        self.click_element(self.LOGIN_BUTTON)
        self.page.wait_for_timeout(2000)

    def click_sign_in_button(self):
        self.click_element(self.SIGN_IN_BUTTON)
        

    def enter_email(self, email: str):
        """Enter email in the login field."""

        if self.is_element_present(self.EMAIL_ID_FIELD, timeout=5000):
            self.click_element(self.EMAIL_ID_FIELD)
            self.page.wait_for_timeout(2000)
            self.fill_text(self.EMAIL_ID_FIELD, email)
            self.page.wait_for_timeout(2000)
            self.click_login_button()
        else:
            self.page.goto(
                "https://buyplan-nonprod.int.ap-southeast-2.nonprod.a-sharedinfra.net/BuyPlan/Summary?depNo=004"
            )
            self.page.wait_for_timeout(20000)

    def enter_password(self, password: str):
        """Enter password in the password field."""
        self.click_element(self.PASSWORD_FIELD)
        self.page.wait_for_timeout(2000)
        self.fill_text(self.PASSWORD_FIELD, password)

    def sign_out(self):
        """Sign out from the application."""
        self.click_with_js(self.PROFILE_ICON)
        self.page.wait_for_timeout(2000)
        self.click_element(self.SIGN_OUT_LINK)
        self.page.wait_for_timeout(2000)
        self.click_element(self.SIGN_OUT_CONFIRMATION)

    def microsoft_login(self):
        """Perform Microsoft authentication login."""
        self.page.goto(
            "https://buyplan-nonprod.int.ap-southeast-2.nonprod.a-sharedinfra.net/"
        )
        email = self.page.get_by_placeholder("Email, phone, or Skype")
        cancel = self.page.get_by_role("link", name="Cancel")
        # SSO may show Cancel first, or go straight to the email prompt.
        for _ in range(40):
            if email.is_visible():
                break
            if cancel.is_visible():
                cancel.click()
                time.sleep(1)
                continue
            time.sleep(0.5)
        email.wait_for(state="visible", timeout=30000)
        email.click()
        email.fill("svcbpautousr@kmart.com.au")
        self.page.get_by_role("button", name="Next").click()
        time.sleep(2)
        password = self.page.get_by_placeholder("Password")
        password.wait_for(state="visible", timeout=30000)
        password.click()
        password.fill("rp@-6b0IS^073@2*Qu52n0^10H(%^2-*667^^I")
        self.page.get_by_role("button", name="Sign in").click()
        self.page.wait_for_timeout(10000)
