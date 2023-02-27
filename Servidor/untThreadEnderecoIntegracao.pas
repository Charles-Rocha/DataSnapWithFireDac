unit untThreadEnderecoIntegracao;

interface

uses
  System.Classes, System.SysUtils, Vcl.ComCtrls, Vcl.Forms, Vcl.Controls,
  Vcl.ExtCtrls, System.IniFiles, FireDAC.Comp.Client, Datasnap.DBClient,
  REST.Response.Adapter, REST.Client, Data.Bind.ObjectScope, Data.DB;

type
  TfThreadEnderecoIntegracao = class(TThread)
  private
    { Private declarations }
    FQryEndereco: TFDQuery;
    FClientDataSet: TClientDataSet;
    FRESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    FRESTRequest: TRESTRequest;
    FFDConnection: TFDConnection;

    procedure InseriEnderecoIntegracao(mtListaTemporaria: TFDMemTable);
  protected
    procedure Execute; override;

  public
    property QryEndereco: TFDQuery read FQryEndereco write FQryEndereco;
    property ClientDataSet: TClientDataSet read FClientDataSet write FClientDataSet;
    property RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter read FRESTResponseDataSetAdapter write FRESTResponseDataSetAdapter;
    property RESTRequest: TRESTRequest read FRESTRequest write FRESTRequest;
    property FDConnection: TFDConnection read FFDConnection write FFDConnection;
  end;

implementation

//uses
//uses ServerMethodsUnit1;  //untPrincipal, untAtualizarCryptos;

procedure TfThreadEnderecoIntegracao.Execute;
var
  sCep, sDsuf, sNmcidade, sNmbairro, sNmlogradouro, sDscomplemento: string;
  idendereco: integer;
  mtListaTemporaria: TFDMemTable;
begin
  mtListaTemporaria := TFDMemTable.Create(nil);
  mtListaTemporaria.FieldDefs.Clear;
  mtListaTemporaria.FieldDefs.Add('idendereco', ftInteger, 0, false);
  mtListaTemporaria.FieldDefs.Add('uf',ftString,100,false);
  mtListaTemporaria.FieldDefs.Add('localidade',ftString,100,false);
  mtListaTemporaria.FieldDefs.Add('bairro',ftString,100,false);
  mtListaTemporaria.FieldDefs.Add('logradouro',ftString,100,false);
  mtListaTemporaria.FieldDefs.Add('complemento',ftString,100,false);
  mtListaTemporaria.CreateDataSet;

  try
    FQryEndereco.First;
    while not FQryEndereco.Eof do
    begin
      sCep := FQryEndereco.FieldByName('dscep').AsString;
      FClientDataSet.Active := false;
      FRESTResponseDataSetAdapter.Active := false;

      FRESTRequest.Resource := sCep + '/json';

      FRESTResponseDataSetAdapter.ClearDataSet;
      FRESTResponseDataSetAdapter.Active := true;
      FRESTResponseDataSetAdapter.UpdateDataSet;

      FRESTRequest.Execute;
      FClientDataSet.Active := true;

      idendereco := FQryEndereco.FieldByName('idendereco').AsInteger;
      sDsuf := ClientDataSet.FieldByName('uf').AsString;
      sNmcidade := ClientDataSet.FieldByName('localidade').AsString;
      sNmbairro := ClientDataSet.FieldByName('bairro').AsString;
      sNmlogradouro := ClientDataSet.FieldByName('logradouro').AsString;
      sDscomplemento := ClientDataSet.FieldByName('complemento').AsString;

      mtListaTemporaria.Append;
      mtListaTemporaria.Fieldbyname('idendereco').AsInteger := idendereco;
      mtListaTemporaria.Fieldbyname('uf').AsString := sDsuf;
      mtListaTemporaria.Fieldbyname('localidade').AsString := sNmcidade;
      mtListaTemporaria.Fieldbyname('bairro').AsString := sNmbairro;
      mtListaTemporaria.Fieldbyname('logradouro').AsString := sNmlogradouro;
      mtListaTemporaria.Fieldbyname('complemento').AsString := sDscomplemento;
      mtListaTemporaria.Post;

      FQryEndereco.Next;
    end;

    while not mtListaTemporaria.Eof do
    begin
      sNmcidade := mtListaTemporaria.FieldByName('localidade').AsString;

      mtListaTemporaria.Next;
    end;

    InseriEnderecoIntegracao(mtListaTemporaria);

  finally
    mtListaTemporaria.Free;
  end;
end;

