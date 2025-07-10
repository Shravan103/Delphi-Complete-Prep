uses
  IdSMTP, IdMessage, IdAttachmentFile, IdSSLOpenSSL, IdExplicitTLSClientServerBase,
  Vcl.Dialogs, Vcl.StdCtrls, SysUtils, Classes;

procedure TForm1.BtnAttachClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    TIdAttachmentFile.Create(IdMessage1.MessageParts, OpenDialog1.FileName);
    ShowMessage('File attached: ' + OpenDialog1.FileName);
  end;
end;

procedure TForm1.BtnSendClick(Sender: TObject);
begin
  // Setup SMTP settings for Gmail
  IdSMTP1.Host := 'smtp.gmail.com';
  IdSMTP1.Port := 587;
  IdSMTP1.Username := Trim(EditFrom.Text);
  IdSMTP1.Password := 'your_app_password_here'; // Replace with your actual Gmail App Password

  // SSL/TLS setup
  IdSMTP1.IOHandler := IdSSLIOHandler1;
  IdSMTP1.UseTLS := utUseExplicitTLS;

  // Prepare the email
  IdMessage1.Clear;
  IdMessage1.From.Address := Trim(EditFrom.Text);
  IdMessage1.Subject := Trim(EditSubject.Text);
  IdMessage1.Body.Text := MemoBody.Lines.Text;

  // Handle To, CC, BCC — support multiple addresses separated by , or ;
  IdMessage1.Recipients.EMailAddresses :=
    StringReplace(EditTo.Text, ';', ',', [rfReplaceAll]);
  IdMessage1.CCList.EMailAddresses :=
    StringReplace(EditCC.Text, ';', ',', [rfReplaceAll]);
  IdMessage1.BCCList.EMailAddresses :=
    StringReplace(EditBCC.Text, ';', ',', [rfReplaceAll]);

  try
    IdSMTP1.Connect;
    IdSMTP1.Send(IdMessage1);
    IdSMTP1.Disconnect;
    ShowMessage('✅ Email sent successfully!');
  except
    on E: Exception do
      ShowMessage('❌ Failed to send email: ' + E.Message);
  end;
end;