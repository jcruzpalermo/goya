object FInformeDia: TFInformeDia
  Left = 0
  Top = 0
  Caption = 'Sistema Goya - Informe del Turno'
  ClientHeight = 739
  ClientWidth = 762
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LTitulo: TLabel
    Left = 52
    Top = 22
    Width = 276
    Height = 13
    Caption = 'Seleccione fecha y turno para los cuales hacer el informe:'
  end
  object Label1: TLabel
    Left = 302
    Top = 105
    Width = 111
    Height = 13
    Caption = 'Ventas por Fotocopias:'
  end
  object Label2: TLabel
    Left = 302
    Top = 124
    Width = 94
    Height = 13
    Caption = 'Ventas por Libreria:'
  end
  object Label3: TLabel
    Left = 32
    Top = 169
    Width = 90
    Height = 16
    Caption = 'Ventas Totales:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LOculto1: TLabel
    Left = 52
    Top = 7
    Width = 106
    Height = 13
    Caption = 'Informe Sistema Goya'
    Visible = False
  end
  object LFecha: TLabel
    Left = 52
    Top = 48
    Width = 34
    Height = 13
    Caption = 'LFecha'
    Visible = False
  end
  object LTurno: TLabel
    Left = 204
    Top = 48
    Width = 34
    Height = 13
    Caption = 'LFecha'
    Visible = False
  end
  object LVentaFotoc: TLabel
    Left = 442
    Top = 105
    Width = 60
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LVentaFotoc'
    ParentBiDiMode = False
  end
  object LVentaLib: TLabel
    Left = 456
    Top = 124
    Width = 46
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LVentaLib'
    ParentBiDiMode = False
  end
  object LVentasTot: TLabel
    Left = 195
    Top = 169
    Width = 64
    Height = 16
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LVentasTot'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
  end
  object LEgresos: TLabel
    Left = 208
    Top = 287
    Width = 68
    Height = 18
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LEgresos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 141
    Top = 48
    Width = 56
    Height = 13
    Caption = '26/09/2018'
    Visible = False
  end
  object Label6: TLabel
    Left = 302
    Top = 143
    Width = 101
    Height = 13
    Caption = 'Ventas sin catalogar:'
  end
  object LVentaNR: TLabel
    Left = 455
    Top = 143
    Width = 47
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LVentaNR'
    ParentBiDiMode = False
  end
  object Label7: TLabel
    Left = 32
    Top = 361
    Width = 75
    Height = 13
    Caption = 'Balance del d'#237'a:'
  end
  object Label9: TLabel
    Left = 51
    Top = 224
    Width = 94
    Height = 13
    Caption = 'Ventas en Efectivo:'
  end
  object Label10: TLabel
    Left = 51
    Top = 243
    Width = 136
    Height = 13
    Caption = 'Pago de cuenta en Efectivo:'
  end
  object LVentaEf: TLabel
    Left = 233
    Top = 224
    Width = 43
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LVentaEf'
    ParentBiDiMode = False
  end
  object LPaCEf: TLabel
    Left = 242
    Top = 243
    Width = 34
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LPaCEf'
    ParentBiDiMode = False
  end
  object Label11: TLabel
    Left = 32
    Top = 263
    Width = 158
    Height = 18
    Caption = 'Ingresos en Efectivo:'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LIngEf: TLabel
    Left = 227
    Top = 263
    Width = 49
    Height = 18
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LIngEf'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label12: TLabel
    Left = 32
    Top = 287
    Width = 151
    Height = 18
    Caption = 'Egresos en Efectivo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 342
    Width = 150
    Height = 13
    Caption = 'Efectivo en caja al iniciar el d'#237'a:'
  end
  object Label13: TLabel
    Left = 32
    Top = 315
    Width = 151
    Height = 18
    Caption = 'Balance de Efectivo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LBalanceEf: TLabel
    Left = 193
    Top = 315
    Width = 83
    Height = 18
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LBalanceEf'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label14: TLabel
    Left = 297
    Top = 224
    Width = 95
    Height = 13
    Caption = 'Ventas en Tarjetas:'
  end
  object Label15: TLabel
    Left = 297
    Top = 243
    Width = 142
    Height = 13
    Caption = 'Pago de cuentas en Tarjetas:'
  end
  object Label16: TLabel
    Left = 297
    Top = 263
    Width = 159
    Height = 18
    Caption = 'Ingresos en Tarjetas:'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clOlive
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LIngTarj: TLabel
    Left = 478
    Top = 263
    Width = 49
    Height = 18
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LIngEf'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clOlive
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object LVentaTarj: TLabel
    Left = 478
    Top = 224
    Width = 52
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LVentaTarj'
    ParentBiDiMode = False
  end
  object LPaCTarj: TLabel
    Left = 478
    Top = 243
    Width = 43
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LPaCTarj'
    ParentBiDiMode = False
  end
  object Label17: TLabel
    Left = 12
    Top = 399
    Width = 268
    Height = 13
    BiDiMode = bdRightToLeft
    Caption = 
      '----------------------------------------------------------------' +
      '---'
    ParentBiDiMode = False
  end
  object Label8: TLabel
    Left = 8
    Top = 184
    Width = 568
    Height = 13
    Caption = 
      '----------------------------------------------------------------' +
      '----------------------------------------------------------------' +
      '-----------------------------------------'
  end
  object Label18: TLabel
    Left = 51
    Top = 105
    Width = 94
    Height = 13
    Caption = 'Ventas en Efectivo:'
  end
  object Label19: TLabel
    Left = 51
    Top = 124
    Width = 95
    Height = 13
    Caption = 'Ventas en Tarjetas:'
  end
  object Label20: TLabel
    Left = 52
    Top = 143
    Width = 84
    Height = 13
    Caption = 'Ventas a Cuenta:'
  end
  object LVentaEf1: TLabel
    Left = 210
    Top = 105
    Width = 49
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LVentaEf1'
    ParentBiDiMode = False
  end
  object LVentaTarj1: TLabel
    Left = 201
    Top = 124
    Width = 58
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LVentaTarj1'
    ParentBiDiMode = False
  end
  object LVentaCuenta: TLabel
    Left = 191
    Top = 143
    Width = 68
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LVentaCuenta'
    ParentBiDiMode = False
  end
  object Label21: TLabel
    Left = 24
    Top = 80
    Width = 183
    Height = 13
    Caption = 'VENTAS REGISTRADAS EN EL DIA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label22: TLabel
    Left = 305
    Top = 79
    Width = 182
    Height = 13
    Caption = 'VENTAS POR TIPO DE PRODUCTO:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label23: TLabel
    Left = 24
    Top = 203
    Width = 203
    Height = 13
    Caption = 'MOVIMIENTO DE EFECTIVO EN EL DIA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label24: TLabel
    Left = 303
    Top = 203
    Width = 215
    Height = 13
    Caption = 'VENTAS EN CR'#201'DITO/D'#201'BITO EN EL DIA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label25: TLabel
    Left = 32
    Top = 380
    Width = 160
    Height = 13
    Caption = 'Efectivo en caja al finalizar el d'#237'a:'
  end
  object LBalanceEf1: TLabel
    Left = 218
    Top = 361
    Width = 58
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LBalanceEf1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
  end
  object LEfInDia: TLabel
    Left = 236
    Top = 342
    Width = 40
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LEfInDia'
    ParentBiDiMode = False
  end
  object LEfFinDia: TLabel
    Left = 232
    Top = 380
    Width = 44
    Height = 13
    Alignment = taRightJustify
    BiDiMode = bdLeftToRight
    Caption = 'LEfFinDia'
    ParentBiDiMode = False
  end
  object Label26: TLabel
    Left = 305
    Top = 296
    Width = 121
    Height = 13
    Caption = 'Resmas usadas en el d'#237'a:'
  end
  object Label27: TLabel
    Left = 489
    Top = 296
    Width = 117
    Height = 13
    Caption = 'Toners usados en el d'#237'a:'
  end
  object Label28: TLabel
    Left = 567
    Top = 86
    Width = 104
    Height = 13
    Caption = 'Empleados del turno: '
  end
  object LResmas: TLabel
    Left = 432
    Top = 296
    Width = 42
    Height = 13
    Caption = 'LResmas'
  end
  object LToners: TLabel
    Left = 612
    Top = 296
    Width = 38
    Height = 13
    Caption = 'LToners'
  end
  object Label29: TLabel
    Left = 294
    Top = 287
    Width = 232
    Height = 13
    BiDiMode = bdRightToLeft
    Caption = '----------------------------------------------------------'
    ParentBiDiMode = False
  end
  object SBFechaAct: TSpeedButton
    Left = 13
    Top = 41
    Width = 33
    Height = 33
    Flat = True
    Glyph.Data = {
      7E0D0000424D7E0D000000000000360000002800000021000000220000000100
      180000000000480D0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFF8F8F8FEFEFE
      FFFFFFFFFFFFFFFFFFF8F8F8FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8FFFFFFFFFF
      FFFFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFF8F8F8FEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFF00FEFEFEFFFFFFFFFFFFFFFFFFF5F5F5FEFEFEFFFFFFFFFFFFFFFF
      FFF5F5F5FFFFFFFFFFFF9B9B9B000000030404000000000000373737FEFEFEF5
      F5F5FFFFFFFFFFFFFFFFFFF5F5F5F5F5F5FFFFFFFFFFFFFFFFFFF5F5F5FEFEFE
      FFFFFFFFFFFFFFFFFF00FEFEFEF8F8F8FFFFFFFFFFFFFFFFFFF4F4F4FEFEFEFF
      FFFFFFFFFFF8F8F80404040000000000001A1A1A8383838D8D8D505050000000
      0000000101012F2F2FFFFFFFFFFFFFFFFFFFF5F5F5FEFEFEFFFFFFFFFFFFFFFF
      FFF8F8F8FFFFFFFFFFFFFFFFFF00FFFFFFF8F8F8F5F5F5FFFFFFFFFFFFFFFFFF
      F4F4F4FEFEFE000000000000E8E8E8F4F4F4FFFFFFFFFFFFFFFFFFFEFEFEF4F4
      F4FFFFFFFFFFFFFFFFFF030404030404636363FFFFFFFFFFFFF4F4F4FEFEFEFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFF5F5F5F5F5F5FFFF
      FFFFFFFFBCBCBC040404232323FFFFFFFFFFFFFFFFFFF4F4F4FFFFFFFFFFFFFF
      FFFFFEFEFEF4F4F4FFFFFFFFFFFFFFFFFFF5F5F5030404000000FFFFFFFFFFFF
      F4F4F4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFF5
      F5F5F5F5F5777777000000F8F8F8F4F4F4FEFEFEFFFFFFFFFFFFFFFFFFF4F4F4
      8D8D8D6A6A6AC6C6C6FEFEFEF4F4F4FFFFFFFFFFFFFFFFFFF5F5F50304040000
      00FFFFFFFFFFFFF4F4F4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF00FEFEFEFFFFFF
      FFFFFFFFFFFFF5F5F5010101FFFFFFFFFFFFFFFFFFF4F4F4FFFFFF0000000000
      00000000040404FFFFFF000000000000010101838383FFFFFFFFFFFFFFFFFFF5
      F5F5030404151515FFFFFFFFFFFFF5F5F5FEFEFEFFFFFFFFFFFFFFFFFF00FEFE
      FEF8F8F8FFFFFFFFFFFF000000DEDEDEFEFEFEFFFFFFFFFFFFE8E8E804040400
      0000000000000000000000F4F4F4000000000000000000010101030404FFFFFF
      FFFFFFFFFFFFF5F5F5010101E8E8E8FFFFFFFFFFFFF8F8F8FFFFFFFFFFFFFFFF
      FF00FFFFFFFEFEFEF4F4F40C0C0C000000FFFFFFF5F5F5F5F5F5040404000000
      0000000404040101010000000000000000000404040000000000000000000101
      01040404FFFFFFFFFFFFFFFFFFF5F5F5030404FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFEFEFE040404FFFFFFFFFFFFFFFFFF8D8D8D0304
      0400000000000000000004040401010100000000000000000004040400000000
      0000000000010101040404FFFFFFFFFFFFFFFFFF0304041A1A1AFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF777777010101F4F4F4FFFFFFFFFFFF00
      0000030404030404000000000000000000040404010101000000000000000000
      0404040000000000000000000101012F2F2FFFFFFFFFFFFFFFFFFF030404F5F5
      F5FFFFFFFFFFFFFFFFFFFFFFFF00FEFEFEFFFFFF0000009B9B9BFEFEFEF5F5F5
      4B4B4B0000000000000304040101010000000000000000000404040000000000
      00000000000000040404000000000000000000010101F4F4F4FFFFFFFFFFFF00
      0000F5F5F5FBFBFBFFFFFFFFFFFFFFFFFF00FFFFFFF8F8F8000000FFFFFFFFFF
      FFF5F5F503040400000000000000000004040401010100000000000000000004
      0404000000000000000000000000040404000000000000000000F5F5F5F5F5F5
      FFFFFF000000636363FBFBFBFFFFFFFFFFFFFFFFFF00FFFFFFFEFEFE040404FF
      FFFFFFFFFFFFFFFF030404030404000000000000000000040404010101000000
      0000000000000404040000000000000000000101010404040000000000002323
      23F5F5F5F5F5F5434343000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      010101F4F4F4FFFFFFFFFFFFA5A5A5ACACAC0304040000000000000000000404
      04010101000000B3B3B3B3B3B3ACACACB3B3B3B3B3B3B3B3B3010101ACACACB3
      B3B3000000FFFFFFF5F5F59B9B9B000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFF000000FFFFFFF4F4F4FFFFFF37373737373701010104040400000000
      0000000000030404030404FFFFFF373737373737373737373737373737000000
      373737373737000000FFFFFFFFFFFF949494030404FFFFFFFFFFFFFFFFFFFFFF
      FF00FEFEFEFFFFFF000000FFFFFFFFFFFFF4F4F4000000000000000000010101
      030404000000000000000000030404FEFEFE0000000000000000000404040000
      00000000000000000000373737FFFFFFFFFFFF3E3E3E010101F8F8F8FFFFFFFF
      FFFFFFFFFF00FFFFFFF8F8F8000000FFFFFFFFFFFFFEFEFE0404040000000000
      00000000030404030404000000000000000000F4F4F401010100000000000000
      0000040404000000000000000000FFFFFFF4F4F4FFFFFF000000636363FEFEFE
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF040404A5A5A5FFFFFFFFFFFF73737304
      0404000000000000000000030404030404000000000000FFFFFF040404010101
      000000000000000000040404000000000000FFFFFFFEFEFEF4F4F4000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF777777040404FFFFFFFFFFFF
      FFFFFF010101040404000000000000000000030404030404000000FFFFFF0000
      000404040101010000000000000000000404046A6A6AFFFFFFFFFFFFFEFEFE04
      0404FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF000000F4F4
      F4FFFFFFFFFFFFC8C8C801010104040400000000000000000003040403040400
      0000000000000000040404010101000000000000000000F4F4F4FFFFFFFFFFFF
      000000151515F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF00FEFEFEFFFFFFFFFFFF0C
      0C0C000000F4F4F4FFFFFFFFFFFF232323010101030404000000000000000000
      030404010101000000000000000000040404000000000000FFFFFFFFFFFFF4F4
      F4FFFFFF000000FFFFFFFEFEFEF8F8F8FFFFFFFFFFFFFFFFFF00FFFFFFF8F8F8
      FFFFFFFFFFFF000000FEFEFEF4F4F4FFFFFFFFFFFF6363630304040304040000
      00000000000000F4F4F4010101000000000000000000040404FFFFFFFFFFFFFF
      FFFFFFFFFF0404044B4B4BFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFF4F4F4FEFEFEFFFFFF000000FFFFFFF4F4F4FFFFFFFFFFFFFFFFFF0E
      0E0E040404000000000000FFFFFF030404030404000000EBEBEBFFFFFFF4F4F4
      FEFEFEFFFFFF0000000C0C0CF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFF4F4F4FEFEFE737373000000FBFBFBF4F4F4000000
      FFFFFFFFFFFFFEFEFEF4F4F4FFFFFFE8E8E8FFFFFFF5F5F5F5F5F5FFFFFFFFFF
      FFFFFFFFF4F4F4010101000000FFFFFFFFFFFFF4F4F4FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FFFFFFB3B3B30000002A2A
      2A040404FFFFFFFFFFFFFFFFFFFEFEFEF4F4F4FFFFFFFFFFFFFFFFFFF5F5F5F5
      F5F5FFFFFFFFFFFF000000040404FEFEFEFFFFFFFFFFFFFFFFFFF5F5F5FFFFFF
      FFFFFFFFFFFFFFFFFF00FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFF4F4F4FFFFFFFF
      FFFF0000000000002F2F2FFFFFFFFFFFFFFFFFFFFEFEFEF5F5F5FFFFFFFFFFFF
      FFFFFFF5F5F5010101000000373737FFFFFFF4F4F4FFFFFFFFFFFFFFFFFFFFFF
      FFF8F8F8FFFFFFFFFFFFFFFFFF00FFFFFFF8F8F8FEFEFEFFFFFFFFFFFFFFFFFF
      F4F4F4FFFFFF000000000000010101F4F4F4FFFFFFFFFFFFFFFFFFF5F5F5F5F5
      F5FFFFFFFFFFFFFFFFFF0C0C0CFEFEFEFFFFFFFFFFFFFFFFFFF4F4F4FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFF5F5F5FEFEFEFFFF
      FFFFFFFFFFFFFFACACAC040404FFFFFFFFFFFFFEFEFEF5F5F5FFFFFFFFFFFFFF
      FFFFF8F8F8F8F8F8FFFFFFFFFFFFFFFFFFF5F5F5FEFEFEFFFFFFFFFFFFFFFFFF
      F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFB
      FBFBFEFEFEFFFFFFFFFFFFFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFFEFEFEFBFBFB
      FFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFBFBFBFEFEFEFFFF
      FFFFFFFFFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00}
    OnClick = SBFechaActClick
  end
  object Label31: TLabel
    Left = 8
    Top = 409
    Width = 50
    Height = 13
    Caption = 'EGRESOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label30: TLabel
    Left = 444
    Top = 409
    Width = 209
    Height = 13
    Caption = 'VENTAS SIN CATALOGAR (CODIGO 99)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGVentas: TDBGrid
    Left = 294
    Top = 315
    Width = 356
    Height = 87
    DataSource = DataModule1.DSFotocajainforme
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Maquina'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ContadorIn'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ContadorFi'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Toner'
        Width = 40
        Visible = True
      end>
  end
  object DBGCaja: TDBGrid
    Left = 543
    Top = 105
    Width = 179
    Height = 84
    DataSource = DataModule1.DSQEmpleadodeldia
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Empleado'
        Width = 160
        Visible = True
      end>
  end
  object DateTimePicker1: TDateTimePicker
    Left = 52
    Top = 42
    Width = 145
    Height = 26
    Date = 43248.000000000000000000
    Time = 0.806313576387765400
    TabOrder = 0
  end
  object CBTurno: TComboBox
    Left = 204
    Top = 42
    Width = 138
    Height = 26
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 1
    Text = 'Ma'#241'ana'
    Items.Strings = (
      'Ma'#241'ana'
      'Tarde')
  end
  object BBSalir: TBitBtn
    Left = 616
    Top = 40
    Width = 106
    Height = 33
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
    ModalResult = 5
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BBSalirClick
  end
  object BGenerar: TButton
    Left = 349
    Top = 39
    Width = 106
    Height = 33
    Caption = 'Generar Informe'
    TabOrder = 4
    OnClick = BGenerarClick
  end
  object BDescargar: TButton
    Left = 500
    Top = 40
    Width = 106
    Height = 33
    Caption = 'Descargar Informe'
    TabOrder = 3
    OnClick = BDescargarClick
  end
  object Panel1: TPanel
    Left = 286
    Top = 203
    Width = 2
    Height = 190
    TabOrder = 7
  end
  object Panel2: TPanel
    Left = 287
    Top = 75
    Width = 1
    Height = 98
    TabOrder = 8
  end
  object DBGEgresos: TDBGrid
    Left = 8
    Top = 428
    Width = 384
    Height = 304
    ReadOnly = True
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FechaEg'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Turno'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Detalle'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Monto'
        Width = 40
        Visible = True
      end>
  end
  object SGVentas99: TStringGrid
    Left = 410
    Top = 428
    Width = 328
    Height = 304
    DefaultRowHeight = 15
    FixedCols = 0
    RowCount = 15
    TabOrder = 10
    ColWidths = (
      46
      160
      42
      31
      41)
  end
end
