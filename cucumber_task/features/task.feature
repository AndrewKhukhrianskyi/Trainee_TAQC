Feature: Website testing

Scenario: Login page displaying
  Given opening the login page
  When login page is opened
  Then login page is displayed

Scenario: Information in the columns about patient is not empty
  Given patient page
  When opening patient page
  Then any column about patient is not empty

Scenario: User can register a new patient
  Given patient page
  When register patient is opened and all data fields are filled
  Then user can create a new patient

Scenario: User can not register an existed patient
  Given patient page
  When register patient is opened and all data fields are filled
  Then user can not create an existed patient

Scenario: User can add a new task in the system administration page
  Given system administration page
  When user click on the manage scheduler page
  Then user can see added tasks on the page

Scenario: User can merge records of two patients
  Given data management page
  When user click on the merge patient records
  Then user can get a merged record

Scenario: User can not merge records for two patients with same IDs
  Given data management page
  When user click on the merge patient records
  Then user can not get a merged record

Scenario: User can not merge records for two patients with wrong IDs
  Given data management page
  When user click on the merge patient records
  Then user can not get a merged record
