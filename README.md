# README

Loan Street's API allows you to create, load, and delete loans. Loans require the following parameters:

- amount: Total value of loan, in dollars and cents.
- interest: Percent interest as a whole number with decimals.
- monthy_payment_amount: Total amount paid every  month towards loan amount, in dollars and cents.
- length: Length of loan, in months.

To access the API, create a new instance of the client and include the API key: 

`client = LoanStreet::ApiClient.new("YOUR_API_KEY")`

`client.create_loan({amount: 50000, interest: 12.54, length: 48, monthly_payment_amount: 2000.25})`
