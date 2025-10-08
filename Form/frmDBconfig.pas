unit frmDBconfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, DMMain, frmLogin, System.UITypes;

type
  TfrmConfig = class(TForm)
    PanelConfig: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    edtHostname: TEdit;
    edtPort: TEdit;
    edtDBName: TEdit;
    edtUsername: TEdit;
    edtPassword: TEdit;
    LblHost: TLabel;
    LblPort: TLabel;
    LblDatabaseName: TLabel;
    LblUsername: TLabel;
    LblPassword: TLabel;
    btnConnect: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure SaveSettings;
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------

procedure TfrmConfig.btnConnectClick(Sender: TObject);
begin
  SaveSettings;
  try
    DataModule1.LoadConnectionFromINI;
    if DataModule1.ADOConnection1.Connected then
    begin
      MessageDlg('Connection successful!', mtInformation, [mbOK], 0);
      LoginForm.Show;
      Self.Hide;
    end;
  except
    on E: Exception do
      MessageDlg('Connection failed!' + sLineBreak + E.Message, mtError, [mbOK], 0);
  end;
end;

//------------------------------------------------------------------------------

procedure TfrmConfig.FormCreate(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
  try
    edtHostname.Text := ini.ReadString('Database', 'Server', '');
    edtPort.Text     := ini.ReadString('Database', 'Port', '');
    edtDBName.Text   := ini.ReadString('Database', 'Database', '');
    edtUsername.Text := ini.ReadString('Database', 'Username', '');
    edtPassword.Text := ini.ReadString('Database', 'Password', '');
  finally
    ini.Free;
  end;
end;

//------------------------------------------------------------------------------

procedure TFrmConfig.SaveSettings;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
  try
    ini.WriteString('Database', 'Server', edtHostname.Text);
    ini.WriteString('Database', 'Port', edtPort.Text);
    ini.WriteString('Database', 'Database', edtDBName.Text);
    ini.WriteString('Database', 'Username', edtUsername.Text);
    ini.WriteString('Database', 'Password', edtPassword.Text);
  finally
    ini.Free;
  end;
end;

end.
