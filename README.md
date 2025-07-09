unit MemoryGame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    CurrScore: TLabel;          // Label to show score
    StatusWinLose: TLabel;      // Label to show match status

    procedure FormCreate(Sender: TObject);
    procedure AnyButtonClick(Sender: TObject);

  private
    CardValues: array[1..16] of Integer;
    FirstClicked: TButton;
    SecondClicked: TButton;
    Score: Integer;
    PairsMatched: Integer;
    procedure ShuffleCards;
    procedure UpdateScore;
    procedure ResetButtons;
    procedure UpdateStatus(Matched: Boolean);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// Shuffle pairs (1-8 twice)
procedure TForm1.ShuffleCards;
var
  i, j, temp: Integer;
  values: array[1..16] of Integer;
begin
  for i := 1 to 8 do
  begin
    values[i * 2 - 1] := i;
    values[i * 2] := i;
  end;

  Randomize;
  for i := 16 downto 2 do
  begin
    j := Random(i) + 1;
    temp := values[i];
    values[i] := values[j];
    values[j] := temp;
  end;

  for i := 1 to 16 do
    CardValues[i] := values[i];
end;

// Show score in CurrScore label
procedure TForm1.UpdateScore;
begin
  CurrScore.Caption := 'Score: ' + IntToStr(Score);
end;

// Show status message
procedure TForm1.UpdateStatus(Matched: Boolean);
begin
  if Matched then
    StatusWinLose.Caption := 'Matched!'
  else
    StatusWinLose.Caption := 'No Match!';
end;

// Set up game when form starts
procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
  btn: TButton;
begin
  ShuffleCards;

  for i := 1 to 16 do
  begin
    btn := TButton(FindComponent('Button' + IntToStr(i)));
    btn.Caption := '';
    btn.Tag := i; // Store position
    btn.Enabled := True;
    btn.OnClick := AnyButtonClick;
  end;

  FirstClicked := nil;
  SecondClicked := nil;
  Score := 0;
  PairsMatched := 0;
  UpdateScore;
  StatusWinLose.Caption := '';
end;

// Reset both buttons if no match
procedure TForm1.ResetButtons;
begin
  FirstClicked.Caption := '';
  FirstClicked.Enabled := True;
  SecondClicked.Caption := '';
  SecondClicked.Enabled := True;
end;

// What happens when any button is clicked
procedure TForm1.AnyButtonClick(Sender: TObject);
var
  btn: TButton;
  index, value: Integer;
begin
  btn := TButton(Sender);
  index := btn.Tag;
  value := CardValues[index];

  btn.Caption := IntToStr(value);
  btn.Enabled := False;

  if FirstClicked = nil then
  begin
    FirstClicked := btn;
  end
  else
  begin
    SecondClicked := btn;

    if FirstClicked.Caption = SecondClicked.Caption then
    begin
      // Match!
      Score := Score + 10;
      Inc(PairsMatched);
      UpdateStatus(True);
    end
    else
    begin
      // No Match
      Score := Score - 2;
      UpdateStatus(False);
      ResetButtons;
    end;

    FirstClicked := nil;
    SecondClicked := nil;
    UpdateScore;

    if PairsMatched = 8 then
      ShowMessage('Game Over! Final Score: ' + IntToStr(Score));
  end;
end;

end.