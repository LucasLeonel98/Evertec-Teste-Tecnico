object frmBusCidades: TfrmBusCidades
  Left = 388
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busca de cidades'
  ClientHeight = 699
  ClientWidth = 671
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
    Width = 671
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 669
      Height = 55
      Align = alClient
      Alignment = taCenter
      Caption = 'Listagem de cidades'
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
    Top = 117
    Width = 671
    Height = 541
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
        FieldName = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = 'Cidade'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 417
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = 'Estado'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP_INICIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = 'Cep Inicial'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP_FINAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = 'Cep Final'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 85
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 671
    Height = 60
    Align = alTop
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 8
      Top = 3
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
        TabOrder = 0
      end
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
      TabOrder = 1
      OnClick = btnPesquisaClick
    end
    object btnSair: TBitBtn
      Left = 544
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
      TabOrder = 2
      OnClick = btnSairClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 658
    Width = 671
    Height = 41
    Align = alBottom
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 275
      Top = 8
      Width = 153
      Height = 25
      Caption = 'Imprimir listagem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object qrListagem: TRLReport
    Left = 800
    Top = 216
    Width = 794
    Height = 1123
    DataSource = dsCidades
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 244
        Top = 18
        Width = 229
        Height = 22
        Align = faCenter
        Caption = 'LISTAGEM DE CIDADES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 24
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Color = clActiveBorder
      ParentColor = False
      Transparent = False
      object RLLabel2: TRLLabel
        Left = 68
        Top = 4
        Width = 49
        Height = 16
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 452
        Top = 4
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
      object RLLabel4: TRLLabel
        Left = 500
        Top = 4
        Width = 73
        Height = 16
        Caption = 'CEP Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 604
        Top = 4
        Width = 66
        Height = 16
        Caption = 'CEP Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 3
        Top = 4
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
    end
    object bdCidades: TRLBand
      Left = 38
      Top = 121
      Width = 718
      Height = 22
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      BeforePrint = bdCidadesBeforePrint
      object RLDBText1: TRLDBText
        Left = 3
        Top = 2
        Width = 62
        Height = 16
        AutoSize = False
        DataField = 'CODIGO'
        DataSource = dsCidades
      end
      object RLDBText2: TRLDBText
        Left = 67
        Top = 2
        Width = 374
        Height = 16
        AutoSize = False
        DataField = 'NOME'
        DataSource = dsCidades
      end
      object RLDBText3: TRLDBText
        Left = 452
        Top = 3
        Width = 28
        Height = 16
        AutoSize = False
        DataField = 'ESTADO'
        DataSource = dsCidades
      end
      object RLDBText4: TRLDBText
        Left = 500
        Top = 3
        Width = 79
        Height = 16
        AutoSize = False
        DataField = 'CEP_INICIAL'
        DataSource = dsCidades
      end
      object RLDBText5: TRLDBText
        Left = 604
        Top = 3
        Width = 79
        Height = 16
        AutoSize = False
        DataField = 'CEP_FINAL'
        DataSource = dsCidades
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 143
      Width = 718
      Height = 26
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLDBResult1: TRLDBResult
        Left = 384
        Top = 6
        Width = 65
        Height = 16
        Alignment = taRightJustify
        DataField = 'CODIGO'
        DataSource = dsCidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riCount
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 213
        Top = 6
        Width = 164
        Height = 16
        Caption = 'Quantidade de cidades'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object qryBusCidades: TADOQuery
    Connection = dmConecta.connBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cidades')
    Left = 472
    Top = 152
    object qryBusCidadesNOME: TWideStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qryBusCidadesESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object qryBusCidadesCEP_INICIAL: TStringField
      FieldName = 'CEP_INICIAL'
      FixedChar = True
      Size = 8
    end
    object qryBusCidadesCEP_FINAL: TStringField
      FieldName = 'CEP_FINAL'
      FixedChar = True
      Size = 8
    end
    object qryBusCidadesCODIGO: TAutoIncField
      FieldName = 'CODIGO'
      ReadOnly = True
    end
  end
  object dsCidades: TDataSource
    DataSet = qryBusCidades
    Left = 472
    Top = 192
  end
end
