object FBuscarProducto: TFBuscarProducto
  Left = 0
  Top = 0
  Caption = 'Sistema Goya - Buscar Producto'
  ClientHeight = 354
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LEProducto: TLabeledEdit
    Left = 24
    Top = 32
    Width = 345
    Height = 21
    EditLabel.Width = 43
    EditLabel.Height = 13
    EditLabel.Caption = 'Producto'
    TabOrder = 0
  end
  object BBAgregar: TBitBtn
    Left = 24
    Top = 304
    Width = 105
    Height = 33
    Caption = 'Agregar Id'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BBAgregarClick
  end
  object BBVolver: TBitBtn
    Left = 433
    Top = 304
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
    TabOrder = 2
    OnClick = BBVolverClick
  end
  object BBuscar: TButton
    Left = 383
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 3
    OnClick = BBuscarClick
  end
  object DBGProducto: TDBGrid
    Left = 24
    Top = 59
    Width = 514
    Height = 230
    TabStop = False
    DataSource = DataModule1.DSBuscParcProductos
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
        FieldName = 'IdProducto'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descripcion'
        Width = 270
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrecioU'
        Title.Caption = 'Precio Unit.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stock'
        Visible = True
      end>
  end
  object BVerTodo: TButton
    Left = 471
    Top = 28
    Width = 67
    Height = 25
    Caption = 'Ver Todos'
    TabOrder = 5
    OnClick = BVerTodoClick
  end
  object DBEIdProd: TDBEdit
    Left = 168
    Top = 335
    Width = 121
    Height = 21
    DataSource = DataModule1.DSBuscParcProductos
    TabOrder = 6
    Visible = False
  end
end
