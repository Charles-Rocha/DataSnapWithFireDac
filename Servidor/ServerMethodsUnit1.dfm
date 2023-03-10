object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  Height = 369
  Width = 490
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 8
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 40
    Top = 72
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=Pessoas'
      'User_Name=postgres'
      'Password=WKTechnology'
      'Server=localhost'
      'DriverID=PG')
    LoginPrompt = False
    Left = 168
    Top = 8
  end
  object qryPessoa: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'select p.idpessoa, flnatureza, dsdocumento, nmprimeiro, nmsegund' +
        'o, dtregistro, dscep'
      'from pessoa p'
      'inner join endereco e on e.idpessoa = p.idpessoa'
      'order by p.idpessoa')
    Left = 168
    Top = 72
  end
  object dspPessoa: TDataSetProvider
    DataSet = qryPessoa
    Left = 168
    Top = 136
  end
  object qryEndereco: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from endereco')
    Left = 272
    Top = 72
  end
  object mtListaTemporaria: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 272
    Top = 8
    object mtListaTemporariaflnatureza: TIntegerField
      FieldName = 'flnatureza'
    end
    object mtListaTemporariadsdocumento: TStringField
      FieldName = 'dsdocumento'
    end
    object mtListaTemporarianmprimeiro: TStringField
      FieldName = 'nmprimeiro'
    end
    object mtListaTemporarianmsegundo: TStringField
      FieldName = 'nmsegundo'
    end
    object mtListaTemporariadscep: TStringField
      FieldName = 'dscep'
    end
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = ClientDataSet1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 168
    Top = 264
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/xml'
    Left = 320
    Top = 208
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Timeout = 10000
    SynchronizedEvents = False
    Left = 240
    Top = 208
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AcceptEncoding = 'identity'
    BaseURL = 'http://viacep.com.br/ws'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 168
    Top = 208
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 320
    Top = 264
    object ClientDataSet1cep: TWideStringField
      FieldName = 'cep'
      Size = 255
    end
    object ClientDataSet1logradouro: TWideStringField
      FieldName = 'logradouro'
      Size = 255
    end
    object ClientDataSet1complemento: TWideStringField
      FieldName = 'complemento'
      Size = 255
    end
    object ClientDataSet1bairro: TWideStringField
      FieldName = 'bairro'
      Size = 255
    end
    object ClientDataSet1localidade: TWideStringField
      FieldName = 'localidade'
      Size = 255
    end
    object ClientDataSet1uf: TWideStringField
      FieldName = 'uf'
      Size = 255
    end
    object ClientDataSet1ibge: TWideStringField
      FieldName = 'ibge'
      Size = 255
    end
    object ClientDataSet1gia: TWideStringField
      FieldName = 'gia'
      Size = 255
    end
    object ClientDataSet1ddd: TWideStringField
      FieldName = 'ddd'
      Size = 255
    end
    object ClientDataSet1siafi: TWideStringField
      FieldName = 'siafi'
      Size = 255
    end
  end
end
