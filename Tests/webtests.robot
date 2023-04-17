*** Settings ***
Library    SeleniumLibrary

Test Setup  Start test
Test Teardown  Close All Browsers

*** Keywords ***
Start test
    Open Browser  url=https://automationexercise.com/products  browser=chrome
    Maximize Browser Window

*** Test Cases ***
ID-01 Search products
    Wait Until Element Is Visible  //input[@id="search_product"] 
    Input Text  //input[@id="search_product"]  text=Top
    Click Element  //button[@id="submit_search"]
    Wait Until Element Contains  //h2[contains(@class,"title")]  SEARCHED PRODUCTS
    Location Should Contain  Top  message=Kontrolujeme zmenu url na vyhledavani TOP

ID-02 Check detail
    Wait Until Element Is Visible  (//div[@class="col-sm-4"]//div[@class="choose"]//a)[1]
    Click Element  (//div[@class="col-sm-4"]//div[@class="choose"]//a)[1]
    Wait Until Element Is Visible  //div[@class="product-details"]//h2
    ${product_name} =  Get Text  //div[@class="product-details"]//h2
    ${product_price} =  Get Text  //div[@class="product-details"]//span/span
    # TODO  dale kontrola v kosiku