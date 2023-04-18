*** Settings ***
Library  RequestsLibrary
Library  robot.libraries.DateTime

Test Setup  create session  TestAPI  https://jsonplaceholder.typicode.com/  disable_warnings=1

*** Test Cases ***
Example GET method
    ${resp}  GET On Session  TestAPI  /posts
    log  ${resp.json()}
    Should Be Equal As Strings  ${resp.status_code}  200  Expected 200, actual:${resp.status_code}, response was: ${resp.json()}

Example POST method
    &{headers} =  Create Dictionary  Content-Type=application/json;  charset=UTF-8
    ${string_json} =  Catenate
    ...    {
    ...        "userId": 1989,
    ...        "title": "Test posts tesena",
    ...        "body":  "loremipsum tesena"
    ...    }
    ${timebefore}=  Get Current Date
    ${resp}=  POST On Session  TestAPI  /posts  data=${string_json}  headers=${headers}
    ${timeafter}=  Get Current Date
    log  ${resp.json()}
    ${totaltime}=  Subtract Date From Date  ${timeafter}  ${timebefore}  result_format=number
    Should Be True   ${totaltime}< 0.5  Checke response time 
    Should Be Equal As Strings  ${resp.status_code}  201  Expected 201, actual:${resp.status_code}, response was: ${resp.json()}
    ${resp_json} =  Set Variable  ${resp.json()}
    ${id} =  Set Variable  ${resp_json['id']}
    log  ${id}