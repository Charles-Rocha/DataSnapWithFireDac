object frmConectar: TfrmConectar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Conectar'
  ClientHeight = 104
  ClientWidth = 345
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
    Left = 135
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Porta:'
  end
  object lblServidor: TLabel
    Left = 8
    Top = 8
    Width = 44
    Height = 13
    Caption = 'Servidor:'
  end
  object btnConectar: TButton
    Left = 262
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = btnConectarClick
  end
  object edtPorta: TEdit
    Left = 135
    Top = 24
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    Text = '212'
  end
  object edtServidor: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'localhost'
  end
  object btnFechar: TButton
    Left = 128
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btnFecharClick
  end
end
