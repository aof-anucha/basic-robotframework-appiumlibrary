*** Settings ***
Library    AppiumLibrary

Test Setup    open test app
Test Teardown    Close Application


*** Variables ***
@{firstFinger}  create list  ${100} ${500}


*** Test Cases ***
Open test application for android
    # open test app
    # close popup when start
    click search icon on topbar
    input icon into id=com.material.components:id/search_src_text and have placeholder is Search…
    click button Nevigation Icon

check expansion panels page
    click expansion panels
    check basic page 



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

close popup when start
    Wait Until Page Contains Element    id=com.material.components:id/bt_close    30s
    Click Element    id=com.material.components:id/bt_close
    # Tap With Positions    locations=@{firstFinger}

click search icon on topbar
    Wait Until Page Contains Element    accessibility_id=Search    30s
    Click Element    accessibility_id=Search


    # id=com.material.components:id/search_src_text

input ${kw} into ${input_field} and have placeholder is ${text}
    Wait Until Page Contains Element    ${input_field}    30s
    Element Text Should Be    ${input_field}    ${text}
    Input Text    ${input_field}    ${kw}

# //android.widget.TextView[@resource-id="com.material.components:id/tv_parent" and @text="Bottom Navigation"]


# //android.widget.LinearLayout[android.widget.TextView[@text="Bottom Navigation"] and android.widget.TextView[@text="Icon"]]  

click button Nevigation Icon 
    Wait Until Page Contains Element    xpath=//android.widget.LinearLayout[android.widget.TextView[@text="Bottom Navigation"] and android.widget.TextView[@text="Icon"]]  
    Click Element    xpath=//android.widget.LinearLayout[android.widget.TextView[@text="Bottom Navigation"] and android.widget.TextView[@text="Icon"]]
    # //android.widget.TextView[@text="New Releases"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="New Releases"]    30s
    Element Should Be Enabled    xpath=//android.widget.TextView[@text="New Releases"]
    Element Should Contain Text    xpath=//android.widget.TextView[@text="New Releases"]    New
    Element Should Not Contain Text    xpath=//android.widget.TextView[@text="New Releases"]    New a
    Element Text Should Be    xpath=//android.widget.TextView[@text="New Releases"]    New Releases         

click expansion panels 
    Wait Until Page Contains Element    xpath=//android.widget.LinearLayout[android.widget.TextView[@text="Expansion Panels"]]    30s
    # Run Keyword And Ignore Error    Scroll Element Into View    xpath=//android.widget.LinearLayout[android.widget.TextView[@text="Menu"]] 
    Scroll    xpath=//android.widget.LinearLayout[android.widget.TextView[@text="Animation"]]    xpath=//android.widget.LinearLayout[android.widget.TextView[@text="Cards"]]       
    Click Element    xpath=//android.widget.LinearLayout[android.widget.TextView[@text="Expansion Panels"]] 
    Wait Until Page Contains Element    xpath=//android.widget.LinearLayout[android.widget.TextView[@text="Basic"]]    15s
    # ${text}=    Get Text    xpath=//android.widget.LinearLayout[android.widget.TextView[@text="Basic"]] 
    # Should Be Equal    ${text}        Basic  
    Element Text Should Be    xpath=//android.widget.TextView[@text="Basic"]    Basic
    Click Element    xpath=//android.widget.LinearLayout[android.widget.TextView[@text="Basic"]] 

check basic page
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="Basic"]    30s
    ${text}=    Get Text    xpath=//android.widget.TextView[@text="Basic"] 
    Should Be Equal    ${text}        Basic
    Wait Until Page Contains Element    id=com.material.components:id/bt_toggle_text 
    Click Element    id=com.material.components:id/bt_toggle_text
    Wait Until Page Contains Element    id=com.material.components:id/bt_hide_text
    Click Element    id=com.material.components:id/bt_hide_text
    Click Element    id=com.material.components:id/bt_toggle_input
    input AOF into id=com.material.components:id/appCompatEditText and have placeholder is Name
    Click Element    xpath=//android.widget.RadioButton[@text="Female"]
    Click Element    id=com.material.components:id/bt_save_input
    Wait Until Page Contains Element    id=com.material.components:id/snackbar_text    10s
    Element Text Should Be    id=com.material.components:id/snackbar_text    Data saved        





