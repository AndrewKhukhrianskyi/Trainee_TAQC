Feature: Website testing

Scenario: Patient table is not empty
  Given patient page is opened
  When opening patient page
  Then patient table is not empty

Scenario: User can register a new patient
  Given patient page is opened
  When user fills all fields on patient register page
  Then new patient is created

Scenario: User can not register an existing patient
  Given patient page
  When register patient is opened and all data fields are filled
  Then user can not create an existing patient

Scenario: User can add a new task in the system administration page
  Given system administration page is opened
  When user click on the add task page and fill all fields by using valid data
  Then user can see added tasks on the page

Scenario: User can merge records of two patients
  Given data management page is opened
  When user click on the merge patient records
  Then user can get a merged record

Scenario: User can not merge one and the same patient
  Given data management page
  When user click on the merge patient records
  Then user can not get a merged record of the one and same patient

Scenario: User can not merge records by using non-existed patient
  Given data management page is opened
  When user click on the merge patient records
  Then user can not get a merged record of the non-existed patients
