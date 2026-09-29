
from locators.loginpage import LoginPage
from locators.productionsanitylocator import ProductionSanityLocators
from locators.productsummarylocator import ProductSummaryLocators

locator = {
           **ProductionSanityLocators,
           **ProductSummaryLocators,
           **LoginPage,
      }