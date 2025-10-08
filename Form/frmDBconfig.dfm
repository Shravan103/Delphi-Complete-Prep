object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  Caption = 'DB CONNECTION'
  ClientHeight = 522
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelConfig: TPanel
    Left = 0
    Top = 0
    Width = 425
    Height = 521
    TabOrder = 0
    object Panel1: TPanel
      Left = 8
      Top = 8
      Width = 409
      Height = 63
      Caption = 'DATABASE CONNECTION'
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
    object Panel2: TPanel
      Left = 8
      Top = 77
      Width = 409
      Height = 434
      Color = clGradientActiveCaption
      ParentBackground = False
      TabOrder = 1
      object LblHost: TLabel
        Left = 109
        Top = 28
        Width = 32
        Height = 18
        Caption = 'Host:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblPort: TLabel
        Left = 109
        Top = 93
        Width = 29
        Height = 18
        Caption = 'Port:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblDatabaseName: TLabel
        Left = 109
        Top = 154
        Width = 97
        Height = 18
        Caption = 'Database Name:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblUsername: TLabel
        Left = 109
        Top = 217
        Width = 67
        Height = 18
        Caption = 'Username: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblPassword: TLabel
        Left = 109
        Top = 284
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
      object edtHostname: TEdit
        Left = 109
        Top = 48
        Width = 193
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtPort: TEdit
        Left = 109
        Top = 112
        Width = 193
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edtDBName: TEdit
        Left = 109
        Top = 174
        Width = 193
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edtUsername: TEdit
        Left = 109
        Top = 237
        Width = 193
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edtPassword: TEdit
        Left = 109
        Top = 304
        Width = 193
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object btnConnect: TBitBtn
        Left = 144
        Top = 360
        Width = 113
        Height = 41
        Caption = '&CONNECT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        Kind = bkYes
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 5
        OnClick = btnConnectClick
      end
    end
  end
end
