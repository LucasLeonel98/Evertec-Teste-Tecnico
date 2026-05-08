unit UfrmBusClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons;

type
  TfrmBusClientes = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    qryBusClientes: TADOQuery;
    dsCidades: TDataSource;
    qryBusClientesCODIGO: TAutoIncField;
    qryBusClientesNOME: TWideStringField;
    qryBusClientesCPF_CNPJ: TStringField;
    qryBusClientesTELEFONE: TStringField;
    qryBusClientesENDERECO: TWideStringField;
    qryBusClientesBAIRRO: TWideStringField;
    qryBusClientesCOMPLEMENTO: TWideStringField;
    qryBusClientesEMAIL: TWideStringField;
    qryBusClientesCOD_CIDADE: TIntegerField;
    qryBusClientesCEP: TStringField;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtPesquisa: TEdit;
    rgFiltros: TRadioGroup;
    btnPesquisa: TBitBtn;
    btnSair: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_cliente : Integer;
  end;

var
  frmBusClientes: TfrmBusClientes;

implementation

uses
  UdmConecta, uUtil;

{$R *.dfm}

procedure TfrmBusClientes.FormShow(Sender: TObject);
begin
  edtPesquisa.Clear;
  qryBusClientes.Close;
  qryBusClientes.Open;

  rgFiltros.ItemIndex := 0;

end;

procedure TfrmBusClientes.btnPesquisaClick(Sender: TObject);
begin
  with qryBusClientes do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from clientes');
     SQL.Add('where codigo <> 0');

     if edtPesquisa.Text <> '' then
     begin
       case rgFiltros.ItemIndex of
        0 :
         if soNumeros(edtPesquisa.Text) <> '' then
          SQL.Add('and codigo = ' + edtPesquisa.Text)
         ;
        1 : SQL.Add('and nome like ' + QuotedStr('%' + edtPesquisa.Text + '%'));
        2 : SQL.Add('and endereco like ' + QuotedStr('%' + edtPesquisa.Text + '%'));
        3 : SQL.Add('and cpf_cnpj = ' +  edtPesquisa.Text);
       end;
     end;
     SQL.Add('order by nome');
     Open;
   end;
end;

procedure TfrmBusClientes.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBusClientes.DBGrid1DblClick(Sender: TObject);
begin
  cod_cliente := qryBusClientesCODIGO.Value;
   Close;
end;

procedure TfrmBusClientes.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (qryBusClientes.Active) then
  begin
      cod_cliente := qryBusClientesCODIGO.Value;
      Close;
  end;
end;

end.
