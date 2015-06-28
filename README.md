This is an expense reporting app.  it is customized for the workflow already in use by
the organization it was designed for.  

Upon signin, a user can create transactions. Once all transactions are entered, user can then 
go to a reports dashboard and pull up all transactions between two dates.  The transactions are 
totalled.  There is also a printable view which has hides navigation elements and provides other
elements which are hidden in normal view.  

Admin users can add users and view reports for all users.  


# To Do:

### Display: 

- need to adjust will_paginate settings

#### Done

- Name of user is shown in index view. Done

#### Not Finished

- Fields are responsive to screen size
- fix flash error messages


### reporting:

#### Done

- reports by user, and with start and end dates can be run.  Done
- reports show totals by account. Done
- reports show totals by program and account. done
- Reports have a printable view. Done


### Tests:  

- Application is fully tested.  in progress


### Model: 

- Users can enter and edit their transactions. Done
- Users cannot be deleted if they have transactions entered.  Done

### Authorization:

#### Done

- Basic authorization system is in place. 
- Admins can enter and delete users.

#### Not finished:

- Authorized users and admins can enter for other users.  
- Coordinators can approve transactions. coordinators are linked to specific employees, ie coordinator x can approve for employee a,b and c but not employees d, e, f.
- Admins can enter additional accounts and programs

### Future:  

- Uploading images of receipts with each transaction
- Individual companies can login and create their own customized forms

