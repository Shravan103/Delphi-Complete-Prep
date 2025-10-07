unit frmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, DMMain, frmAdmin, Data.DB, System.UITypes,
  frmManager, frmEmployee;

type
  TLoginForm = class(TForm)
    PanelLogin: TPanel;
    PanelHeaderLogin: TPanel;
    LabelAssess360L: TLabel;
    PanelLoginBox: TPanel;
    Panel1: TPanel;
    EditLoginName: TEdit;
    EditLoginEmail: TEdit;
    EditLoginPass: TEdit;
    BtnLogin: TButton;
    LblLoginName: TLabel;
    LblLoginEmail: TLabel;
    LblLoginPass: TLabel;
    procedure BtnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

procedure TLoginForm.BtnLoginClick(Sender: TObject);
var
  nameCpy, emailCpy, passwordCpy, userRole, userSubrole: string;
begin
  nameCpy := Trim(EditLoginName.Text);
  emailCpy := Trim(EditLoginEmail.Text);
  passwordCpy := Trim(EditLoginPass.Text);

  DataModule1.qryLogin.Close;
  DataModule1.qryLogin.SQL.Text :=
    'SELECT * FROM users u LEFT OUTER JOIN subrole s ON u.subrole_id = s.subrole_id '+
    ' WHERE name = ' + QuotedStr(nameCpy) +
    ' AND password_hash = ' + QuotedStr(passwordCpy) +
    ' AND email = ' + QuotedStr(emailCpy);
  DataModule1.qryLogin.Open;

  if not DataModule1.qryLogin.IsEmpty then
  begin
    userRole := DataModule1.qryLogin.FieldByName('role').AsString;
    userSubrole := DataModule1.qryLogin.FieldByName('subrole_roles').AsString;

    if userRole = 'Admin' then
    begin
      frmAdmin.AdminForm.EditNameAdminAM.Text := DataModule1.qryLogin.FieldByName('name').AsString;
      frmAdmin.AdminForm.EditEmailAdminAM.Text := DataModule1.qryLogin.FieldByName('email').AsString;
      frmAdmin.AdminForm.EditRoleAdminAM.Text := DataModule1.qryLogin.FieldByName('role').AsString;
      frmAdmin.AdminForm.EditSubroleAdminAM.Text := DataModule1.qryLogin.FieldByName('subrole_roles').AsString;
      frmAdmin.AdminForm.Show;
      Self.Hide;
    end
    else if userRole = 'Manager' then
    begin
      DataModule1.LoggedInUserID := DataModule1.qryLogin.FieldByName('user_id').AsInteger;

      frmManager.ManagerForm.EditNameManagerAM.Text := DataModule1.qryLogin.FieldByName('name').AsString;
      frmManager.ManagerForm.EditEmailManagerAM.Text := DataModule1.qryLogin.FieldByName('email').AsString;
      frmManager.ManagerForm.EditRoleManagerAM.Text := DataModule1.qryLogin.FieldByName('role').AsString;
      frmManager.ManagerForm.EditSubroleManagerAM.Text := DataModule1.qryLogin.FieldByName('subrole_roles').AsString;
      frmManager.ManagerForm.Show;
      Self.Hide;
    end
    else if userRole = 'Employee' then
    begin
      frmEmployee.EmployeeForm.EditNameEmployeeAM.Text := DataModule1.qryLogin.FieldByName('name').AsString;
      frmEmployee.EmployeeForm.EditEmailEmployeeAM.Text := DataModule1.qryLogin.FieldByName('email').AsString;
      frmEmployee.EmployeeForm.EditRoleEmployeeAM.Text := DataModule1.qryLogin.FieldByName('role').AsString;
      frmEmployee.EmployeeForm.EditSubroleEmployeeAM.Text := DataModule1.qryLogin.FieldByName('subrole_roles').AsString;
      frmEmployee.EmployeeForm.Show;
      Self.Hide;
    end;
  end
  else
    MessageDlg('Invalid login credentials.', mtError, [mbOK], 0);
end;

end.
