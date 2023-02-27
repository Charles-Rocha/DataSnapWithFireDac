object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 369
  Width = 490
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 8
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 
      'C:\Atalhos\Delphi XE7 Projetos\WK Technology\DataSnap+FireDac\Se' +
      'rvidor\Win32\Debug\'
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
    Connected = True
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
    Active = True
    Dataset = ClientDataSet1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 168
    Top = 264
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
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
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 168
    Top = 208
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      F80100009619E0BD01000000180000000A000100000003000000440103636570
      02004A000000010005574944544802000200FE010A6C6F677261646F75726F02
      004A000000010005574944544802000200FE010B636F6D706C656D656E746F02
      004A000000010005574944544802000200FE010662616972726F02004A000000
      010005574944544802000200FE010A6C6F63616C696461646502004A00000001
      0005574944544802000200FE0102756602004A00000001000557494454480200
      0200FE01046962676502004A000000010005574944544802000200FE01036769
      6102004A000000010005574944544802000200FE010364646402004A00000001
      0005574944544802000200FE0105736961666902004A00000001000557494454
      4802000200FE0101000A4348414E47455F4C4F47040082000300000001000000
      0000000004000000040000001200320032003700390030002D00360036003900
      20004100760065006E006900640061002000540069006D0020004D0061006900
      6100000030005200650063007200650069006F00200064006F00730020004200
      61006E00640065006900720061006E007400650073001C00520069006F002000
      6400650020004A0061006E006500690072006F00040052004A000E0033003300
      30003400350035003700000004003200310008003600300030003100}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cep'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'logradouro'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'complemento'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'bairro'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'localidade'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'uf'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'ibge'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'gia'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'ddd'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'siafi'
        DataType = ftWideString
        Size = 255
      end>
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
