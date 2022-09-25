Feature: transfer
  As a customer
  I want to deposit money into my account

  Scenario Outline: Deposit with no exists balance as table
    Given a customer with id 1 and pin 0000 exists
    When I login to ATM with id 1 and pin 0000
    When I deposit <amount> to my account
    Then my account balance is <value>

    Examples:
      | amount | value |
      | 50 | 50 |
      | 100.00 | 100.00 |
      | 500.00 | 500.00 |

  Scenario Outline: Deposit with existing balance as table
    Given a customer with id 1 and pin 0000 with balance 400.00 exists
    When I login to ATM with id 1 and pin 0000
    When I deposit <amount> to my account
    Then my account balance is <value>

    Examples:
      | amount | value |
      | 50 | 450 |
      | 100.00 | 500.00 |
      | 500.00 | 900.00 |
