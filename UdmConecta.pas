unit UdmConecta;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmConecta = class(TDataModule)
    connBanco: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConecta: TdmConecta;

implementation

{$R *.dfm}

end.
