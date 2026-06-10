*** Settings ***
Library     SeleniumLibrary

*** Test Case ***

Teste Google
    Open Browser        https://www.google.com      firefox
    Input Text          name=q                      Robot Framework
    Press Keys          name=q                      ENTER
    Sleep               3s
    Close Browser