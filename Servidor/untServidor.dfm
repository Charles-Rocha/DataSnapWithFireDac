object frmServidor: TfrmServidor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Servidor'
  ClientHeight = 65
  ClientWidth = 218
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblPorta: TLabel
    Left = 8
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Porta:'
  end
  object edtPorta: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = '212'
  end
  object btnConectar: TButton
    Left = 135
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 1
    OnClick = btnConectarClick
  end
end
