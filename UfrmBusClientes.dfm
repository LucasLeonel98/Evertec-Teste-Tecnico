object frmBusClientes: TfrmBusClientes
  Left = 192
  Top = 125
  Width = 1346
  Height = 675
  Caption = 'Busca de clientes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1330
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 1328
      Height = 55
      Align = alClient
      Alignment = taCenter
      Caption = 'Listagem de clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 119
    Width = 1330
    Height = 517
    Align = alClient
    DataSource = dsCidades
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF_CNPJ'
        Title.Caption = 'CPF/CNPJ'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 272
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Title.Caption = 'Bairro'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPLEMENTO'
        Title.Caption = 'Complemento'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Title.Caption = 'Telefone'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Title.Caption = 'E-mail'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 1330
    Height = 62
    Align = alTop
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 8
      Top = 5
      Width = 353
      Height = 53
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 7
        Width = 51
        Height = 14
        Caption = 'Pesquisa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtPesquisa: TEdit
        Left = 8
        Top = 22
        Width = 323
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
    object rgFiltros: TRadioGroup
      Left = 626
      Top = 5
      Width = 513
      Height = 53
      Caption = 'Filtrar por'
      Columns = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'Endere'#231'o'
        'CPF/CNPJ')
      ParentFont = False
      TabOrder = 1
    end
    object btnPesquisa: TBitBtn
      Left = 376
      Top = 24
      Width = 105
      Height = 25
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnPesquisaClick
    end
    object btnSair: TBitBtn
      Left = 1184
      Top = 24
      Width = 105
      Height = 25
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnSairClick
    end
  end
  object qryBusClientes: TADOQuery
    Connection = dmConecta.connBanco
    Parameters = <>
    SQL.Strings = (
      'select * from clientes')
    Left = 632
    Top = 160
    object qryBusClientesCODIGO: TAutoIncField
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object qryBusClientesNOME: TWideStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qryBusClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 14
    end
    object qryBusClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 11
    end
    object qryBusClientesENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 255
    end
    object qryBusClientesBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object qryBusClientesCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Size = 50
    end
    object qryBusClientesEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object qryBusClientesCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object qryBusClientesCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
  end
  object dsCidades: TDataSource
    DataSet = qryBusClientes
    Left = 632
    Top = 200
  end
end
