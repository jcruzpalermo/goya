program ProjectGoya;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UEgresos in 'UEgresos.pas' {FEgreso},
  UDataModule in 'UDataModule.pas' {DataModule1: TDataModule},
  UBuscarEgreso in 'UBuscarEgreso.pas' {FBuscarEgreso},
  UEmpleado in 'UEmpleado.pas' {FEmpleado},
  UFotocopiadora in 'UFotocopiadora.pas' {FFotocopiadora},
  UEncargos in 'UEncargos.pas' {FEncargo},
  UCuentas in 'UCuentas.pas' {FCuentas},
  UProductos in 'UProductos.pas' {FProducto},
  UVentas in 'UVentas.pas' {FVentasAgregar},
  UOpcVenta in 'UOpcVenta.pas' {FOpcVentas},
  UFinalizarVenta in 'UFinalizarVenta.pas' {FFinalizarVenta},
  UActualizarCuenta in 'UActualizarCuenta.pas' {FActualizarCuenta},
  UListarProductos in 'UListarProductos.pas' {FListarProductos},
  UListarCuentas in 'UListarCuentas.pas' {FListarCuentas},
  UBuscarVenta in 'UBuscarVenta.pas' {FBuscarVenta},
  UCerrarTurno in 'UCerrarTurno.pas' {FCerrarTurno},
  Udiaempleado in 'Udiaempleado.pas' {FDiaEmpleado},
  UBuscarEncargos in 'UBuscarEncargos.pas' {FBuscarEncargos},
  UInformeTurno in 'UInformeTurno.pas' {FInformeDia},
  UBuscarProducto in 'UBuscarProducto.pas' {FBuscarProducto},
  UHistorialCuenta in 'UHistorialCuenta.pas' {FHistoricoCuenta};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFEgreso, FEgreso);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFBuscarEgreso, FBuscarEgreso);
  Application.CreateForm(TFEmpleado, FEmpleado);
  Application.CreateForm(TFFotocopiadora, FFotocopiadora);
  Application.CreateForm(TFEncargo, FEncargo);
  Application.CreateForm(TFCuentas, FCuentas);
  Application.CreateForm(TFProducto, FProducto);
  Application.CreateForm(TFVentasAgregar, FVentasAgregar);
  Application.CreateForm(TFOpcVentas, FOpcVentas);
  Application.CreateForm(TFFinalizarVenta, FFinalizarVenta);
  Application.CreateForm(TFActualizarCuenta, FActualizarCuenta);
  Application.CreateForm(TFListarProductos, FListarProductos);
  Application.CreateForm(TFListarCuentas, FListarCuentas);
  Application.CreateForm(TFBuscarVenta, FBuscarVenta);
  Application.CreateForm(TFCerrarTurno, FCerrarTurno);
  Application.CreateForm(TFDiaEmpleado, FDiaEmpleado);
  Application.CreateForm(TFBuscarEncargos, FBuscarEncargos);
  Application.CreateForm(TFInformeDia, FInformeDia);
  Application.CreateForm(TFBuscarProducto, FBuscarProducto);
  Application.CreateForm(TFHistoricoCuenta, FHistoricoCuenta);
  Application.Run;
end.
