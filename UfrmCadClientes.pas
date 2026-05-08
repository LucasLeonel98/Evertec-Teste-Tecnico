unit UfrmCadClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ADODB, DB, StdCtrls, Buttons, Mask, DBCtrls;

type
  TfrmCadClientes = class(TForm)
    Panel1: TPanel;
    pnlDados: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnGravar: TBitBtn;
    btnCancela: TBitBtn;
    qryClientes: TADODataSet;
    dsClientes: TDataSource;
    spClientesINS: TADOStoredProc;
    spClientesUPD: TADOStoredProc;
    spClientesDEL: TADOStoredProc;
    btnInserir: TBitBtn;
    btnAlterar: TBitBtn;
    btnApagar: TBitBtn;
    btnBuscar: TBitBtn;
    qryClientesCODIGO: TIntegerField;
    qryClientesNOME: TStringField;
    qryClientesCPF_CNPJ: TStringField;
    qryClientesTELEFONE: TStringField;
    qryClientesENDERECO: TStringField;
    qryClientesBAIRRO: TStringField;
    qryClientesCOMPLEMENTO: TStringField;
    qryClientesEMAIL: TStringField;
    qryClientesCOD_CIDADE: TIntegerField;
    qryClientesCEP: TStringField;
    Label1: TLabel;
    edtCodigo: TDBEdit;
    Label2: TLabel;
    edtNome: TDBEdit;
    Label3: TLabel;
    edtCnpjCpf: TDBEdit;
    Label4: TLabel;
    edtTelefone: TDBEdit;
    Label5: TLabel;
    edtEndereco: TDBEdit;
    Label6: TLabel;
    edtBairro: TDBEdit;
    Label7: TLabel;
    edtComplemento: TDBEdit;
    Label8: TLabel;
    edtEmail: TDBEdit;
    Label9: TLabel;
    edtCidade: TDBEdit;
    Label10: TLabel;
    edtCep: TDBEdit;
    btnSair: TBitBtn;
    qryCidade: TADOQuery;
    dsCidade: TDataSource;
    qryCidadecodigo: TAutoIncField;
    qryCidadenome: TWideStringField;
    btnBusCidade: TBitBtn;
    DBText1: TDBText;
    qryCidadecep_inicial: TStringField;
    qryCidadecep_final: TStringField;
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtCidadeExit(Sender: TObject);
    procedure btnBusCidadeClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCnpjCpfKeyPress(Sender: TObject; var Key: Char);
    procedure edtCepKeyPress(Sender: TObject; var Key: Char);
    procedure edtCidadeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    altera: Boolean;
    procedure ativarControles;
    procedure desativarControles;
  public
    { Public declarations }

  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

uses
  UfrmBusClientes, UfrmBusCidades, uUtil, UdmConecta;

{$R *.dfm}



procedure TfrmCadClientes.btnInserirClick(Sender: TObject);
begin
  pnlDados.Enabled := True;
  edtCnpjCpf.SetFocus;
  qryClientes.Insert;

  qryCidade.Close;

  desativarControles;
  altera := False;

end;

procedure TfrmCadClientes.btnAlterarClick(Sender: TObject);
begin
  if not qryClientes.IsEmpty then
  begin
    pnlDados.Enabled := True;
    altera := True;
    edtNome.SetFocus;
    qryClientes.Edit;

    desativarControles;
  end
  else
    MessageDlg('Selecione um cliente !', mtWarning, [mbOK], 0);
end;

