program EVERTEC;

uses
  Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UfrmCadClientes in 'UfrmCadClientes.pas' {frmCadClientes},
  UfrmCadCidades in 'UfrmCadCidades.pas' {frmCadCidades},
  UdmConecta in 'UdmConecta.pas' {dmConecta: TDataModule},
  UfrmBusCidades in 'UfrmBusCidades.pas' {frmBusCidades},
  UfrmBusClientes in 'UfrmBusClientes.pas' {frmBusClientes},
  UfrmRelClientes in 'UfrmRelClientes.pas' {frmRelClientes},
  uUtil in 'uUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadClientes, frmCadClientes);
  Application.CreateForm(TfrmCadCidades, frmCadCidades);
  Application.CreateForm(TdmConecta, dmConecta);
  Application.CreateForm(TfrmBusCidades, frmBusCidades);
  Application.CreateForm(TfrmBusClientes, frmBusClientes);
  Application.CreateForm(TfrmRelClientes, frmRelClientes);
  Application.Run;
end.
