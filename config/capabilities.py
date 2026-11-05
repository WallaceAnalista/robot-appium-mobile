"""Capabilities do Appium por plataforma.

Use com:  robot -V config/capabilities.py:android tests   (ou :ios)
Os valores podem ser sobrescritos por variáveis de ambiente, o que permite
rodar localmente ou no CI sem alterar o código.
"""
import os


def get_variables(PLATFORM="android"):
    platform = PLATFORM.lower()
    remote_url = os.getenv("APPIUM_URL", "http://127.0.0.1:4723")

    if platform == "android":
        caps = {
            "platformName": "Android",
            "appium:automationName": "UiAutomator2",
            "appium:deviceName": os.getenv("DEVICE_NAME", "Android Emulator"),
            "appium:app": os.path.abspath(os.getenv("APP_PATH", "apps/my-demo-app.apk")),
            "appium:appWaitActivity": "*",
            "appium:autoGrantPermissions": True,
            "appium:noReset": False,
            "appium:newCommandTimeout": 240,
            "appium:uiautomator2ServerInstallTimeout": 120000,
            "appium:adbExecTimeout": 120000,
        }
    elif platform == "ios":
        caps = {
            "platformName": "iOS",
            "appium:automationName": "XCUITest",
            "appium:deviceName": os.getenv("DEVICE_NAME", "iPhone 15"),
            "appium:platformVersion": os.getenv("PLATFORM_VERSION", "17.5"),
            "appium:app": os.path.abspath(os.getenv("APP_PATH", "apps/MyRNDemoApp.app")),
            "appium:noReset": False,
            "appium:newCommandTimeout": 240,
            "appium:wdaLaunchTimeout": 300000,
            "appium:wdaConnectionTimeout": 300000,
            "appium:simulatorStartupTimeout": 300000,
        }
    else:
        raise ValueError(f"Plataforma não suportada: {PLATFORM}. Use 'android' ou 'ios'.")

    return {"REMOTE_URL": remote_url, "CAPABILITIES": caps, "PLATFORM": platform}
