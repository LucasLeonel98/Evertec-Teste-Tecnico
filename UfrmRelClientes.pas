unit UfrmRelClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, DB, ADODB, RLReport,
  RLXLSFilter, RLFilters, RLPDFFilter;

type
  TfrmRelClientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtCodCliente: TEdit;
    Label2: TLabel;
    btnBusClientes: TBitBtn;
    DBText1: TDBText;
    edtCodCidade: TEdit;
    Label3: TLabel;
    btnBusCidades: TBitBtn;
    DBText2: TDBText;
    cbUF: TComboBox;
    Label4: TLabel;
    qryCidade: TADOQuery;
    qryCidadecodigo: TAutoIncField;
    qryCidadenome: TWideStringField;
    dsCidade: TDataSource;
    qryCliente: TADOQuery;
    AutoIncField1: TAutoIncField;
    WideStringField1: TWideStringField;
    dsCliente: TDataSource;
    qrRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    qryRelatorio: TADOQuery;
    dsRelatorio: TDataSource;
    qryRelatorioCODIGO: TAutoIncField;
    qryRelatorioCPF_CNPJ: TStringField;
    qryRelatorioNOME: TWideStringField;
    qryRelatoriocidade: TWideStringField;
    qryRelatorioESTADO: TStringField;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    btnVisualizar: TBitBtn;
    RLBand3: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand7: TRLBand;
    RLDBResult2: TRLDBResult;
    RLLabel10: TRLLabel;
    RLDBText9: TRLDBText;
    btnPDF: TBitBtn;
    btnGerarExcel: TBitBtn;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSFilter1: TRLXLSFilter;
    btnSair: TBitBtn;
    procedure edtCodCidadeExit(Sender: TObject);
    procedure btnBusCidadesClick(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure btnBusClientesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure btnPDFClick(Sender: TObject);
    procedure btnGerarExcelClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    procedure geraRelatorio;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClientes: TfrmRelClientes;

implementation

uses
  UfrmBusCidades, UfrmBusClientes, ShellAPI, UdmConecta;

{$R *.dfm}

procedure TfrmRelClientes.geraRelatorio;
begin
   with qryRelatorio do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select clientes.CODIGO,');
	  SQL.Add('  clientes.CPF_CNPJ,');
    SQL.Add('  clientes.NOME,');
    SQL.Add('  CIDADES.nome cidade,');
    SQL.Add('  cidades.ESTADO');
    SQL.Add('from clientes');
    SQL.Add('left join cidades on cidades.codigo = clientes.COD_CIDADE');
    SQL.Add('where clientes.codigo <> 0');

    if edtCodCliente.Text <> '' then
      SQL.Add('and clientes.codigo = ' + edtCodCliente.Text);

    if edtCodCidade.Text <> '' then
      sql.Add('and cidades.codigo = ' + edtCodCidade.Text);

    if cbUF.Text <> 'TODOS' then
      SQL.Add('and cidades.estado = ' + QuotedStr(cbUF.Text));

    SQL.Add('group by CIDADES.nome,cidades.ESTADO,  clientes.NOME, clientes.CPF_CNPJ,clientes.CODIGO');




    Open;
  end;
end;

procedure TfrmRelClientes.edtCodCidadeExit(Sender: TObject);
begin
  if edtCodCidade.Text <> '' then
  begin
    with qryCidade do
    begin
      CLose;
      sql.Clear;
      SQL.Add('select codigo, nome from cidades');
      SQL.Add('where codigo <> 0');
      SQL.Add('and codigo = ' + edtCodCidade.Text);
      Open;
    end;

    if  qryCidade.IsEmpty then
    begin
      edtCodCidade.Clear;
      MessageDlg('Cidade não encontrada!', mtWarning, [mbOK], 0);
      qryCidade.Close;
    end;
  end
  else
    qryCidade.Close;
end;

procedure TfrmRelClientes.btnBusCidadesClick(Sender: TObject);
begin
  frmBusCidades.cod_cidade := 0;
  frmBusCidades.ShowModal;

  if frmBusCidades.cod_cidade <> 0 then
  begin
    edtCodCidade.Text := IntToStr(frmBusCidades.cod_cidade);
    edtCodCidadeExit(nil);
  end;
end;

procedure TfrmRelClientes.edtCodClienteExit(Sender: TObject);
begin
   if edtCodCliente.Text <> '' then
  begin
    with qryCliente do
    begin
      CLose;
      sql.Clear;
      SQL.Add('select codigo, nome from clientes');
      SQL.Add('where codigo <> 0');
      SQL.Add('and codigo = ' + edtCodCliente.Text);
      Open;
    end;

    if  qryCliente.IsEmpty then
    begin
      edtCodCliente.Clear;
      MessageDlg('Cidade não encontrada!', mtWarning, [mbOK], 0);
      qryCliente.Close;
    end;
  end
  else
   qryCliente.Close;
end;

procedure TfrmRelClientes.btnBusClientesClick(Sender: TObject);
begin
  frmBusClientes.cod_cliente := 0;
  frmBusClientes.ShowModal;

  if frmBusClientes.cod_cliente <> 0 then
  begin
    edtCodCliente.Text := IntToStr( frmBusClientes.cod_cliente);
    edtCodClienteExit(nil);
  end;
end;

procedure TfrmRelClientes.FormShow(Sender: TObject);
begin
  qryCliente.Close;
  qryCidade.Close;
  cbUF.ItemIndex := 0;
end;

procedure TfrmRelClientes.btnVisualizarClick(Sender: TObject);
begin
  geraRelatorio;

  if qryRelatorio.IsEmpty then
    raise Exception.Create('Sem dados para o relatório mude os filtros e tente novamente !');

  qrRelatorio.Prepare;
  qrRelatorio.Preview;
end;

procedure TfrmRelClientes.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if not odd( qryRelatorio.RecNo) then
    RLBand3.Color := clSilver
  else
    RLBand3.Color := clWhite;
end;

procedure TfrmRelClientes.btnPDFClick(Sender: TObject);
var caminhoPDF : string;
begin
  caminhoPDF := ExtractFilePath(ParamStr(0)) + 'RelatorioCliente.pdf';
  geraRelatorio;

  if qryRelatorio.IsEmpty then
    raise Exception.Create('Sem dados para o relatório mude os filtros e tente novamente !');

  qrRelatorio.Prepare;
  RLPDFFilter1.FileName := caminhoPDF;
  
  // Executa a exportação
  qrRelatorio.SaveToFile(RLPDFFilter1.FileName);

  ShellExecute(Handle, 'open', PChar(CaminhoPDF), nil, nil, 1);

  ShowMessage('Relatório exportado com sucesso em PDF!');
end;

procedure TfrmRelClientes.btnGerarExcelClick(Sender: TObject);
var caminhoExcel : string;
begin
  caminhoExcel := ExtractFilePath(ParamStr(0)) + 'RelatorioCliente.xls';
  geraRelatorio;

  if qryRelatorio.IsEmpty then
    raise Exception.Create('Sem dados para o relatório mude os filtros e tente novamente !');

  qrRelatorio.Prepare;
  RLXLSFilter1.FileName := caminhoExcel;
  
  // Executa a exportação
  qrRelatorio.SaveToFile(RLXLSFilter1.FileName);

  ShellExecute(Handle, 'open', PChar(caminhoExcel), nil, nil, 1);

  ShowMessage('Relatório exportado com sucesso em excel!');
end;

procedure TfrmRelClientes.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.


