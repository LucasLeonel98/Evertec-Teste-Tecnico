object frmRelClientes: TfrmRelClientes
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Clientes'
  ClientHeight = 290
  ClientWidth = 388
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
    Width = 388
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 386
      Height = 55
      Align = alClient
      Alignment = taCenter
      Caption = 'Relat'#243'rio de clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 388
    Height = 233
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 70
      Height = 13
      Caption = 'C'#243'd. Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 128
      Top = 40
      Width = 257
      Height = 23
      DataField = 'nome'
      DataSource = dsCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 72
      Width = 70
      Height = 13
      Caption = 'C'#243'd. Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 128
      Top = 88
      Width = 257
      Height = 23
      DataField = 'nome'
      DataSource = dsCidade
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 120
      Width = 17
      Height = 13
      Caption = 'UF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodCliente: TEdit
      Left = 16
      Top = 40
      Width = 81
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = edtCodClienteExit
    end
    object btnBusClientes: TBitBtn
      Left = 101
      Top = 40
      Width = 21
      Height = 24
      Hint = 'Abrir busca de clientes'
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnBusClientesClick
    end
    object edtCodCidade: TEdit
      Left = 16
      Top = 88
      Width = 81
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExit = edtCodCidadeExit
    end
    object btnBusCidades: TBitBtn
      Left = 101
      Top = 88
      Width = 21
      Height = 24
      Hint = 'Abrir busca de cidades'
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnBusCidadesClick
    end
    object cbUF: TComboBox
      Left = 16
      Top = 136
      Width = 108
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'TODOS'
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO')
    end
    object btnVisualizar: TBitBtn
      Left = 16
      Top = 177
      Width = 75
      Height = 25
      Caption = 'Visualizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnVisualizarClick
    end
    object btnPDF: TBitBtn
      Left = 104
      Top = 177
      Width = 75
      Height = 25
      Caption = 'Gerar PDF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btnPDFClick
    end
    object btnGerarExcel: TBitBtn
      Left = 192
      Top = 177
      Width = 75
      Height = 25
      Caption = 'Gerar Excel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = btnGerarExcelClick
    end
    object btnSair: TBitBtn
      Left = 280
      Top = 177
      Width = 75
      Height = 25
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = btnSairClick
    end
  end
  object qrRelatorio: TRLReport
    Left = 800
    Top = 105
    Width = 794
    Height = 1123
    DataSource = dsRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ForcePrepare = False
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 99
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 223
        Top = 37
        Width = 271
        Height = 24
        Align = faCenter
        Caption = 'RELAT'#211'RIO DE CLIENTES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 640
        Top = 80
        Width = 75
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 137
      Width = 718
      Height = 23
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Color = clBtnShadow
      ParentColor = False
      Transparent = False
      object RLLabel2: TRLLabel
        Left = 1
        Top = 3
        Width = 49
        Height = 16
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 82
        Top = 3
        Width = 68
        Height = 16
        Caption = 'CPF/CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 169
        Top = 3
        Width = 42
        Height = 16
        Caption = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 443
        Top = 3
        Width = 52
        Height = 16
        Caption = 'CIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 635
        Top = 3
        Width = 21
        Height = 16
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 160
      Width = 718
      Height = 20
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      BeforePrint = RLBand3BeforePrint
      object RLDBText2: TRLDBText
        Left = 1
        Top = 1
        Width = 72
        Height = 16
        AutoSize = False
        DataField = 'CODIGO'
        DataSource = dsRelatorio
      end
      object RLDBText3: TRLDBText
        Left = 81
        Top = 1
        Width = 84
        Height = 16
        AutoSize = False
        DataField = 'CPF_CNPJ'
        DataSource = dsRelatorio
      end
      object RLDBText4: TRLDBText
        Left = 169
        Top = 1
        Width = 264
        Height = 16
        AutoSize = False
        DataField = 'NOME'
        DataSource = dsRelatorio
      end
      object RLDBText5: TRLDBText
        Left = 443
        Top = 1
        Width = 190
        Height = 16
        AutoSize = False
        DataField = 'cidade'
        DataSource = dsRelatorio
      end
      object RLDBText6: TRLDBText
        Left = 635
        Top = 1
        Width = 78
        Height = 16
        AutoSize = False
        DataField = 'ESTADO'
        DataSource = dsRelatorio
      end
    end
    object RLBand7: TRLBand
      Left = 38
      Top = 180
      Width = 718
      Height = 24
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Color = clAppWorkSpace
      ParentColor = False
      Transparent = False
      object RLDBResult2: TRLDBResult
        Left = 645
        Top = 0
        Width = 68
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'CODIGO'
        DataSource = dsRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riCount
        ParentFont = False
        Transparent = False
      end
      object RLLabel10: TRLLabel
        Left = 382
        Top = 0
        Width = 135
        Height = 16
        Caption = 'TOTAL DE CLIENTES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBText9: TRLDBText
        Left = 515
        Top = 0
        Width = 127
        Height = 16
        AutoSize = False
        DataField = 'cidade'
        DataSource = dsRelatorio
        Transparent = False
      end
    end
  end
  object qryCidade: TADOQuery
    Connection = dmConecta.connBanco
    Parameters = <>
    SQL.Strings = (
      'select codigo, nome from cidades'
      'where 1=0')
    Left = 369
    Top = 134
    object qryCidadecodigo: TAutoIncField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object qryCidadenome: TWideStringField
      FieldName = 'nome'
      Size = 100
    end
  end
  object dsCidade: TDataSource
    DataSet = qryCidade
    Left = 409
    Top = 134
  end
  object qryCliente: TADOQuery
    Connection = dmConecta.connBanco
    Parameters = <>
    SQL.Strings = (
      'select codigo, nome from clientes'
      'where 1=0')
    Left = 369
    Top = 94
    object AutoIncField1: TAutoIncField
      FieldName = 'codigo'
      ReadOnly = True
    end
    object WideStringField1: TWideStringField
      FieldName = 'nome'
      Size = 100
    end
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 409
    Top = 94
  end
  object qryRelatorio: TADOQuery
    Connection = dmConecta.connBanco
    Parameters = <>
    SQL.Strings = (
      'select clientes.CODIGO, '
      #9'clientes.CPF_CNPJ, '
      #9'clientes.NOME,'
      #9'CIDADES.nome cidade,'
      #9'cidades.ESTADO'
      'from clientes'
      'left join cidades on cidades.codigo = clientes.COD_CIDADE'
      'where 1=0'
      
        'group by CIDADES.nome,cidades.ESTADO,  clientes.NOME, clientes.C' +
        'PF_CNPJ,clientes.CODIGO'
      '')
    Left = 281
    Top = 198
    object qryRelatorioCODIGO: TAutoIncField
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object qryRelatorioCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 14
    end
    object qryRelatorioNOME: TWideStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qryRelatoriocidade: TWideStringField
      FieldName = 'cidade'
      Size = 100
    end
    object qryRelatorioESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
  end
  object dsRelatorio: TDataSource
    DataSet = qryRelatorio
    Left = 321
    Top = 198
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 432
    Top = 185
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 432
    Top = 225
  end
end
