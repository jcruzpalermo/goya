object FBuscarEgreso: TFBuscarEgreso
  Left = 0
  Top = 0
  Caption = 'Buscar Egreso'
  ClientHeight = 532
  ClientWidth = 521
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
    Left = 8
    Top = 8
    Width = 86
    Height = 13
    Caption = 'Seleccione Fecha:'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 27
    Width = 129
    Height = 21
    Date = 43252.921415243060000000
    Time = 43252.921415243060000000
    TabOrder = 0
  end
  object DBGEgresos: TDBGrid
    Left = 8
    Top = 58
    Width = 505
    Height = 415
    DataSource = DataModule1.DSEgresoBuscar
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IdEgreso'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FechaEg'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Turno'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Detalle'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Monto'
        Width = 50
        Visible = True
      end>
  end
  object BBBuscarEgr: TBitBtn
    Left = 432
    Top = 19
    Width = 81
    Height = 33
    Caption = '&Buscar'
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BBBuscarEgrClick
  end
  object CBDetalleEnc: TComboBox
    Left = 280
    Top = 25
    Width = 129
    Height = 21
    Style = csDropDownList
    DropDownCount = 5
    ItemIndex = 0
    TabOrder = 2
    Text = 'Caja Central'
    TextHint = 'Click para desplegar'
    Items.Strings = (
      'Caja Central'
      'Compra de Mercaderia'
      'Pago Empleados'
      'Pago Proveedor'
      'Otro')
  end
  object CHFiltrar: TCheckBox
    Left = 161
    Top = 27
    Width = 105
    Height = 17
    Caption = 'Filtrar por Detalle'
    TabOrder = 1
  end
  object BBVolver: TBitBtn
    Left = 400
    Top = 479
    Width = 113
    Height = 41
    Cancel = True
    Caption = '&Volver'
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
    NumGlyphs = 2
    TabOrder = 5
    OnClick = BBVolverClick
  end
end
