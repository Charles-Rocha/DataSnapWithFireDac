object ClientModule1: TClientModule1
  OldCreateOrder = False
  Height = 271
  Width = 415
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=21.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Port=212'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      'Filters={}')
    Connected = True
    Left = 48
    Top = 40
    UniqueId = '{481A7F79-F05F-4C4E-9A3E-C8812EDABED3}'
  end
  object dtsPessoa: TDataSource
    DataSet = cdsPessoa
    Left = 159
    Top = 104
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 159
    Top = 40
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPessoa'
    RemoteServer = DSProviderConnection1
    Left = 48
    Top = 104
    object cdsPessoaidpessoa: TLargeintField
      FieldName = 'idpessoa'
    end
    object cdsPessoaflnatureza: TSmallintField
      FieldName = 'flnatureza'
    end
    object cdsPessoadsdocumento: TWideStringField
      FieldName = 'dsdocumento'
    end
    object cdsPessoanmprimeiro: TWideStringField
      FieldName = 'nmprimeiro'
      Size = 100
    end
    object cdsPessoanmsegundo: TWideStringField
      FieldName = 'nmsegundo'
      Size = 100
    end
    object cdsPessoadtregistro: TDateField
      FieldName = 'dtregistro'
    end
    object cdsPessoadscep: TWideStringField
      FieldName = 'dscep'
      Size = 15
    end
  end
end
