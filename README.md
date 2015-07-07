This is an expense and time reporting app.  it is customized for the workflow already in use by
the organization it was designed for.  

Upon signin, a user can record credit card transactions or enter a report of hours worked.  
Once all transactions are entered, user can then go to a reports dashboard and pull up all 
transactions between two dates.  The transactions are totalled.  There is also a printable 
view which hides navigation elements and provides other elements which are hidden in normal view.  

Admin users can add users and view reports for all users.  


# To Do:

- add cookies
- add time report summaries/dashboard
- add email reminders
- add pay periods and statement dates

### Display: 


#### Not Finished

- Fields are responsive to screen size
- fix flash error messages


### reporting:

- reports by user, and with start and end dates can be run. 

- Reports have a printable view.

#### Not finished: 
- reports show totals by account. taken out of printable view
- reports show totals by program and account. taken out of printable view


### Tests:  

- Application is fully tested.  in progress


### Model: 

- Users can enter and edit their transactions.
- Users cannot be deleted if they have transactions entered.

### Authorization:

#### Done

- Basic authorization system is in place. 
- Admins can enter and delete users.
- Admins can enter additional accounts and programs

#### Not finished:

- Authorized users and admins can enter for other users.  
- Coordinators can approve transactions. coordinators are linked to specific employees, ie coordinator x can approve for employee a,b and c but not employees d, e, f.


### Future:  

- Uploading images of receipts with each transaction
