*** Settings ***
Documentation  Testovani eschopu. link Jira, severita, analytik, dalsi osoby
Library    SeleniumLibrary

Test Setup  Start test
Test Teardown  Close All Browsers

*** Variables ***
${URL}=      https://automationexercise.com/products
${BROWSER}=  chrome    #nepodporujeme jine browser
${input_field}=  //input[@id="search_product"]
${search_btn}=  //button[@id="submit_search"]
${result_title}=  //h2[contains(@class,"title")]
#browserstack
${os}                          windows
${osVersion}                   10
${browser}                     Edge
${browserVersion}              105
${browserstack_userName}       tomashak4
${browserstack_accessKey}      6nd64NMLsr3A7aHH2RAf

*** Keywords ***
Start test
    ${remoteUrl}                Set Variable        http://${browserstack_userName}:${browserstack_accessKey}@hub.browserstack.com:80/wd/hub
    &{desiredCapabilities}      Create Dictionary   os=${os}     os_version=${osVersion}     browser=${browser}   browser_version=${browserVersion}
    #Open Browser      ${URL}    remote_url=${remoteUrl}     desired_capabilities=${desiredCapabilities}
    Open Browser  url=${URL}  browser=${BROWSER}
    Maximize Browser Window

Search product
    [Documentation]  Lorem ipsum
    [Arguments]  ${what}=Top
    Wait Until Element Is Visible   ${input_field}
    Input Text  ${input_field}  text=${what}
    Click Element  ${search_btn}

Check result
    [Documentation]  Zkontroluje vysledek a nadpis, argument: what, atd.
    [Arguments]  ${what}=Top
    Wait Until Element Contains  ${result_title}  SEARCHED PRODUCTS
    Location Should Contain  ${what}  message=Kontrolujeme zmenu url na vyhledavani ${what}
*** Test Cases ***
ID-01a Search products
    [Tags]  Smoke  Regression
    [Documentation]  Nejaky popis TC, link do Jiry, author, confluence , admin atd.
    Search product  what=Top
    Check result  what=Top

ID-01b Search products
    [Documentation]  Nejaky popis TC, link do Jiry, author, confluence , admin atd.
    Search product  what=Dress
    Check result  what=Top

ID-02 Check detail
    [Documentation]  eee
    [Tags]  new
    Wait Until Element Is Visible  (//div[@class="col-sm-4"]//div[@class="choose"]//a)[1]
    Click Element  (//div[@class="col-sm-4"]//div[@class="choose"]//a)[1]
    Wait Until Element Is Visible  //div[@class="product-details"]//h2
    ${product_name} =  Get Text  //div[@class="product-details"]//h2
    ${product_price} =  Get Text  //div[@class="product-details"]//span/span
    # TODO  dale kontrola v kosiku