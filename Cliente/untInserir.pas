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
  flnatureza := StrToInt(edtFlNatureza.Text);
  dsdocumento := edtDsDocumento.Text;
  nmprimeiro := edtNmPrimeiro.Text;
  nmsegundo := edtNmSegundo.Text;
  dtregistro := now;
  dscep := edtCep.Text;
  ClientModule1.ServerMethods1Client.Insert(flnatureza, dsdocumento,
  nmprimeiro, nmsegundo, dtregistro, dscep);

  with ClientModule1 do
  begin
    SQLConnection1.Connected := false;
    SQLConnection1.Close;
    cdsPessoa.Close;
    SQLConnection1.Connected := true;
    cdsPessoa.Open;
  end;
  frmCliente.lblTotalRegistros.Caption := 'Total de registros: ' + IntToStr(ClientModule1.cdsPessoa.RecordCount);
  LimpaCampos;
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

end.