procedure TfrmCadClientes.btnApagarClick(Sender: TObject);
begin
  if not qryClientes.IsEmpty then
  begin
    if Application.MessageBox('Deseja realmente excluir este registro?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      try
        spClientesDEL.Parameters.ParamByName('@COD_CLIENTE').Value := qryClientesCODIGO.Value;
        spClientesDEL.ExecProc;

        MessageDlg('Registro excluído com sucesso !', mtInformation, [mbOK], 0);

        qryClientes.Close;
        qryClientes.CreateDataSet;
        qryCidade.Close

      except
        on E: Exception do
        begin
          MessageDlg('Falha ao apagar cliente:' + #13 + E.Message, mtError, [mbOK], 0);
        end;
      end;
    end
  end;
end;

procedure TfrmCadClientes.btnGravarClick(Sender: TObject);
begin
  try
    if qryClientesCEP.Value = '' then
    begin
      MessageDlg('Informe um CEP válido !', mtWarning, [mbOK], 0);
      Exit;
    end;
    if (StrToInt(SoNumeros(qryClientesCEP.Text)) >= StrToInt(SoNumeros( qryCidadecep_inicial.Value)))
        and (StrToInt(soNumeros(qryClientesCEP.Text)) <= StrToInt(soNumeros(qryCidadecep_final.Value))) then
    begin
      qryClientes.Post;
      if not altera then
      begin
        spClientesINS.Parameters.ParamByName('@NOME').Value := qryClientesNOME.Value;
        spClientesINS.Parameters.ParamByName('@CPF_CNPJ').Value := SoNumeros(qryClientesCPF_CNPJ.Value);
        spClientesINS.Parameters.ParamByName('@TELEFONE').Value := qryClientesTELEFONE.Value;
        spClientesINS.Parameters.ParamByName('@ENDERECO').Value := qryClientesENDERECO.Value;
        spClientesINS.Parameters.ParamByName('@BAIRRO').Value := qryClientesBAIRRO.Value;
        spClientesINS.Parameters.ParamByName('@COMPLEMENTO').Value := qryClientesCOMPLEMENTO.Value;
        spClientesINS.Parameters.ParamByName('@EMAIL').Value := qryClientesEMAIL.Value;
        spClientesINS.Parameters.ParamByName('@COD_CIDADE').Value := qryClientesCOD_CIDADE.Value;
        spClientesINS.Parameters.ParamByName('@CEP').Value := SoNumeros(qryClientesCEP.Value);

        spClientesINS.ExecProc;

        qryClientes.Edit;
        qryClientesCODIGO.Value := spClientesINS.Parameters.ParamByName('@CODIGO').Value;
        qryClientes.Post;

        MessageDlg('Cliente cadastrado com sucesso !', mtInformation, [mbOK], 0);
        pnlDados.Enabled := False;
        ativarControles;
      end
      else
      begin
        spClientesUPD.Parameters.ParamByName('@COD_CLIENTE').Value := qryClientesCODIGO.Value;
        spClientesUPD.Parameters.ParamByName('@NOME').Value := qryClientesNOME.Value;
        spClientesUPD.Parameters.ParamByName('@CPF_CNPJ').Value := SoNumeros(qryClientesCPF_CNPJ.Value);
        spClientesUPD.Parameters.ParamByName('@TELEFONE').Value := qryClientesTELEFONE.Value;
        spClientesUPD.Parameters.ParamByName('@ENDERECO').Value := qryClientesENDERECO.Value;
        spClientesUPD.Parameters.ParamByName('@BAIRRO').Value := qryClientesBAIRRO.Value;
        spClientesUPD.Parameters.ParamByName('@COMPLEMENTO').Value := qryClientesCOMPLEMENTO.Value;
        spClientesUPD.Parameters.ParamByName('@EMAIL').Value := qryClientesEMAIL.Value;
        spClientesUPD.Parameters.ParamByName('@COD_CIDADE').Value := qryClientesCOD_CIDADE.Value;
        spClientesUPD.Parameters.ParamByName('@CEP').Value := SoNumeros(qryClientesCEP.Value);

        spClientesUPD.ExecProc;

        MessageDlg('Cliente alterado com sucesso !', mtInformation, [mbOK], 0);

        altera := False;
        pnlDados.Enabled := False;
        ativarControles;
      end;
    end
    else
      MessageDlg('CEP informado inválido para a cidade escolhida !', mtWarning, [mbOK], 0);
  except
    on E: Exception do
    begin
      MessageDlg('Falha ao salvar cliente:' + #13 + E.Message, mtError, [mbOK], 0);
    end;

  end;

end;

procedure TfrmCadClientes.FormShow(Sender: TObject);
begin
  qryClientes.Close;
  qryClientes.CreateDataSet;

  qryCidade.Close;

end;

procedure TfrmCadClientes.btnBuscarClick(Sender: TObject);
begin
  frmBusClientes.cod_cliente := 0;
  frmBusClientes.ShowModal;

  if frmBusClientes.cod_cliente <> 0 then
  begin
    qryClientes.Close;
    qryClientes.CreateDataSet;
    with frmBusClientes do
    begin
      qryClientes.Insert;
      qryClientesCODIGO.Value := qryBusClientesCODIGO.Value;
      qryClientesNOME.Value := qryBusClientesNOME.Value;
      qryClientesCEP.Value := qryBusClientesCEP.Value;
      qryClientesEMAIL.Value := qryBusClientesEMAIL.Value;
      qryClientesCPF_CNPJ.Value := qryBusClientesCPF_CNPJ.Value;
      qryClientesTELEFONE.Value := qryBusClientesTELEFONE.Value;
      qryClientesENDERECO.Value := qryBusClientesENDERECO.Value;
      qryClientesCOMPLEMENTO.Value := qryBusClientesCOMPLEMENTO.Value;
      qryClientesBAIRRO.Value := qryBusClientesBAIRRO.Value;
      qryClientesCOD_CIDADE.Value := qryBusClientesCOD_CIDADE.Value;
      qryClientes.Post;

      edtCidadeExit(nil);
    end;

  end;
end;

procedure TfrmCadClientes.btnSairClick(Sender: TObject);
begin
  if qryClientes.State in [dsEdit, dsInsert] then
    qryClientes.Cancel;
  close;
end;

procedure TfrmCadClientes.edtCidadeExit(Sender: TObject);
begin
  if edtCidade.Text <> '' then
  begin
    with qryCidade do
    begin
      CLose;
      sql.Clear;
      SQL.Add('select codigo, nome, cep_inicial, cep_final from cidades');
      SQL.Add('where codigo <> 0');
      SQL.Add('and codigo = ' + edtCidade.Text);
      Open;
    end;

    if qryCidade.IsEmpty then
    begin
      edtCidade.Clear;
      MessageDlg('Cidade não encontrada!', mtWarning, [mbOK], 0);
      qryCidade.Close;
    end;
  end
  else
    qryCidade.Close;
end;

procedure TfrmCadClientes.btnBusCidadeClick(Sender: TObject);
begin
  frmBusCidades.cod_cidade := 0;
  frmBusCidades.ShowModal;

  if frmBusCidades.cod_cidade <> 0 then
  begin
    qryClientesCOD_CIDADE.Value := frmBusCidades.cod_cidade;
    edtCidadeExit(nil);
  end;
end;

procedure TfrmCadClientes.btnCancelaClick(Sender: TObject);
begin
  qryClientes.Cancel;
  pnlDados.Enabled := False;
  ativarControles;
  altera := False;
  edtCidadeExit(nil);
end;

procedure TfrmCadClientes.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    Key := #0;
  end;
end;

procedure TfrmCadClientes.edtCnpjCpfKeyPress(Sender: TObject;
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

procedure TfrmCadClientes.edtCepKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #08,#13]) then
    Key := #0;

  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    Key := #0;
  end;
end;

procedure TfrmCadClientes.edtCidadeKeyPress(Sender: TObject;
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

procedure TfrmCadClientes.ativarControles;
begin
  btnInserir.Enabled := True;
  btnAlterar.Enabled := True;
  btnApagar.Enabled := True;
  btnBuscar.Enabled := True;
end;

procedure TfrmCadClientes.desativarControles;
begin
  btnInserir.Enabled := False;
  btnAlterar.Enabled := False;
  btnApagar.Enabled := False;
  btnBuscar.Enabled := False;
end;

end.

