Feature: Website testing

Scenario: Patient table is not empty
  When opening patient page
  Then patient table is not empty

Scenario: User can register a new patient
  When user fills all fields on patient register page
  Then new patient is created

Scenario: User can not register an existing patient
  When register patient is opened and all data fields are filled
  Then user can not create an existing patient

# BUG - NON-INTERACTABLE ELEMENTS
# Scenario: User can add a new task in the system administration page
#  When user click on the add task page and fill all fields by using valid data
#  Then user can see added tasks on the page

Scenario: User can merge patients data on the data management page
 When user click on the merge patient records
 Then user can get a merged record

Scenario: User can not merge data of the one and the same patient
  When user click on the merge patient records by using one and the same patient data
  Then user can not get a merged record of the one and same patient

Scenario: User can not merge data of the non-existed patients
  When user click on the merge patient records by using non-existed patients data
  Then user can not get a merged record of the non-existed patients
