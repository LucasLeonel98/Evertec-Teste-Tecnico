unit UfrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls, ComCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Cidades1: TMenuItem;
    Relatrios1: TMenuItem;
    Clientes2: TMenuItem;
    Image1: TImage;
    Fechar1: TMenuItem;
    sbStatus: TStatusBar;
    procedure Cidades1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure configuraBase;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  UfrmCadCidades, UfrmCadClientes, UfrmRelClientes, UdmConecta, IniFiles;

{$R *.dfm}

procedure TfrmPrincipal.Cidades1Click(Sender: TObject);
begin
  frmCadCidades.showmodal;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  frmCadClientes.ShowModal;
end;

procedure TfrmPrincipal.Clientes2Click(Sender: TObject);
begin
  frmRelClientes.ShowModal;
end;

procedure TfrmPrincipal.configuraBase;
var
  ArquivoIni: TIniFile;
  CaminhoIni: string;
  StringConexao: string;
begin


  CaminhoIni := ExtractFilePath(ParamStr(0)) + 'Config.ini';


  if not FileExists(CaminhoIni) then
  begin
    ArquivoIni := TIniFile.Create(CaminhoIni);
    try
      
      ArquivoIni.WriteString('BANCO', 'String', '');
    finally
      ArquivoIni.Free;
    end;

    ShowMessage('Arquivo de configuração (Config.ini) não encontrado!' + #13 +
                'Por favor, configure a string de conexão.');
    Exit;
  end;

  ArquivoIni := TIniFile.Create(CaminhoIni);
  try

    StringConexao := ArquivoIni.ReadString('BANCO', 'String', '');

    if Trim(StringConexao) <> '' then
    begin
      try
        dmConecta.connBanco.Connected := False;
        dmConecta.connBanco.ConnectionString := StringConexao;
        dmConecta.connBanco.LoginPrompt := False;
        
        // Testa a conexão
        dmConecta.connBanco.Connected := True;
        sbStatus.Panels.Items[0].Text := 'String de conexão com banco ' + StringConexao;
      except
        on E: Exception do
        begin
          ShowMessage('Erro ao conectar ao banco de dados com a string fornecida: ' + E.Message);
        end;
      end;
    end
    else
    begin
      ShowMessage('A string de conexão no arquivo INI está vazia!');
    end;
  finally
    ArquivoIni.Free;
  end;
end;

procedure TfrmPrincipal.Fechar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  configuraBase;
end;

end.
