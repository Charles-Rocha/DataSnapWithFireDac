object frmEditar: TfrmEditar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Editar'
  ClientHeight = 93
  ClientWidth = 648
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCep: TLabel
    Left = 520
    Top = 8
    Width = 19
    Height = 13
    Caption = 'Cep'
  end
  object lblNmSegundo: TLabel
    Left = 392
    Top = 8
    Width = 71
    Height = 13
    Caption = 'Segundo nome'
  end
  object lblNmPrimeiro: TLabel
    Left = 264
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Primeiro nome'
  end
  object lblDsDocumento: TLabel
    Left = 136
    Top = 8
    Width = 102
    Height = 13
    Caption = 'Descri'#231#227'o documento'
  end
  object lblFlNatureza: TLabel
    Left = 8
    Top = 8
    Width = 44
    Height = 13
    Caption = 'Natureza'
  end
  object edtNmSegundo: TEdit
    Left = 392
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtNmPrimeiro: TEdit
    Left = 264
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtDsDocumento: TEdit
    Left = 136
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtFlNatureza: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object btnEditar: TButton
    Left = 486
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 5
    OnClick = btnEditarClick
  end
  object btnFechar: TButton
    Left = 566
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 6
    OnClick = btnFecharClick
  end
  object edtCep: TMaskEdit
    Left = 520
    Top = 24
    Width = 120
    Height = 21
    EditMask = '!99999-999;0;'
    MaxLength = 9
    TabOrder = 4
    Text = ''
  end
end
