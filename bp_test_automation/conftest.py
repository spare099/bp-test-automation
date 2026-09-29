import pytest


pytest_plugins = [
	"utils.common_steps",
	"steps.product_summary_steps",
]


@pytest.fixture(scope="session")
def browser_type_launch_args():
	"""Run Chromium visibly and maximized by default."""
	return {
		"headless": False,
		"args": [
			"--start-maximized",
		],
	}


@pytest.fixture(scope="session")
def browser_context_args(browser_context_args):
	"""Use the native maximized viewport; browser contexts are incognito by default."""
	return {
		**browser_context_args, 
		"viewport": {"width": 1920, "height": 1080}
		}