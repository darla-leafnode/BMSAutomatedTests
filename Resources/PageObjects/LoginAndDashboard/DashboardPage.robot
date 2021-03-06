*** Settings ***
Documentation  Dashboard Page Object
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***

Wait for dashboard elements to load
    # Select the current iframe so that we can locate the elements inside it.
    Wait Until Element Is Visible   //iframe  timeout=50
    Select Frame    //iframe
    # Wait for Crop text
    Wait Until Page Contains Element    //body/jhi-main/div/section/jhi-program/section/div[1]/div[1]/form/div[1]/label/span    timeout=20
    # Wait for Program text
    Wait Until Page Contains Element    //body/jhi-main/div/section/jhi-program/section/div[1]/div[1]/form/div[2]/label/span    timeout=20
    # Wait for My Studies text
    Wait Until Page Contains Element    //body/jhi-main/div/section/jhi-program/section/div[2]/div/nav/ul/li[1]/a/span  timeout=20
    # Wait until spinning wheel on My Studies becomes hidden
    Wait Until Element Is Not Visible   //body/jhi-main/div/section/jhi-program/section/div[2]/div/div/jhi-my-studies/div[1]/div[2]/span    timeout=20
Search and Select Program
    # Wait for and select program dropdown list
    Wait Until Page Contains Element   //body/jhi-main/div/section/jhi-program/section/div/div[1]/form/div[2]/div[1]/ng-select2  timeout=25
    Click Element   //body/jhi-main/div/section/jhi-program/section/div/div[1]/form/div[2]/div[1]/ng-select2

    # Enter search keyword for the program to selct
    Wait Until Element Is Visible    //body/span/span/span[1]/input
    Press Keys    //body/span/span/span[1]/input  ${PROGRAM_SELECTED}

    # Wait for and select the program being searched from the list
    Click Element    //li[contains(text(), '${PROGRAM_SELECTED}')]
Click Launch
    # Select Launch button on dashboard
    Wait Until Element Is Visible   //span[contains(text(), 'Launch')]
    Click Element   //body/jhi-main/div/section/jhi-program/section/div[1]/div[1]/form/div[2]/div[2]/button

