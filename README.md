# Bank-Tech-Test_2

### [Makers Academy](http://www.makersacademy.com) - Week 10 Solo Tech Test Practice
Bank
-

[Test Outline](#Outline) | [Specification](#Specification) | [User Stories](#Story) | [Approach & Code Structure](#Approach) | [Installation Instructions](#Installation) | [Unit Testing](#Unit_Testing) | [Classes & Methods](#Methods) |


## <a name="Outline">Test Outline</a>

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## <a name="Specification">Specification</a>

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023 
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023 
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## <a name="Story">User Stories</a>

```
As a user, so I can manage my money, 
I'd like a bank account that keeps track of my balance.

As a user, so I can store my money, 
I'd like to be able to deposit money into my bank account.

As a user, so I can spend my money, 
I'd like to be able to withdraw my money. 

As a user, so I can see a summary of all my transactions,
I'd like to be able to print a bank statement. 

As a user, so I can get an overview of my spending, 
I'd like to see the date, amounts in/out and my balance for each transaction on my bank statement.
```

## <a name="Approach">Approach</a>

For this challenge, I felt the best way to approach my banking application was to look at the expected user input and application output.

Input:
- Given amounts to be deposited and withdrawn from the account.
- Given dates to specify when the transaction did or will take place.

Output:
- Transaction Data, including the date, transaction type, and remaining balance.
- A printed statement, showcasing all the processed transactions for the account, shown in reverse chromological order.

To achieve this, I've separated my code into three distinct classes, each with as close to a single responsibility as I felt would be practical.

Account = Deals with the balance, whilst supplying the client's data to the other classes.

Transaction = Formats the data for each of the account's transactions, to return this information as confirmation of the transaction to the user, whilst also making the data easily accessable to the statement.

Statement = Prints the transaction log, in reverse chronological order.

## <a name="Installation">Installation Instructions</a>

Clone the repository from github then change directory into it.

```
$ git clone https://github.com/RedPRO16/Bank-Tech-Test_2_Ruby
$ cd Bank-Tech-Test_2_Ruby
```
Load dependencies with bundle.
```
$ gem install bundle
$ bundle
```

Run Rspec for tests and coverage, then rubocop for linting
```
$ rspec
$ rubocop
```

Load the app in IRB, require the account, transaction, and statement files, create a new account with "account = Account.new", then use the class [methods](#Methods) below.

## <a name="Unit_Testng">Unit Testing</a>

Successful deposit, withdrawal and printing of the account statement:

![](https://github.com/RedPRO16/Bank-Tech-Test_2_Ruby/blob/main/Screenshot%202022-10-18%20at%2021.10.55.png)

## <a name="Methods">Classes & Methods</a>

### Account

| Methods | Description |
| --- | --- |
| Account.new     | Creates a new instance of an Account |
| .deposit(amount, date) | Attempts a positive amount and date (eg: 01/01/2020) to update the account balance and returns the formatted transaction visible on the account statement. If no date is given it automaticly sets to today's date |
| .withdraw(amount, date) | Attempts a positive amount and date (eg: 01/01/2020) to update the account balance and returns the formatted transaction visible on the account statement. If no date is given it automaticly sets to today's date |
| .statement.print | Prints a account statement with all the transactions made |

### Transaction

| Methods | Description |
| --- | --- |
| .debit(amount, date, balance) | save the deposit transaction to the accounts statement |
| .credit(amount, date, balance) | save the withdrawal transaction to the accounts statement | 

### Statement

| Methods | Description |
| --- | --- |
| .add(transaction) | Accepts a transaction object as a parameter and adds this to the transaction_log
| .print | Prints the transaction log in a table headed by Date, Credit, Debit, and Balance. Showing transactions in reverse chromological order |
