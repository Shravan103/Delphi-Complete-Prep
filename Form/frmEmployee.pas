unit frmEmployee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, DMMain, Data.DB;

type
  TEmployeeForm = class(TForm)
    PanelHeaderManager: TPanel;
    LabelAssess360A: TLabel;
    PanelManagerSidebar: TPanel;
    BtnEmployeeViewProjectIndo: TButton;
    BtnEmployeeManagerFeedback: TButton;
    BtnEmployeeAboutMe: TButton;
    PanelEmployeeAboutMe: TPanel;
    ImgEmployeeAboutMe: TImage;
    LblNameEmployeeAM: TLabel;
    LblEmailEmployeeAM: TLabel;
    LblRoleEmployeeAM: TLabel;
    LblSubroleEmployeeAM: TLabel;
    PanelEmployeeAboutMeHeader: TPanel;
    EditNameEmployeeAM: TEdit;
    EditEmailEmployeeAM: TEdit;
    EditRoleEmployeeAM: TEdit;
    EditSubroleEmployeeAM: TEdit;
    PanelEmployeeViewProjectInfo: TPanel;
    PanelEmployeeViewProjInfoHeader: TPanel;
    ScrollBoxManagerManagerFeedback: TScrollBox;
    PanelEmployeeManagerFeedbackHeader: TPanel;
    ScrollBoxEmployeeManagerFeedbackNestedAssessements: TScrollBox;
    PanelEmployee: TPanel;
    PanelContDBGridVPI: TPanel;
    DBGridVPI: TDBGrid;
    PanelContViewTeammates: TPanel;
    LblEmployeeViewTeammates: TLabel;
    StringGridEmployeeViewTeammates: TStringGrid;
    procedure BtnEmployeeViewProjectIndoClick(Sender: TObject);
    procedure BtnEmployeeManagerFeedbackClick(Sender: TObject);
    procedure BtnEmployeeAboutMeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridVPICellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmployeeForm: TEmployeeForm;

implementation

{$R *.dfm}

procedure TEmployeeForm.BtnEmployeeAboutMeClick(Sender: TObject);
begin
  PanelEmployeeViewProjectInfo.SendToBack;
  ScrollBoxManagerManagerFeedback.SendToBack;
  PanelEmployeeAboutMe.BringToFront;
end;

procedure TEmployeeForm.BtnEmployeeManagerFeedbackClick(Sender: TObject);
begin
  PanelEmployeeViewProjectInfo.SendToBack;
  ScrollBoxManagerManagerFeedback.BringToFront;
  PanelEmployeeAboutMe.SendToBack;
end;

procedure TEmployeeForm.BtnEmployeeViewProjectIndoClick(Sender: TObject);
begin
  PanelEmployeeViewProjectInfo.BringToFront;
  ScrollBoxManagerManagerFeedback.SendToBack;
  PanelEmployeeAboutMe.SendToBack;
end;

//------------------------------------------------------------------------------

//procedure TEmployeeForm.DBGridVPICellClick(Column: TColumn);
//var
//  SelectedProjectID: Integer;
//begin
//  // Get selected project_id from the current row in the grid
//  SelectedProjectID := DataModule1.qryDBGridVPI.FieldByName('project_id').AsInteger;
//
//  // Populate ListBox1 with employees for this project
//  with DataModule1.qryTeammates do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Text :=
//      'SELECT u.name AS employee_name ' +
//      'FROM project_assignments pa ' +
//      'JOIN users u ON pa.employee_id = u.user_id ' +
//      'WHERE pa.project_id = ' + QuotedStr(IntToStr(SelectedProjectID));
//    Open;
//
//    // Fill the ListBox
//    ListBoxEmployeeViewTeammates.Clear;
//    while not Eof do
//    begin
//      ListBoxEmployeeViewTeammates.Items.Add(FieldByName('employee_name').AsString);
//      Next;
//    end;
//  end;
//end;

procedure TEmployeeForm.DBGridVPICellClick(Column: TColumn);
var
  SelectedProjectID, RowIndex: Integer;
begin
  // Get selected project_id from the current row in the grid
  SelectedProjectID := DataModule1.qryDBGridVPI.FieldByName('project_id').AsInteger;

  // Query teammates for the selected project
  with DataModule1.qryTeammates do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT u.name AS employee_name, u.email AS employee_email, s.subrole_roles AS employee_subrole ' +
      'FROM project_assignments pa ' +
      'JOIN users u ON pa.employee_id = u.user_id ' +
      'JOIN subrole s ON s.subrole_id = u.subrole_id ' +
      'WHERE pa.project_id = ' + QuotedStr(IntToStr(SelectedProjectID));
    Open;

    // Prepare the grid
    StringGridEmployeeViewTeammates.RowCount := RecordCount + 1;
    StringGridEmployeeViewTeammates.ColCount := 3;
    StringGridEmployeeViewTeammates.FixedRows := 1;
    StringGridEmployeeViewTeammates.Cells[0, 0] := 'Teammates';
    StringGridEmployeeViewTeammates.Cells[1, 0] := 'Email';
    StringGridEmployeeViewTeammates.ColWidths[1] := 150;
    StringGridEmployeeViewTeammates.Cells[2, 0] := 'Subrole';

    RowIndex := 1;
    while not Eof do
    begin
      StringGridEmployeeViewTeammates.Cells[0, RowIndex] := FieldByName('employee_name').AsString;
      StringGridEmployeeViewTeammates.Cells[1, RowIndex] := FieldByName('employee_email').AsString;
      StringGridEmployeeViewTeammates.Cells[2, RowIndex] := FieldByName('employee_subrole').AsString;
      Inc(RowIndex);
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------

// POPULATE THE DBGRID (qryDBGridVPI):
procedure TEmployeeForm.FormShow(Sender: TObject);
begin
  with DataModule1.qryDBGridVPI do
  begin
    Close;
    SQL.Text :=
      'SELECT p.project_id, p.title AS project_name, ' +
      'e.name AS employee_name, e.email AS employee_email, ' +
      'e.role AS employee_role, s.subrole_roles AS employee_subrole ' +
      'FROM project_assignments pa ' +
      'JOIN projects p ON pa.project_id = p.project_id ' +
      'JOIN users e ON pa.employee_id = e.user_id ' +
      'LEFT JOIN subrole s ON e.subrole_id = s.subrole_id ' +
      'WHERE pa.employee_id = ' + QuotedStr(IntToStr(DataModule1.LoggedInUserID));
    Open;
  end;
end;
end.
