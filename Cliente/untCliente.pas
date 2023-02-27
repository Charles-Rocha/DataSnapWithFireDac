unit untCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus;

type
  TfrmCliente = class(TForm)
    btnEnderecoIntegracao: TButton;
    MainMenu1: TMainMenu;
    Iniciar1: TMenuItem;
    Conectar1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Cadastro1: TMenuItem;
    Inserir1: TMenuItem;
    Editar1: TMenuItem;
    N2: TMenuItem;
    Deletar1: TMenuItem;
    CadastraremLote1: TMenuItem;
    pnlPrincipal: TPanel;
    pnlGrid: TPanel;
    dbgPessoa: TDBGrid;
    pnlTotalRegistros: TPanel;
    lblTotalRegistros: TLabel;
    procedure cdsPessoaAfterPost(DataSet: TDataSet);
    procedure btnEnderecoIntegracaoClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Deletar1Click(Sender: TObject);
    procedure CadastraremLote1Click(Sender: TObject);
    procedure Inserir1Click(Sender: TObject);
    procedure Conectar1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses ClientClassesUnit1, ClientModuleUnit1, untConectar, untEditar, untInserir;

procedure TfrmCliente.btnEnderecoIntegracaoClick(Sender: TObject);
begin
  ClientModule1.ServerMethods1Client.EnderecoIntegracao;
end;

procedure TfrmCliente.CadastraremLote1Click(Sender: TObject);
var
  sPathFile: string;
begin
  sPathFile := ExtractFileName(Application.Name) + 'lista-clientes.csv';
  ClientModule1.ServerMethods1Client.CadastramentoEmLote(sPathFile);
end;

procedure TfrmCliente.cdsPessoaAfterPost(DataSet: TDataSet);
begin
  ClientModule1.cdsPessoa.ApplyUpdates(0);
end;

procedure TfrmCliente.Conectar1Click(Sender: TObject);
begin
  frmConectar.ShowModal;
end;

procedure TfrmCliente.Deletar1Click(Sender: TObject);
var
  idPessoa: integer;
begin
  idPessoa := ClientModule1.cdsPessoaidpessoa.AsInteger;
  ClientModule1.ServerMethods1Client.Delete(idPessoa);

  with ClientModule1 do
  begin
    SQLConnection1.Connected := false;
    SQLConnection1.Close;
    cdsPessoa.Close;
    SQLConnection1.Connected := true;
    cdsPessoa.Open;
  end;
  frmCliente.lblTotalRegistros.Caption := 'Total de registros: ' + IntToStr(ClientModule1.cdsPessoa.RecordCount);
end;

procedure TfrmCliente.Editar1Click(Sender: TObject);
begin
  frmEditar.ShowModal;
end;

procedure TfrmCliente.Inserir1Click(Sender: TObject);
begin
  frmInserir.ShowModal;
end;

procedure TfrmCliente.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
