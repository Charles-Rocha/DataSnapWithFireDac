unit untEditar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmEditar = class(TForm)
    edtCep: TEdit;
    lblCep: TLabel;
    edtNmSegundo: TEdit;
    lblNmSegundo: TLabel;
    edtNmPrimeiro: TEdit;
    lblNmPrimeiro: TLabel;
    edtDsDocumento: TEdit;
    lblDsDocumento: TLabel;
    edtFlNatureza: TEdit;
    lblFlNatureza: TLabel;
    btnEditar: TButton;
    btnFechar: TButton;
    procedure btnEditarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmEditar: TfrmEditar;

implementation

{$R *.dfm}

uses ClientClassesUnit1, ClientModuleUnit1, untCliente;

procedure TfrmEditar.btnEditarClick(Sender: TObject);
var
  idPessoa, flnatureza: integer;
  dsdocumento, nmprimeiro, nmsegundo: string;
  dtregistro: TDateTime;
begin
  idPessoa := ClientModule1.cdsPessoaidpessoa.AsInteger;
  flnatureza := StrToInt(edtFlNatureza.Text);
  dsdocumento := edtDsDocumento.Text;
  nmprimeiro := edtNmPrimeiro.Text;
  nmsegundo := edtNmSegundo.Text;
  dtregistro := now;
  ClientModule1.ServerMethods1Client.Update(idPessoa, flnatureza,
    dsdocumento, nmprimeiro, nmsegundo, dtregistro);
  frmCliente.AtualizaGrid;
  LimpaCampos;
end;

procedure TfrmEditar.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEditar.FormShow(Sender: TObject);
begin
  edtFlNatureza.Text := ClientModule1.cdsPessoaflnatureza.AsString;
  edtDsDocumento.Text := ClientModule1.cdsPessoadsdocumento.AsString;
  edtNmPrimeiro.Text := ClientModule1.cdsPessoanmprimeiro.AsString;
  edtNmSegundo.Text := ClientModule1.cdsPessoanmsegundo.AsString;
  edtCep.Text := ClientModule1.cdsPessoadscep.AsString;
end;

procedure TfrmEditar.LimpaCampos;
begin
  edtFlNatureza.Clear;
  edtDsDocumento.Clear;
  edtNmPrimeiro.Clear;
  edtNmSegundo.Clear;
  edtCep.Clear;
  edtFlNatureza.SetFocus;
end;

end.
