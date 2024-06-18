*** Settings ***
Library    AppiumLibrary

*** Variables ***
@{firstFinger}  create list  ${100} ${500}


*** Test Cases ***
Open test application for android
    open test app
    close popup when start
    click search icon on topbar
    input search into search bar    icon
    click button Nevigation Icon

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
    Wait Until Page Contains Element    id=com.material.components:id/bt_close    30s
    Click Element    id=com.material.components:id/bt_close
    # Tap With Positions    locations=@{firstFinger}

click search icon on topbar
    Wait Until Page Contains Element    accessibility_id=Search    30s
    Click Element    accessibility_id=Search


    # id=com.material.components:id/search_src_text

input search into search bar
    [Arguments]    ${kw}
    Wait Until Page Contains Element    id=com.material.components:id/search_src_text    30s
    Input Text    id=com.material.components:id/search_src_text    ${kw}

# //android.widget.TextView[@resource-id="com.material.components:id/tv_parent" and @text="Bottom Navigation"]


# //android.widget.LinearLayout[android.widget.TextView[@text="Bottom Navigation"] and android.widget.TextView[@text="Icon"]]  

click button Nevigation Icon 
    Wait Until Page Contains Element    xpath=//android.widget.LinearLayout[android.widget.TextView[@text="Bottom Navigation"] and android.widget.TextView[@text="Icon"]]  
    Click Element    xpath=//android.widget.LinearLayout[android.widget.TextView[@text="Bottom Navigation"] and android.widget.TextView[@text="Icon"]]
