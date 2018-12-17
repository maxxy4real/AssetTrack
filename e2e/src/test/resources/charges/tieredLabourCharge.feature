#labourChargeRuleCode: 4N,
#primeChargeInterval: 90,
#primeChargeIntervalPD: 90,
#primeChargeIntervalPRC: 10000,
#primeChargeIntervalSequence: 1

#labourChargeRuleCode: 4N,
#primeChargeInterval: 1,
#primeChargeIntervalPD: 1,
#primeChargeIntervalPRC: 17500,
#primeChargeIntervalSequence: 2

#labourChrimeChargeIntervalPRC: 0,
#pargeRuleCode: 4N,
#primeChargeInterval: 99,
#primeChargeIntervalPD: 9999,
#primeChargeIntervalSequence: 3

# primeChargeInterval: 90,
# primeChargeIntervalPD: 90,
# primeChargeIntervalPRC: 10000,
# primeChargeIntervalSequence: 1
@TieredLabourCharge
Feature: Tiered Labour Charge SLO Prime, and No parts charge

#  Background:
#    Given I am on the SettingsPage
#    When I wait for the app data to load
#    And I enter training engineer ID "0000142"
#    And I click the select button Tab

  Scenario: Complete Minimum Charge with a part
    Given I am on the SettingsPage
    When I wait for the app data to load
    And I click the settings Tab
    And I enter training engineer ID "0000142"
    And I click the select button Tab
    And User Settings - Gas - I select Working Area "Gas Services" Patch Area "11P4" and Region "1 - Scotland"
    And I click Customer Details Tab
    And I select Ready for work
    And I wait for Job Details to load and displayed "Your work for today: Customers 5  Activities 6"
    And I click on first customer info on the Job List
    And Job List - I click on the Go en-route button and click Arrive Label
    And Tabs - I click "Activities" button
    When Activities - I click the first appliance on the list
    And I select the Activity Status to "COMPLETE"
    And I click on the Charges tab
    Then I verify first task description "OCA TIERED - Bulk Circulator" Charge "STD LAB ONLY-NONE" VAT "20%" and Amount "£79.00"
    And Activity Description - I click the chevron
    And I verify the followings activity "Timer Mechanical EMT 2 TOTE x1" Charge "Parts" and Amount "£0.00" is displayed

  Scenario: Increase just below min charge period
    Given I am on the SettingsPage
    When I wait for the app data to load
    And I click the settings Tab
    And I enter training engineer ID "0000142"
    And I click the select button Tab
    And User Settings - Gas - I select Working Area "Gas Services" Patch Area "11P4" and Region "1 - Scotland"
    And I click Customer Details Tab
    And I select Ready for work
    And I wait for Job Details to load and displayed "Your work for today: Customers 5  Activities 6"
    And I click on first customer info on the Job List
    And Job List - I click on the Go en-route button and click Arrive Label
    And Tabs - I click "Activities" button
    And Activities - I click the first appliance on the list
    And I select the Activity Status to "COMPLETE"
    When I Increase the End Time by approximately 24 minutes
    And I click on the Charges tab
    Then I verify first task description "OCA TIERED - Bulk Circulator" Charge "STD LAB ONLY-NONE" VAT "20%" and Amount "£79.00"
    And I ensure the Chargeable Time is within 25 minutes
    And I also ensure the Job Duration is within 25 minutes

  Scenario: Increase just above min charge period
    Given I am on the SettingsPage
    When I wait for the app data to load
    And I click the settings Tab
    And I enter training engineer ID "0000142"
    And I click the select button Tab
    And User Settings - Gas - I select Working Area "Gas Services" Patch Area "11P4" and Region "1 - Scotland"
    And I click Customer Details Tab
    And I select Ready for work
    And I wait for Job Details to load and displayed "Your work for today: Customers 5  Activities 6"
    And I click on first customer info on the Job List
    And Job List - I click on the Go en-route button and click Arrive Label
    And Tabs - I click "Activities" button
    And Activities - I click the first appliance on the list
    And I select the Activity Status to "COMPLETE"
    When I Increase the End Time by approximately 26 minutes
    And I click on the Charges tab
    Then I verify first task description "OCA TIERED - Bulk Circulator" Charge "STD LAB ONLY-NONE" VAT "20%" and Amount "£199.00"

  Scenario: Increase just below interval of 90 minutes
    Given I am on the SettingsPage
    When I wait for the app data to load
    And I click the settings Tab
    And I enter training engineer ID "0000142"
    And I click the select button Tab
    And User Settings - Gas - I select Working Area "Gas Services" Patch Area "11P4" and Region "1 - Scotland"
    And I click Customer Details Tab
    And I select Ready for work
    And I wait for Job Details to load and displayed "Your work for today: Customers 5  Activities 6"
    And I click on first customer info on the Job List
    And Job List - I click on the Go en-route button and click Arrive Label
    And Tabs - I click "Activities" button
    When Activities - I click the first appliance on the list
    And I select the Activity Status to "COMPLETE"
    And I Increase the End Time to "31" minutes
    And I click on the Charges tab
    Then I verify first task description "OCA TIERED - Bulk Circulator" Charge "STD LAB ONLY-NONE" VAT "20%" and Amount "£199.00"

  # total minutes = 121 (5 from previous activities and 116 current one)
  # minChargePeriod = 30 minutes
  # minCharge = 65.83
  # 121 - 30 = 91 minutes
  # first period  = £175
  # 91 - 90 = 1 minute
  # second period = £100
  # Total £340.53 = £65.83 + £175 + £100
  # plus vat 20% = 408.64

  Scenario: Increase just above interval of 90 minutes, should also round to whole number
    Given I am on the SettingsPage
    When I wait for the app data to load
    And I click the settings Tab
    And I enter training engineer ID "0000142"
    And I click the select button Tab
    And User Settings - Gas - I select Working Area "Gas Services" Patch Area "11P4" and Region "1 - Scotland"
    And I click Customer Details Tab
    And I select Ready for work
    And I wait for Job Details to load and displayed "Your work for today: Customers 5  Activities 6"
    And I click on first customer info on the Job List
    And Job List - I click on the Go en-route button and click Arrive Label
    And Tabs - I click "Activities" button
    When Activities - I click the first appliance on the list
    And I select the Activity Status to "COMPLETE"
    And I Increase the End Time to "121" minutes
    And I click on the Charges tab
    Then I verify first task description "OCA TIERED - Bulk Circulator" Charge "STD LAB ONLY-NONE" VAT "20%" and Amount "£409.00"

  # Choose choose different labour charge code "4L"
  # labourChargeRuleCode:  4L
  # minimumChargeIfPrime: 7417
  # minimumChargeIfSbsqt: 7417
  # minimumPdIfPrime: 30
  # minimumPdIfSbsqt: 30

  # labourChargeRuleCode: 4L
  # primeChargeInterval: 90
  # primeChargeIntervalPD: 90
  # primeChargeIntervalPRC: 12499
  # primeChargeIntervalSequence: 1
  #
  # labourChargeRuleCode: 4L
  # primeChargeInterval: 1
  # primeChargeIntervalPD: 1
  # primeChargeIntervalPRC: 18334
  # primeChargeIntervalSequence: 2
  #
  # labourChargeRuleCode: 4L
  # primeChargeInterval: 99
  # primeChargeInterval: 99
  # primeChargeIntervalPD: 9999
  # primeChargeIntervalPRC: 0
  # primeChargeIntervalSequence: 3

  Scenario: Change Region to London
    Given I am on the SettingsPage
    When I wait for the app data to load
    And I click the settings Tab
    And I enter training engineer ID "0000142"
    And I click the select button Tab
    And User Settings - Gas - I select Working Area "Gas Services" Patch Area "11P4" and Region "7 - London & South East"
    And I click Customer Details Tab
    And I select Ready for work
    And I wait for Job Details to load and displayed "Your work for today: Customers 5  Activities 6"
    And I click on first customer info on the Job List
    And Job List - I click on the Go en-route button and click Arrive Label
    And Tabs - I click "Activities" button
    When Activities - I click the first appliance on the list
    And I select the Activity Status to "COMPLETE"
    And I click on the Charges tab
    Then I verify first task description "OCA TIERED - Bulk Circulator" Charge "STD LAB ONLY-NONE" VAT "20%" and Amount "£79.00"