procedure TfThreadEnderecoIntegracao.InseriEnderecoIntegracao(mtListaTemporaria: TFDMemTable);
var
  qryEnderecoIntegracao: TFDQuery;
  iTamanhoLote: integer;
begin
  {qryEnderecoIntegracao := TFDQuery.Create(nil);
  try
    qryEnderecoIntegracao.Connection := FFDConnection;
    qryEnderecoIntegracao.Close;
    qryEnderecoIntegracao.SQL.Clear;
    qryEnderecoIntegracao.SQL.Add('INSERT INTO endereco_integracao ');
    qryEnderecoIntegracao.SQL.Add(' (idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscomplemento) ');
    qryEnderecoIntegracao.SQL.Add('VALUES ( ');
    qryEnderecoIntegracao.SQL.Add(IntToStr(idendereco));
    qryEnderecoIntegracao.SQL.Add(', ' + QuotedStr(sDsuf));
    qryEnderecoIntegracao.SQL.Add(', ' + QuotedStr(sNmCidade));
    qryEnderecoIntegracao.SQL.Add(', ' + QuotedStr(sNmBairro));
    qryEnderecoIntegracao.SQL.Add(', ' + QuotedStr(sNmLogradouro));
    qryEnderecoIntegracao.SQL.Add(', ' + QuotedStr(sDsComplemento));
    qryEnderecoIntegracao.SQL.Add(' )');
    qryEnderecoIntegracao.ExecSQL;
  finally
    qryEnderecoIntegracao.Free;
  end;}

begin
  qryEnderecoIntegracao := TFDQuery.Create(nil);
  FFDConnection.StartTransaction;

  try
    try
      qryEnderecoIntegracao.Connection := FDConnection;
      qryEnderecoIntegracao.SQL.Add(' insert into endereco_integracao(idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscomplemento) ');
      qryEnderecoIntegracao.SQL.Add(' values (:idendereco, :dsuf, :nmcidade, :nmbairro, :nmlogradouro, :dscomplemento) ');
      qryEnderecoIntegracao.Params.ArraySize := mtListaTemporaria.RecordCount;
      iTamanhoLote := mtListaTemporaria.RecordCount;

      mtListaTemporaria.First;
      while not mtListaTemporaria.Eof do
      begin
        qryEnderecoIntegracao.ParamByName('idendereco').AsIntegers[Pred(mtListaTemporaria.RecNo)] := mtListaTemporaria.FieldByName('idendereco').AsInteger;
        qryEnderecoIntegracao.ParamByName('dsuf').AsStrings[Pred(mtListaTemporaria.RecNo)] := mtListaTemporaria.FieldByName('uf').AsString;
        qryEnderecoIntegracao.ParamByName('nmcidade').AsStrings[Pred(mtListaTemporaria.RecNo)] := mtListaTemporaria.FieldByName('localidade').AsString;
        qryEnderecoIntegracao.ParamByName('nmbairro').AsStrings[Pred(mtListaTemporaria.RecNo)] := mtListaTemporaria.FieldByName('bairro').AsString;
        qryEnderecoIntegracao.ParamByName('nmlogradouro').AsStrings[Pred(mtListaTemporaria.RecNo)] := mtListaTemporaria.FieldByName('logradouro').AsString;
        qryEnderecoIntegracao.ParamByName('dscomplemento').AsStrings[Pred(mtListaTemporaria.RecNo)] := mtListaTemporaria.FieldByName('complemento').AsString;

        mtListaTemporaria.Next;
      end;

      if (qryEnderecoIntegracao.Params.ArraySize > 0) then
      begin
        //Necess�ria a divis�o em lotes por causa que o Postgre dava erro ao
        //tentar inserir mais de 15000 registros de uma s� vez
        qryEnderecoIntegracao.Execute(iTamanhoLote div 5, 0);
        qryEnderecoIntegracao.Execute((iTamanhoLote div 5) + 10000, 10000);
        qryEnderecoIntegracao.Execute((iTamanhoLote div 5) + 20000, 20000);
        qryEnderecoIntegracao.Execute((iTamanhoLote div 5) + 30000, 30000);
        qryEnderecoIntegracao.Execute((iTamanhoLote div 5) + 40000, 40000);
      end;

      if FFDConnection.InTransaction then
        FFDConnection.Commit;

      FQryEndereco.Close;
      FQryEndereco.Open();
      FQryEndereco.FetchAll;
    except
      on E:Exception do
      begin
        if FFDConnection.InTransaction then
          FFDConnection.Rollback;
        raise;
      end;
    end;
  finally
    qryEnderecoIntegracao.Free;
  end;
end;

end;

end.
