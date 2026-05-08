unit UfrmCadCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, StdCtrls, Mask, DBCtrls, Buttons;

type
  TfrmCadCidades = class(TForm)
    Panel1: TPanel;
    spCidadesINS: TADOStoredProc;
    qryCidades: TADODataSet;
    DataSource1: TDataSource;
    qryCidadesCODIGO: TIntegerField;
    qryCidadesNOME: TStringField;
    qryCidadesESTADO: TStringField;
    qryCidadesCEP_INICIAL: TStringField;
    qryCidadesCEP_FINAL: TStringField;
    dsCidades: TDataSource;
    btnInserir: TBitBtn;
    btnAlterar: TBitBtn;
    btnApagar: TBitBtn;
    btnBuscar: TBitBtn;
    pnlDados: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    edtNome: TDBEdit;
    edtCepInicial: TDBEdit;
    edtCepFinal: TDBEdit;
    Panel4: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    spCidadesUPD: TADOStoredProc;
    spCidadesDEL: TADOStoredProc;
    btnSair: TBitBtn;
    cbUF: TDBComboBox;
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtCepInicialKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    altera : Boolean;
    procedure ativarControles;
    procedure desativarControles;
  public
    { Public declarations }
  end;

var
  frmCadCidades: TfrmCadCidades;

implementation

uses
  UdmConecta, UfrmBusCidades, uUtil;

{$R *.dfm}

procedure TfrmCadCidades.btnInserirClick(Sender: TObject);
begin
  pnlDados.Enabled := True;
  edtNome.SetFocus;
  qryCidades.Insert;

  desativarControles;
  altera := False;
  qryCidadesESTADO.Value := 'SP';
end;

procedure TfrmCadCidades.btnAlterarClick(Sender: TObject);
begin
  if not qryCidades.IsEmpty then
  begin
    pnlDados.Enabled := True;
    altera := True;
    edtNome.SetFocus;
    qryCidades.Edit;

    desativarControles;
  end
  else
    MessageDlg('Selecione uma cidade !', mtWarning, [mbOK], 0);
end;

procedure TfrmCadCidades.btnGravarClick(Sender: TObject);
begin
  try
    qryCidades.Post;
    if not altera then
    begin
      spCidadesINS.Parameters.ParamByName('@NOME').Value := qryCidadesNOME.Value;
      spCidadesINS.Parameters.ParamByName('@ESTADO').Value := qryCidadesESTADO.Value;
      spCidadesINS.Parameters.ParamByName('@CEP_INICIAL').Value := SoNumeros( qryCidadesCEP_INICIAL.Value);
      spCidadesINS.Parameters.ParamByName('@CEP_FINAL').Value := SoNumeros( qryCidadesCEP_FINAL.Value);

      spCidadesINS.ExecProc;

      qryCidades.Edit;
      qryCidadesCODIGO.Value := spCidadesINS.Parameters.ParamByName('@CODIGO').Value;
      qryCidades.Post;


      MessageDlg('Cidade cadastrada com sucesso !', mtInformation, [mbOK], 0);
      ativarControles;
    
    end
    else
    begin
      spCidadesUPD.Parameters.ParamByName('@COD_CIDADE').Value := qryCidadesCODIGO.Value;
      spCidadesUPD.Parameters.ParamByName('@NOME').Value := qryCidadesNOME.Value;
      spCidadesUPD.Parameters.ParamByName('@ESTADO').Value := qryCidadesESTADO.Value;
      spCidadesUPD.Parameters.ParamByName('@CEP_INICIAL').Value := SoNumeros( qryCidadesCEP_INICIAL.Value);
      spCidadesUPD.Parameters.ParamByName('@CEP_FINAL').Value := SoNumeros( qryCidadesCEP_FINAL.Value);

      spCidadesUPD.ExecProc;

      MessageDlg('Cidade alterada com sucesso !', mtInformation, [mbOK], 0);
      ativarControles;
      altera := False;
    end;


    pnlDados.Enabled := False;
  except on E: Exception do
    begin
      MessageDlg('Falha ao salvar cidade:'+ #13 + E.Message, mtError,[mbOK], 0);
    end;
  end;

end;

procedure TfrmCadCidades.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    Key := #0;
  end;
end;

procedure TfrmCadCidades.FormShow(Sender: TObject);
begin
  qryCidades.Close;
  qryCidades.CreateDataSet;
  altera := False;
end;

procedure TfrmCadCidades.btnBuscarClick(Sender: TObject);
begin
  frmBusCidades.cod_cidade := 0;
  frmBusCidades.ShowModal;

  if frmBusCidades.cod_cidade <> 0 then
  begin
    with frmBusCidades do
    begin
      qryCidades.Insert;
      qryCidadesCODIGO.Value := qryBusCidadesCODIGO.Value;
      qryCidadesNOME.Value := qryBusCidadesNOME.Value;
      qryCidadesESTADO.Value := qryBusCidadesESTADO.Value;
      qryCidadesCEP_INICIAL.Value := qryBusCidadesCEP_INICIAL.Value;
      qryCidadesCEP_FINAL.Value := qryBusCidadesCEP_FINAL.Value;
      qryCidades.Post;
    end;
  end;
end;

procedure TfrmCadCidades.btnApagarClick(Sender: TObject);
begin
  if not qryCidades.IsEmpty then
  begin
    if Application.MessageBox('Deseja realmente excluir este registro?', 
      'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      try
        spCidadesDEL.Parameters.ParamByName('@COD_CIDADE').Value := qryCidadesCODIGO.Value;
        spCidadesDEL.ExecProc;

        MessageDlg('Registro excluído com sucesso !',mtInformation, [mbOK], 0);

        qryCidades.Close;
        qryCidades.CreateDataSet;

      except on E: Exception do
        begin
          MessageDlg('Falha ao apagar cidade:'+ #13 + E.Message, mtError,[mbOK], 0);
        end;
      end;
    end
  end;
end;

procedure TfrmCadCidades.btnCancelarClick(Sender: TObject);
begin

  qryCidades.Cancel;
  MessageDlg('Alterações descartadas!', mtInformation, [mbOK], 0);
  
  btnInserir.Enabled := True;
  btnAlterar.Enabled := True;
  btnApagar.Enabled := True;
  btnBuscar.Enabled := True;
  altera := False;

end;

procedure TfrmCadCidades.btnSairClick(Sender: TObject);
begin
  if qryCidades.State in[dsEdit, dsInsert] then
    qryCidades.Cancel;
  close;
end;

procedure TfrmCadCidades.edtCepInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #08,#13]) then
    Key := #0;

  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    Key := #0;
  end;
end;

procedure TfrmCadCidades.ativarControles;
begin
  btnInserir.Enabled := True;
  btnAlterar.Enabled := True;
  btnApagar.Enabled := True;
  btnBuscar.Enabled := True;
end;

procedure TfrmCadCidades.desativarControles;
begin
  btnInserir.Enabled := False;
  btnAlterar.Enabled := False;
  btnApagar.Enabled := False;
  btnBuscar.Enabled := False;
end;

end.
