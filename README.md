uses
  LibraryDisplayfm; // <- Add this to your uses clause if not already

procedure TLibraryPub.ShowEntryClick(Sender: TObject);
var
  DisplayForm: TLibraryDisplayForm;
begin
  if (BookTextList = nil) or (BookTextList.Count = 0) then
  begin
    ShowMessage('No data to display.');
    Exit;
  end;

  // Create the form at runtime
  DisplayForm := TLibraryDisplayForm.Create(Self);
  try
    // Set the label caption with BookTextList contents (joined)
    DisplayForm.Label1.Caption := BookTextList.Text;

    // Optional: If label1 may overflow, consider wrapping/scrolling
    DisplayForm.ShowModal;
  finally
    DisplayForm.Free;
  end;
end;
