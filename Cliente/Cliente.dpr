program Cliente;

uses
  Vcl.Forms,
  untCliente in 'untCliente.pas' {frmCliente},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  untConectar in 'untConectar.pas' {frmConectar},
  untInserir in 'untInserir.pas' {frmInserir},
  untEditar in 'untEditar.pas' {frmEditar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCliente, frmCliente);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TfrmConectar, frmConectar);
  Application.CreateForm(TfrmInserir, frmInserir);
  Application.CreateForm(TfrmEditar, frmEditar);
  Application.Run;
end.
