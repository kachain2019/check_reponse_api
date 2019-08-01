*** Settings ***
Resource          keywords_BF/BF-Keywords.robot
Library         REST    https://jsonplaceholder.typicode.com

*** Variables ***
${url_bluefin-dev}  http://bluefin-dev.entro-lab.com

*** Test Cases ***  
Test Function Get  Function GET  ${url_bluefin-dev}  /v1/api/deployments?

