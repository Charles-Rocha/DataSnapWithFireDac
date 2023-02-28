unit untInserir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmInserir = class(TForm)
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
    btnInserir: TButton;
    btnFechar: TButton;
    procedure btnInserirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    function ValidaObrigatorios: boolean;
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmInserir: TfrmInserir;

implementation

{$R *.dfm}

uses ClientClassesUnit1, ClientModuleUnit1, untCliente;

procedure TfrmInserir.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInserir.btnInserirClick(Sender: TObject);
var
  flnatureza: integer;
  dsdocumento, nmprimeiro, nmsegundo: string;
  dtregistro: TDateTime;
  dscep: string;
begin
  if not frmCliente.ChecarConexao then
    exit;

  if not ValidaObrigatorios then
  begin
    exit;
  end
  else
  begin
    flnatureza := StrToInt(edtFlNatureza.Text);
    dsdocumento := edtDsDocumento.Text;
    nmprimeiro := edtNmPrimeiro.Text;
    nmsegundo := edtNmSegundo.Text;
    dtregistro := now;
    dscep := edtCep.Text;
    ClientModule1.ServerMethods1Client.Insert(flnatureza, dsdocumento,
      nmprimeiro, nmsegundo, dtregistro, dscep);
    frmCliente.AtualizaGrid;
    LimpaCampos;
  end;
end;

procedure TfrmInserir.LimpaCampos;
begin
  edtFlNatureza.Clear;
  edtDsDocumento.Clear;
  edtNmPrimeiro.Clear;
  edtNmSegundo.Clear;
  edtCep.Clear;
  edtFlNatureza.SetFocus;
end;

function TfrmInserir.ValidaObrigatorios: boolean;
begin
  Result := true;
  if edtFlNatureza.Text = EmptyStr then
  begin
    Application.MessageBox('O campo Natureza � de preenchimento obrigat�rio','Aviso',mb_Ok+mb_IconExclamation);
    edtFlNatureza.SetFocus;
    Result := false;
  end;
  if edtDsDocumento.Text = EmptyStr then
  begin
    Application.MessageBox('O campo Descri��o documento � de preenchimento obrigat�rio','Aviso',mb_Ok+mb_IconExclamation);
    edtDsDocumento.SetFocus;
    Result := false;
  end;
  if edtNmPrimeiro.Text = EmptyStr then
  begin
    Application.MessageBox('O campo Primeiro nome � de preenchimento obrigat�rio','Aviso',mb_Ok+mb_IconExclamation);
    edtNmPrimeiro.SetFocus;
    Result := false;
  end;
  if edtNmSegundo.Text = EmptyStr then
  begin
    Application.MessageBox('O campo Segundo nome � de preenchimento obrigat�rio','Aviso',mb_Ok+mb_IconExclamation);
    edtNmSegundo.SetFocus;
    Result := false;
  end;
end;

end.
