object FHistoricoCuenta: TFHistoricoCuenta
  Left = 0
  Top = 0
  Caption = 'Sistema Goya - Historial de Cobro de Cuentas'
  ClientHeight = 438
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    758
    438)
  PixelsPerInch = 96
  TextHeight = 13
  object DTPFecha: TDateTimePicker
    Left = 161
    Top = 392
    Width = 120
    Height = 26
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = []
    Date = 43361.000000000000000000
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    MinDate = 43244.947393703710000000
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 0
  end
  object CBCuenta: TCheckBox
    Left = 41
    Top = 40
    Width = 112
    Height = 17
    Caption = 'Filtrar por Cuenta'
    TabOrder = 1
  end
  object LECuenta: TLabeledEdit
    Left = 169
    Top = 38
    Width = 304
    Height = 21
    EditLabel.Width = 35
    EditLabel.Height = 13
    EditLabel.Caption = 'Cuenta'
    TabOrder = 2
  end
  object BVerTodo: TButton
    Left = 678
    Top = 49
    Width = 67
    Height = 25
    Caption = 'Ver Todos'
    TabOrder = 3
    OnClick = BVerTodoClick
  end
  object BBVolver: TBitBtn
    Left = 640
    Top = 385
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
    TabOrder = 4
    OnClick = BBVolverClick
  end
  object DBGHistorico: TDBGrid
    Left = 41
    Top = 80
    Width = 704
    Height = 289
    DataSource = DataModule1.DSPagarCuenta
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'turno'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nombre'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'formadepago'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'monto'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'saldo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'detalle'
        Width = 270
        Visible = True
      end>
  end
  object BBFiltrar: TBitBtn
    Left = 520
    Top = 29
    Width = 145
    Height = 45
    Caption = '&Filtrar'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
    TabOrder = 6
    OnClick = BBFiltrarClick
  end
  object BVerFecha: TButton
    Left = 41
    Top = 392
    Width = 113
    Height = 26
    Caption = 'Ubicar en Fecha'
    TabOrder = 7
    OnClick = BVerFechaClick
  end
end
