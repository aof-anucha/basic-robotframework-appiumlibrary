*** Settings ***
Library    AppiumLibrary

*** Variables ***
@{firstFinger}  create list  ${100} ${500}


*** Test Cases ***
Open test application for android
    open test app
    close popup when start

*** Keywords ***
open test app
    Open Application    remote_url=http://localhost:4723/wd/hub    
    ...    deviceName=TestDevice    
    ...    platformVersion=14.0    
    ...    platformName=Android    
    ...    appPackage=com.material.components	
    ...    appActivity=code.ActivityMainMenu
    ...    autoGrantPermissions=true

close popup when start
    # Wait Until Page Contains Element    id=com.android.permissioncontroller:id/permission_allow_button    30s
    # Tap With Positions    id=com.android.permissioncontroller:id/permission_allow_button
    # Tap with Positions    locations=@{firstFinger}
    Wait Until Page Contains Element    id=com.material.components:id/bt_close    30s
    Click Element    id=com.material.components:id/bt_close
    # Tap With Positions    locations=@{firstFinger}