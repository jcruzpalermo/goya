object FBuscarVenta: TFBuscarVenta
  Left = 0
  Top = 0
  Caption = 'Sistema Goya - Buscar Venta'
  ClientHeight = 448
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 25
    Top = 79
    Width = 86
    Height = 13
    Caption = 'Seleccione Fecha:'
  end
  object Label2: TLabel
    Left = 24
    Top = 130
    Width = 32
    Height = 13
    Caption = 'Venta:'
  end
  object Label3: TLabel
    Left = 24
    Top = 285
    Width = 75
    Height = 13
    Caption = 'Linea de Venta:'
    Visible = False
  end
  object Label4: TLabel
    Left = 177
    Top = 79
    Width = 85
    Height = 13
    Caption = 'Seleccione Turno:'
  end
  object DBGBuscarVenta: TDBGrid
    Left = 24
    Top = 149
    Width = 657
    Height = 122
    DataSource = DataModule1.DSVenta
    ReadOnly = True
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IdVenta'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PtodeVenta'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Turno'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descuento'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FormadePago'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IdCuenta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IdEncargo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EmpleadoEmpresa'
        Width = 100
        Visible = True
      end>
  end
  object DateTimePicker1: TDateTimePicker
    Left = 25
    Top = 98
    Width = 129
    Height = 21
    Date = 43252.921415243060000000
    Time = 43252.921415243060000000
    TabOrder = 4
  end
  object BBBuscarIdVenta: TBitBtn
    Left = 304
    Top = 16
    Width = 97
    Height = 33
    Caption = '&Buscar'
    Enabled = False
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BBBuscarIdVentaClick
  end
  object DBGLineadeVenta: TDBGrid
    Left = 24
    Top = 304
    Width = 657
    Height = 122
    DataSource = DataModule1.DSLineadeVenta
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = 'IdLdV'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IdVenta'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IdProducto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descripcion'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Anillado'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrecioA'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrecioU'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cantidad'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Monto'
        Width = 65
        Visible = True
      end>
  end
  object RBIdV: TRadioButton
    Left = 24
    Top = 24
    Width = 121
    Height = 17
    Caption = 'Buscar por Id Venta'
    TabOrder = 0
    OnClick = BCheckClick
  end
  object RBFiltrar: TRadioButton
    Left = 25
    Top = 56
    Width = 136
    Height = 17
    Caption = 'Filtrar por fecha y turno'
    TabOrder = 3
    OnClick = BCheckClick
  end
  object CBTurno: TComboBox
    Left = 177
    Top = 98
    Width = 145
    Height = 23
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 5
    Text = 'Ma'#241'ana'
    Items.Strings = (
      'Ma'#241'ana'
      'Tarde')
  end
  object EIdVenta: TEdit
    Left = 161
    Top = 22
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object DBELdV: TDBEdit
    Left = 575
    Top = 277
    Width = 57
    Height = 21
    DataField = 'IdVenta'
    DataSource = DataModule1.DSVenta
    ReadOnly = True
    TabOrder = 8
    Visible = False
    OnChange = DBELdVChange
  end
  object BBFiltrarVentas: TBitBtn
    Left = 336
    Top = 93
    Width = 97
    Height = 33
    Caption = '&Filtrar Ventas'
    Enabled = False
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 6
    OnClick = BBFiltrarVentasClick
  end
  object BCheck: TButton
    Left = 536
    Top = 273
    Width = 33
    Height = 25
    Caption = 'BCheck'
    TabOrder = 9
    Visible = False
    OnClick = BCheckClick
  end
  object BBVolver: TBitBtn
    Left = 576
    Top = 16
    Width = 105
    Height = 33
    Cancel = True
    Caption = '&Salir'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
      44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
      00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
      33833F333383F33300003333AA463362A433333333383F333833F33300003333
      6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
      33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
      6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
      000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
      333383333333F3330000333333322AAA4333333333333833333F333300003333
      333322A4333333333333338333F333330000333333344A433333333333333338
      3F333333000033333336A24333333333333333833F333333000033333336AA43
      33333333333333833F3333330000333333336663333333333333333888333333
      0000}
    ModalResult = 8
    NumGlyphs = 2
    TabOrder = 11
    OnClick = BBVolverClick
  end
end
