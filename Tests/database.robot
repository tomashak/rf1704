*** Settings ***
Library  DatabaseLibrary

Suite Setup  Connect to Testing Database

*** Keywords ***
Connect to Testing Database
    Connect To Database	    dbapiModuleName=pymysql     dbHost=sql7.freemysqlhosting.net      dbName=sql7612906       dbPort=3306
    ...                     dbUsername=sql7612906       dbPassword=JIrYDhDmSv

*** Test Cases ***
Find data from table
    @{results}=  Query  select * from users
    log  ${results}
    Log Many  @{results}

Check if data exists
    Check If Exists In Database  select id from users where first_name = 'Tomáš'

Add myself
    Execute SQL String  INSERT INTO sql7612906.users (first_name, last_name, gender, note) VALUES ('pepa', 'novak', 'male', 'note');
    Check If Exists In Database  select id from users where first_name = 'pepa'