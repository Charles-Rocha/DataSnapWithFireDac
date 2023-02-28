object frmCliente: TfrmCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cliente'
  ClientHeight = 353
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 353
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlGrid: TPanel
      Left = 0
      Top = 0
      Width = 683
      Height = 329
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object dbgPessoa: TDBGrid
        Left = 0
        Top = 0
        Width = 683
        Height = 329
        Align = alClient
        DataSource = ClientModule1.dtsPessoa
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'flnatureza'
            Title.Alignment = taCenter
            Width = 60
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'dsdocumento'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmprimeiro'
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmsegundo'
            Width = 180
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'dtregistro'
            Title.Alignment = taCenter
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dscep'
            Width = 80
            Visible = True
          end>
      end
    end
    object pnlTotalRegistros: TPanel
      Left = 0
      Top = 329
      Width = 683
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object lblTotalRegistros: TLabel
        Left = 8
        Top = 4
        Width = 85
        Height = 13
        Caption = 'Total Registros: 0'
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 48
    object Iniciar1: TMenuItem
      Caption = 'Iniciar'
      object Conectar1: TMenuItem
        Caption = 'Conex'#227'o'
        OnClick = Conectar1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object CadastraremLote1: TMenuItem
        Caption = 'Cadastrar em Lote'
        OnClick = CadastraremLote1Click
      end
      object EndereoIntegrao1: TMenuItem
        Caption = 'Endere'#231'o Integra'#231#227'o'
        OnClick = EndereoIntegrao1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Inserir1: TMenuItem
        Caption = 'Inserir'
        OnClick = Inserir1Click
      end
      object Editar1: TMenuItem
        Caption = 'Editar'
        OnClick = Editar1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Deletar1: TMenuItem
        Caption = 'Deletar'
        OnClick = Deletar1Click
      end
    end
  end
end
