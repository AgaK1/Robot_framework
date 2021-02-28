*** SETTINGS ***
Library   funkcjarobot.py
Library   SSHLibrary
Library   SeleniumLibrary

*** VARIABLES ***
${MESSAGE}   HEY
${LOCAL HOST}   127.0.0.1
${USERNAME}   tester
${PASSWORD}   tester
${BROWSER}   Firefox
${VALID USER}   testerwsb_t1
${VALID PASSWORD}   adam1234
${PAGE URL}   https://profil.wp.pl/login.html?zaloguj=poczta
${LOGIN}   //*[@id="login"]
${EMAIL PASSWORD}   //*[@id="password"]
${BUTTON}   css:.nSubmit

*** TEST CASES ***
First Test
   Log to console   ${MESSAGE}

Second Test
   Log to console   Hello

Third Test
   First Keyword   Goodbye

Adding Test
   ${done} =   add two   ala   kota
   Should Be Equal   ${done}   alakotakotaala

Uname test
   Connect to local host
   Input username and password
   Input command
   Log out

Internet connection test
   Connect to local host
   Input username and password
   Verification
   Log out

Logging in wp
   Opening browser
   Opening website
   Input valid username and password
   Check for word
   Closing Browser


*** KEYWORDS ***
First Keyword
   [Arguments]   ${inf}
   Log to console   ${inf}

Connect to local host
   Open connection   ${LOCAL HOST}
Input username and password
   Login   ${USERNAME}   ${PASSWORD}
Input command
   ${OUTPUT} =   Execute Command   uname -a
   Should Contain   ${OUTPUT}   GNU/Linux
 Log out
    Close All Connections

Verification
    ${RESULT} =   Execute Command   ping -q -c1 8.8.8.8
    Should Contain   ${RESULT}   1 received
    Should Not Contain   ${RESULT}   100% packet loss

Opening browser
   Open browser   about:blank   ${BROWSER}
Opening website
   Go to   ${PAGE URL}
Input valid username and password
   Input text   ${LOGIN}   ${VALID USER}
   Input text   ${EMAIL PASSWORD}   ${VALID PASSWORD}
   Click element   ${BUTTON}
   Sleep   15
Check for word
   Page Should Contain   Odebrane
Closing Browser
   Close All Browsers