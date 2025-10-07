unit DMMain;

interface

uses
  System.SysUtils, System.Classes, Data.Win.ADODB, Data.DB;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    qryAdminInsertUsers: TADOQuery;
    qryDBGridUM: TADOQuery;
    dsDBGridUM: TDataSource;
    qryDeleteAndUpdate: TADOQuery;
    qryLogin: TADOQuery;
    qryDBGridCP: TADOQuery;
    dsDBGridCP: TDataSource;
    qryCreateProject: TADOQuery;
    qryProjectAssignments: TADOQuery;
    dsProjectAssignments: TDataSource;
    qryManagers: TADOQuery;
    qryEmployees: TADOQuery;
    qryAssignProject: TADOQuery;
    qryProjects: TADOQuery;
    qryManagerViewAllProj: TADOQuery;
    dsManagerViewAllProj: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    LoggedInUserID: Integer;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
