program EmployeeAssessmentDemo;

uses
  Vcl.Forms,
  frmLogin in 'Form\frmLogin.pas' {LoginForm},
  frmAdmin in 'Form\frmAdmin.pas' {AdminForm},
  frmManager in 'Form\frmManager.pas' {ManagerForm},
  frmEmployee in 'Form\frmEmployee.pas' {EmployeeForm},
  DMMain in 'Data\DMMain.pas' {DataModule1: TDataModule},
  frmDBconfig in 'Form\frmDBconfig.pas' {frmConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TAdminForm, AdminForm);
  Application.CreateForm(TManagerForm, ManagerForm);
  Application.CreateForm(TEmployeeForm, EmployeeForm);
  Application.Run;
end.
