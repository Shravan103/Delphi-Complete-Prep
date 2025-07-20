procedure TForm2.ButtonCreditClick(Sender: TObject);
var
  CID, AccNo: string;
  Amt, Bal: Double;
begin
  CID := QuotedStr(EditCustomerID.Text);
  Amt := StrToFloat(EditAmount.Text);

  // Get Account_no
  ADOQuery3.Close;
  ADOQuery3.SQL.Text := 'SELECT Account_no FROM Customer_Details WHERE Customer_id = ' + CID;
  ADOQuery3.Open;
  if ADOQuery3.IsEmpty then Exit;

  AccNo := QuotedStr(ADOQuery3.FieldByName('Account_no').AsString);

  // Get current balance
  ADOQuery3.Close;
  ADOQuery3.SQL.Text := 'SELECT Balance FROM Account_Details WHERE Account_no = ' + AccNo;
  ADOQuery3.Open;
  Bal := ADOQuery3.FieldByName('Balance').AsFloat + Amt;

  // Update balance
  ADOQuery3.Close;
  ADOQuery3.SQL.Text := 'UPDATE Account_Details SET Balance = ' + FloatToStr(Bal) +
                        ' WHERE Account_no = ' + AccNo;
  ADOQuery3.ExecSQL;

  ShowMessage('Credited. New Balance: ' + FloatToStr(Bal));
end;


----------------------------------------------


I have a database "bankdetails" with 
1. Customer_Details(Customer_id Primary Key, Fname, Lname,....Account_no Foreign Key......)
2. Account_Details(Account_no Primary Key, Account_Type Foreign Key, DateofCreation DATE, MinBalance, Balance)
3. Account_Type(Account_Type Primary Key, Type)
I want to create 2 screens in embarcadero delphi:
1st screen Already Created with Admin_Login table(This is done):
Login with username and password.
After login show screen 2.

2nd screen:
1. DBGrid to Show the Whole Data ONLY by TDAOQuery and TSataSource.
2. Using TEdits for Entering the Data into the database.
- Add new customer button.
- Update customer.
- Delete customer button.
- Also add functionality of credit and deposit option.
Give a step by step of how to build this. Use 3 TADOQuery Componenets for 1st for DBGrid, 2md for (INSERT, UPDATE, DELETE) and 3rd for CREDIT/DEBIT.
DSN is already setup also TADOConnection is already setup. INSERT is working fine, give me code for Update first, use QuottedStr() for queries. I am using TDateTime componenets for date fields



2/2

