object LoginForm: TLoginForm
  Left = 0
  Top = 0
  Caption = 'LOGIN'
  ClientHeight = 705
  ClientWidth = 1370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  WindowState = wsMaximized
  TextHeight = 13
  object PanelLogin: TPanel
    Left = 0
    Top = 0
    Width = 1369
    Height = 705
    TabOrder = 0
    object PanelHeaderLogin: TPanel
      Left = 1
      Top = 1
      Width = 1367
      Height = 56
      Align = alTop
      Color = clActiveBorder
      ParentBackground = False
      TabOrder = 0
      object LabelAssess360L: TLabel
        Left = 1187
        Top = 9
        Width = 153
        Height = 38
        Caption = 'ASSESS360'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object PanelLoginBox: TPanel
      Left = 512
      Top = 160
      Width = 377
      Height = 417
      BorderStyle = bsSingle
      Color = clSkyBlue
      ParentBackground = False
      TabOrder = 1
      object LblLoginName: TLabel
        Left = 88
        Top = 111
        Width = 41
        Height = 18
        Caption = 'Name: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblLoginEmail: TLabel
        Left = 88
        Top = 178
        Width = 40
        Height = 18
        Caption = 'Email: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblLoginPass: TLabel
        Left = 88
        Top = 242
        Width = 62
        Height = 18
        Caption = 'Password:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 377
        Height = 65
        Caption = 'LOG-IN'
        Color = clActiveBorder
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object EditLoginName: TEdit
        Left = 88
        Top = 132
        Width = 201
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object EditLoginEmail: TEdit
        Left = 88
        Top = 198
        Width = 201
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object EditLoginPass: TEdit
        Left = 88
        Top = 262
        Width = 201
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object BtnLogin: TButton
        Left = 148
        Top = 332
        Width = 89
        Height = 41
        Caption = 'LOGIN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = BtnLoginClick
      end
    end
  end
end
