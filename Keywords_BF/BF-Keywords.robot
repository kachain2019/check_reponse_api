*** Settings ***
Library           Collections
Library           RequestsLibrary
Library           String
Library           Collections
Library           openpyxl
Library           OperatingSystem

*** Keywords ***
Function GET
  [Arguments]  ${URL}  ${path}
  Log To Console  \n\n*** Test Fucetion Get ***
  @{list} =	Create List	 category=191919  name=test.bpmn  nameLike=%25TESTNAJA%25  
  Create Session   api    ${URL}
  :FOR    ${i}     ${data}    IN ENUMERATE   @{list}
  \    ${header}    Create Dictionary    Content-Type=application/json;charset=utf-8
  \    ${response}    Get Request   api    ${path}${data}    headers=${header}
  \    Log To Console  \n${i+${1}}. ${data}
  \    Output   ${response.json()}
  \    Should Be Equal  ${response.json()["resultCode"]}  20000
  \    Should Be Equal  ${response.json()["sort"]}  id
  \    Should Be Equal  ${response.json()["start"]}  ${0}
  \    Should Be Equal  ${response.json()["total"]}  ${0}
  \    Should Be Equal  ${response.json()["order"]}  asc
  \    Should Be Equal  ${response.json()["size"]}  ${0}
  \    Should Be Empty  ${response.json()["data"]}
