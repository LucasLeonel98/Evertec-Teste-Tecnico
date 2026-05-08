unit UfrmBusCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, ppBands,
  ppCache, ppClass, ppDB, ppDesignLayer, ppParameter, ppProd, ppReport,
  ppComm, ppRelatv, ppDBPipe, RLReport;

type
  TfrmBusCidades = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    qryBusCidades: TADOQuery;
    dsCidades: TDataSource;
    qryBusCidadesNOME: TWideStringField;
    qryBusCidadesESTADO: TStringField;
    qryBusCidadesCEP_INICIAL: TStringField;
    qryBusCidadesCEP_FINAL: TStringField;
    qryBusCidadesCODIGO: TAutoIncField;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtPesquisa: TEdit;
    btnPesquisa: TBitBtn;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    qrListagem: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    bdCidades: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel7: TRLLabel;
    btnSair: TBitBtn;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bdCidadesBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_cidade : Integer;
  end;

var
  frmBusCidades: TfrmBusCidades;

implementation

uses
  UdmConecta;

{$R *.dfm}

procedure TfrmBusCidades.DBGrid1DblClick(Sender: TObject);
begin
   cod_cidade := qryBusCidadesCODIGO.Value;
   Close;
end;

procedure TfrmBusCidades.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (qryBusCidades.Active) then
  begin
     cod_cidade := qryBusCidadesCODIGO.Value;
      Close;
  end;
end;

procedure TfrmBusCidades.FormShow(Sender: TObject);
begin
  edtPesquisa.Clear;
  btnPesquisa.Click;


end;

procedure TfrmBusCidades.btnPesquisaClick(Sender: TObject);
begin
  with qryBusCidades do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from cidades');
    SQL.Add('where codigo <> 0');
    if edtPesquisa.Text <> '' then
      SQL.Add('and nome like ' + QuotedStr('%' + edtPesquisa.Text + '%'));

    SQL.add('order by nome');
    Open;


  end;
end;

procedure TfrmBusCidades.BitBtn1Click(Sender: TObject);
begin
  if not qryBusCidades.IsEmpty then
  begin
    qrListagem.Prepare;
    qrListagem.Preview;
  end
  else
    MessageDlg('Sem dados para exibir !', mtInformation, [mbOK], 0);
end;

procedure TfrmBusCidades.bdCidadesBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if not odd( qryBusCidades.RecNo) then
    bdCidades.Color := clSilver
  else
    bdCidades.Color := clWhite;
end;

procedure TfrmBusCidades.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
