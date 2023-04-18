*** Settings ***
Library  ../Library/csvLibrary.py

*** Test Cases ***
Get csv users
    @{data}=  Filter Csv File  Data/users.csv  app2
    Log  ${data}