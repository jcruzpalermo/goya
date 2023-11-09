object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 654
  Width = 1015
  object DbgooyaConnection: TFDConnection
    Params.Strings = (
      'Database=dbgoya'
      'User_Name=root'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 60
    Top = 51
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Windows 10\Documents\Embarcadero\Studio\Projects\Sistem' +
      'a Goya\conector\libmysql.dll'
    Left = 56
    Top = 3
  end
  object FDTEgreso: TFDTable
    Active = True
    IndexFieldNames = 'IdEgreso'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'dbgoya.tegreso'
    TableName = 'dbgoya.tegreso'
    Left = 192
    Top = 8
  end
  object DSEgreso: TDataSource
    DataSet = FDTEgreso
    Left = 248
    Top = 8
  end
  object QTegresoBuscar: TFDQuery
    MasterSource = DSEgreso
    DetailFields = 'Detalle;FechaEg;IdEgreso;Monto;Turno'
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM dbgoya.tegreso'
      'WHERE  (FechaEg = :fec AND Detalle LIKE :egr)')
    Left = 188
    Top = 61
    ParamData = <
      item
        Name = 'FEC'
        ParamType = ptInput
      end
      item
        Name = 'EGR'
        ParamType = ptInput
      end>
  end
  object DSEgresoBuscar: TDataSource
    DataSet = QTegresoBuscar
    Left = 246
    Top = 62
  end
  object FDTEmpleado: TFDTable
    Active = True
    IndexFieldNames = 'IdEmpleado'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'dbgoya.templeado'
    TableName = 'dbgoya.templeado'
    Left = 352
    Top = 8
  end
  object DSEmpleado: TDataSource
    DataSet = FDTEmpleado
    Left = 408
    Top = 8
  end
  object FDTFotocopiadora: TFDTable
    Active = True
    IndexFieldNames = 'IdFotoc'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'dbgoya.tfotocopiadora'
    TableName = 'dbgoya.tfotocopiadora'
    Left = 368
    Top = 136
  end
  object DSFotocopiadora: TDataSource
    DataSet = FDTFotocopiadora
    Left = 424
    Top = 136
  end
  object FDTEncargo: TFDTable
    Active = True
    IndexFieldNames = 'IdEncargo'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'tencargo'
    TableName = 'tencargo'
    Left = 544
    Top = 8
  end
  object DSEncargo: TDataSource
    DataSet = FDTEncargo
    Left = 608
    Top = 8
  end
  object QEmpleadosActivos: TFDQuery
    Active = True
    CachedUpdates = True
    MasterSource = DSEmpleado
    DetailFields = 'NombreEmp'
    Connection = DbgooyaConnection
    SQL.Strings = (
      'Select IdEmpleado, NombreEmp from templeado '
      'where EstadoEmp = '#39'Activo'#39)
    Left = 352
    Top = 56
  end
  object DSEmpleadosActivos: TDataSource
    DataSet = QEmpleadosActivos
    Left = 416
    Top = 56
  end
  object FDTCuenta: TFDTable
    Active = True
    IndexFieldNames = 'IdCuenta'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'dbgoya.tcuenta'
    TableName = 'dbgoya.tcuenta'
    Left = 32
    Top = 192
  end
  object DSCuenta: TDataSource
    DataSet = FDTCuenta
    Left = 88
    Top = 192
  end
  object FDTProducto: TFDTable
    Active = True
    IndexFieldNames = 'IdProducto'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'dbgoya.tproducto'
    TableName = 'dbgoya.tproducto'
    Left = 208
    Top = 160
  end
  object DSProducto: TDataSource
    DataSet = FDTProducto
    Left = 272
    Top = 160
  end
  object FDTVenta: TFDTable
    Active = True
    IndexFieldNames = 'IdVenta'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'dbgoya.tventa'
    TableName = 'dbgoya.tventa'
    Left = 168
    Top = 445
  end
  object DSVenta: TDataSource
    DataSet = FDTVenta
    Left = 224
    Top = 445
  end
  object FDTLineadeVenta: TFDTable
    Active = True
    IndexFieldNames = 'IdLdV'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'tlineadeventa'
    TableName = 'tlineadeventa'
    Left = 304
    Top = 440
  end
  object DSLineadeVta: TDataSource
    DataSet = FDTLineadeVenta
    Left = 368
    Top = 440
  end
  object FDQEncargosSinEntregar: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tencargo'
      
        'WHERE (estado = '#39'pendiente de impresi'#243'n'#39' OR estado = '#39'impreso'#39' O' +
        'R estado = '#39'caduco'#39') AND IdEncargo = :enc')
    Left = 544
    Top = 56
    ParamData = <
      item
        Name = 'ENC'
        ParamType = ptInput
      end>
  end
  object DSEncargosSinEntregar: TDataSource
    DataSet = FDQEncargosSinEntregar
    Left = 608
    Top = 56
  end
  object FDQEncargosSinEntregar2: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tencargo'
      
        'WHERE (estado = '#39'pendiente de impresi'#243'n'#39' OR estado = '#39'impreso'#39' O' +
        'R estado = '#39'caduco'#39') AND  Nombre LIKE :enc')
    Left = 544
    Top = 112
    ParamData = <
      item
        Name = 'ENC'
        ParamType = ptInput
      end>
  end
  object DSEncargosSinEntregar2: TDataSource
    DataSet = FDQEncargosSinEntregar2
    Left = 608
    Top = 112
  end
  object FDQCuentasActivas: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tcuenta'
      
        'WHERE (Estado = '#39'Habilitada'#39' OR Estado = '#39'Con Deuda'#39') AND Tipo =' +
        ' '#39'Persona'#39)
    Left = 32
    Top = 248
  end
  object DSCuentasActivas: TDataSource
    DataSet = FDQCuentasActivas
    Left = 88
    Top = 248
  end
  object FDQBuscarCuenta: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tcuenta'
      'WHERE Nombre  LIKE :cue')
    Left = 32
    Top = 344
    ParamData = <
      item
        Name = 'CUE'
        ParamType = ptInput
      end>
  end
  object DSBuscarCuenta: TDataSource
    DataSet = FDQBuscarCuenta
    Left = 88
    Top = 344
  end
  object FDQListarProductos: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tproducto'
      'WHERE Bandera = '#39'1'#39)
    Left = 208
    Top = 216
  end
  object DSListarProductos: TDataSource
    DataSet = FDQListarProductos
    Left = 272
    Top = 216
  end
  object FDQListarCuentas: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tcuenta'
      'WHERE Saldo < Limite')
    Left = 32
    Top = 400
  end
  object DSListarCuentas: TDataSource
    DataSet = FDQListarCuentas
    Left = 88
    Top = 400
  end
  object FDQFiltrarVenta: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tventa'
      'WHERE (Fecha = :fec AND Turno = :tur)')
    Left = 168
    Top = 501
    ParamData = <
      item
        Name = 'FEC'
        ParamType = ptInput
      end
      item
        Name = 'TUR'
        ParamType = ptInput
      end>
  end
  object DSFiltrarVenta: TDataSource
    DataSet = FDQFiltrarVenta
    Left = 224
    Top = 501
  end
  object DSLineadeVenta: TDataSource
    DataSet = FDQLineadeVenta
    Left = 368
    Top = 501
  end
  object FDTLogica: TFDTable
    Active = True
    IndexFieldNames = 'IdLog'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'tlogica'
    TableName = 'tlogica'
    Left = 584
    Top = 176
  end
  object DSLogica: TDataSource
    DataSet = FDTLogica
    Left = 640
    Top = 176
  end
  object FDQEfectivo: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tlogica'
      'WHERE IdLog = '#39'1'#39)
    Left = 584
    Top = 272
  end
  object DSEfectivo: TDataSource
    DataSet = FDQEfectivo
    Left = 640
    Top = 272
  end
  object FDQTarjetas: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tlogica'
      'WHERE IdLog = '#39'2'#39)
    Left = 584
    Top = 328
  end
  object DSTarjetas: TDataSource
    DataSet = FDQTarjetas
    Left = 640
    Top = 328
  end
  object FDQCuentasActivasEmpresas: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tcuenta'
      
        'WHERE (Estado = '#39'Habilitada'#39' OR Estado = '#39'Con Deuda'#39') AND Tipo =' +
        ' '#39'Empresa'#39
      '')
    Left = 32
    Top = 296
  end
  object DSCuentasActivasEmpresas: TDataSource
    DataSet = FDQCuentasActivasEmpresas
    Left = 88
    Top = 296
  end
  object FDQResmas: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tlogica'
      'WHERE IdLog = '#39'3'#39)
    Left = 704
    Top = 176
  end
  object DSResmas: TDataSource
    DataSet = FDQResmas
    Left = 760
    Top = 176
  end
  object FDQToner: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tlogica'
      'WHERE IdLog = '#39'4'#39)
    Left = 704
    Top = 224
  end
  object DSToner: TDataSource
    DataSet = FDQToner
    Left = 760
    Top = 224
  end
  object FDQFotocopActiva: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tfotocopiadora'
      '')
    Left = 368
    Top = 192
  end
  object DSFotocopActiva: TDataSource
    DataSet = FDQFotocopActiva
    Left = 424
    Top = 192
  end
  object FDTCaja: TFDTable
    Active = True
    IndexFieldNames = 'IdCaja'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'tcaja'
    TableName = 'tcaja'
    Left = 384
    Top = 272
  end
  object DSCaja: TDataSource
    DataSet = FDTCaja
    Left = 440
    Top = 272
  end
  object FDQEfInicial: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tlogica'
      'WHERE IdLog = '#39'5'#39)
    Left = 704
    Top = 274
  end
  object DSEfInicial: TDataSource
    DataSet = FDQEfInicial
    Left = 760
    Top = 274
  end
  object FDTDiaFotoCaja: TFDTable
    Active = True
    IndexFieldNames = 'IdDiaFotoc'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'dbgoya.tdiafotoc'
    TableName = 'dbgoya.tdiafotoc'
    Left = 560
    Top = 408
  end
  object DSFotoCaja: TDataSource
    DataSet = FDTDiaFotoCaja
    Left = 616
    Top = 408
  end
  object FDTDiaEmp: TFDTable
    Active = True
    IndexFieldNames = 'IdDiaEmp'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'tdiaemp'
    TableName = 'tdiaemp'
    Left = 752
    Top = 408
  end
  object DSDiaEmp: TDataSource
    DataSet = FDTDiaEmp
    Left = 808
    Top = 408
  end
  object FDQEmpleadodeldia: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT *'
      'FROM tdiaemp'
      'WHERE IdCaja = :emp')
    Left = 752
    Top = 456
    ParamData = <
      item
        Name = 'EMP'
        ParamType = ptInput
      end>
  end
  object DSQEmpleadodeldia: TDataSource
    DataSet = FDQEmpleadodeldia
    Left = 808
    Top = 456
  end
  object FDQHabilitar: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tlogica'
      'WHERE IdLog = '#39'6'#39)
    Left = 584
    Top = 224
  end
  object DSHabilitar: TDataSource
    DataSet = FDQHabilitar
    Left = 640
    Top = 224
  end
  object FDQListarEncargos: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tencargo'
      'WHERE estado = :enc')
    Left = 704
    Top = 8
    ParamData = <
      item
        Name = 'ENC'
        ParamType = ptInput
      end>
  end
  object DSListarEncargos: TDataSource
    DataSet = FDQListarEncargos
    Left = 768
    Top = 8
  end
  object FDQBuscarEncID: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tencargo'
      'WHERE IdEncargo = :enc')
    Left = 704
    Top = 56
    ParamData = <
      item
        Name = 'ENC'
        ParamType = ptInput
      end>
  end
  object DSBuscarEncID: TDataSource
    DataSet = FDQBuscarEncID
    Left = 768
    Top = 56
  end
  object FDQBuscarEncNom: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tencargo'
      'WHERE Nombre LIKE :enc')
    Left = 704
    Top = 112
    ParamData = <
      item
        Name = 'ENC'
        ParamType = ptInput
      end>
  end
  object DSBuscarEncNom: TDataSource
    DataSet = FDQBuscarEncNom
    Left = 768
    Top = 112
  end
  object FDQTurno: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tlogica'
      'WHERE IdLog = '#39'7'#39)
    Left = 704
    Top = 328
  end
  object DSTurno: TDataSource
    DataSet = FDQTurno
    Left = 760
    Top = 328
  end
  object FDTFechaTurno: TFDTable
    Active = True
    IndexFieldNames = 'Idfec'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'tfecha'
    TableName = 'tfecha'
    Left = 24
    Top = 112
  end
  object DSFechaTurno: TDataSource
    DataSet = FDTFechaTurno
    Left = 80
    Top = 112
  end
  object FDQCajadelDia: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tcaja'
      'WHERE Fecha = :fec')
    Left = 384
    Top = 328
    ParamData = <
      item
        Name = 'FEC'
        ParamType = ptInput
      end>
  end
  object DSCajadelDia: TDataSource
    DataSet = FDQCajadelDia
    Left = 440
    Top = 328
  end
  object FDQCajaInforme: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tcaja'
      'WHERE Fecha = :fec AND Turno = :tur')
    Left = 384
    Top = 384
    ParamData = <
      item
        Name = 'FEC'
        ParamType = ptInput
      end
      item
        Name = 'TUR'
        ParamType = ptInput
      end>
  end
  object DSCajaInforme: TDataSource
    DataSet = FDQCajaInforme
    Left = 440
    Top = 384
  end
  object FDQLineadeVenta: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tlineadeventa'
      'WHERE IdVenta LIKE :id')
    Left = 304
    Top = 501
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object FDQEgresoInforme: TFDQuery
    MasterSource = DSEgreso
    DetailFields = 'Detalle;FechaEg;IdEgreso;Monto;Turno'
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM dbgoya.tegreso'
      'WHERE  (FechaEg = :fec AND Turno = :tur)')
    Left = 188
    Top = 109
    ParamData = <
      item
        Name = 'FEC'
        ParamType = ptInput
      end
      item
        Name = 'TUR'
        ParamType = ptInput
      end>
  end
  object DSEgresoInforme: TDataSource
    DataSet = FDQEgresoInforme
    Left = 246
    Top = 110
  end
  object FDTPagarCuenta: TFDTable
    Active = True
    IndexFieldNames = 'idpagarcuenta'
    Connection = DbgooyaConnection
    UpdateOptions.UpdateTableName = 'tpagarcuenta'
    TableName = 'tpagarcuenta'
    Left = 32
    Top = 464
  end
  object DSPagarCuenta: TDataSource
    DataSet = FDTPagarCuenta
    Left = 88
    Top = 464
  end
  object FDQPagoCuentaInfo: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tpagarcuenta'
      'WHERE (fecha = :fec AND turno = :tur)')
    Left = 32
    Top = 509
    ParamData = <
      item
        Name = 'FEC'
        ParamType = ptInput
      end
      item
        Name = 'TUR'
        ParamType = ptInput
      end>
  end
  object DSPagoCuentaInfo: TDataSource
    DataSet = FDQPagoCuentaInfo
    Left = 88
    Top = 509
  end
  object FDQFotocajainforme: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tdiafotoc'
      'WHERE IdCaja = :emp')
    Left = 560
    Top = 464
    ParamData = <
      item
        Name = 'EMP'
        ParamType = ptInput
      end>
  end
  object DSFotocajainforme: TDataSource
    DataSet = FDQFotocajainforme
    Left = 616
    Top = 464
  end
  object FDQBusqParcProductos: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tproducto'
      'WHERE Descripcion LIKE :Parc')
    Left = 208
    Top = 272
    ParamData = <
      item
        Name = 'PARC'
        ParamType = ptInput
      end>
  end
  object DSBuscParcProductos: TDataSource
    DataSet = FDQBusqParcProductos
    Left = 272
    Top = 272
  end
  object FDQHistPagoCuenta: TFDQuery
    CachedUpdates = True
    Connection = DbgooyaConnection
    SQL.Strings = (
      'SELECT * '
      'FROM tpagarcuenta'
      'WHERE nombre LIKE :nom')
    Left = 32
    Top = 573
    ParamData = <
      item
        Name = 'NOM'
        ParamType = ptInput
      end>
  end
  object DSHistPagoCuenta: TDataSource
    DataSet = FDQHistPagoCuenta
    Left = 88
    Top = 573
  end
end
