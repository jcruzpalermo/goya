object FListarProductos: TFListarProductos
  Left = 0
  Top = 0
  Caption = 'Sistema Goya - Lista de Productos con stock bajo'
  ClientHeight = 363
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
  object DBGProducto: TDBGrid
    Left = 22
    Top = 17
    Width = 665
    Height = 280
    TabStop = False
    DataSource = DataModule1.DSListarProductos
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IdProducto'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descripcion'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrecioU'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stock'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CantMin'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bandera'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Logico'
        Visible = True
      end>
  end
  object BBVolver: TBitBtn
    Left = 606
    Top = 315
    Width = 81
    Height = 38
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
    TabOrder = 1
    OnClick = BBVolverClick
  end
end
