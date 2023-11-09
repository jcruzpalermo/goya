unit UFinalizarVenta;

interface

uses
  Winapi.Windows, Winapi.Messages, FireDAC.Stan.Param, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TFFinalizarVenta = class(TForm)
    LESubtotal: TLabeledEdit;
    LEDescuento: TLabeledEdit;
    LETotal: TLabeledEdit;
    BBLimpiar: TBitBtn;
    BBActualizar: TBitBtn;
    CBFormadePago: TComboBox;
    CHEncargo: TCheckBox;
    LESe�a: TLabeledEdit;
    DBESe�a: TDBEdit;
    DBGEncargo: TDBGrid;
    Panel1: TPanel;
    RBIdEncargo: TRadioButton;
    RBNombre: TRadioButton;
    EEncargo: TEdit;
    BBBuscarEncargo: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    DBGCuentas: TDBGrid;
    BBSe�a: TBitBtn;
    BBVolver: TBitBtn;
    BBFinalizar: TBitBtn;
    LENomClienteEmp: TLabeledEdit;
    CBTipoCuenta: TComboBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBIDSe�: TDBEdit;
    DBIdCue: TDBEdit;
    EJ: TEdit;
    DBESaldoCuenta: TDBEdit;
    DBECantProd: TDBEdit;
    procedure BBActualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RBIdEncargoClick(Sender: TObject);
    procedure RBNombreClick(Sender: TObject);
    procedure CBFormadePagoChange(Sender: TObject);
    procedure BBBuscarEncargoClick(Sender: TObject);
    procedure BBSe�aClick(Sender: TObject);
    procedure CHEncargoClick(Sender: TObject);
    procedure BBLimpiarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LEDescuentoChange(Sender: TObject);
    procedure LESe�aChange(Sender: TObject);
    procedure BBVolverClick(Sender: TObject);
    procedure CBTipoCuentaChange(Sender: TObject);
    procedure BBFinalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFinalizarVenta: TFFinalizarVenta;
  enc : string;
  aux: Double;
  j,e,cant: Integer;

implementation

{$R *.dfm}

uses UDataModule, UVentas, UPrincipal;

procedure TFFinalizarVenta.BBActualizarClick(Sender: TObject);
begin
  LESubtotal.Text :=  FVentasAgregar.LETotal.Text;
  if LEDescuento.Text = '' then
   begin
     LEDescuento.Text := '0';
   end;
    if LESe�a.Text = '' then
   begin
     LESe�a.Text := '0';
   end;
  aux := StrToFloat(LESubtotal.Text);
  aux := aux - StrToFloat(LEDescuento.Text);
  aux := aux - StrToFloat(LESe�a.Text);
  if aux <= 0 then
   begin
     LETotal.Text := '0';
   end
  else
   begin
     LETotal.Text := FloatToStr(aux);
   end;
end;

procedure TFFinalizarVenta.BBBuscarEncargoClick(Sender: TObject);
begin
 if EEncargo.Text = '' then
   begin
     ShowMessage('Por favor ingrese Nro de encargo o el nombre del cliente');
   end
 else
   begin
     if (RBIdEncargo.Checked = True) then
       begin
         DBGEncargo.DataSource := DataModule1.DSEncargosSinEntregar;
         DataModule1.FDQEncargosSinEntregar.Active := False;
         enc := EEncargo.Text;
         DataModule1.FDQEncargosSinEntregar.ParamByName('enc').AsString := EEncargo.text;
         DataModule1.FDQEncargosSinEntregar.Active := True;
         DBESe�a.DataSource := DataModule1.DSEncargosSinEntregar;
         DBIDSe�.DataSource := DataModule1.DSEncargosSinEntregar;
       end;
     if (RBNombre.Checked = True) then
       begin
         DBGEncargo.DataSource := DataModule1.DSEncargosSinEntregar2;
         DataModule1.FDQEncargosSinEntregar2.Active := False;
         enc :=  EEncargo.Text+  '%';
         DataModule1.FDQEncargosSinEntregar2.ParamByName('enc').AsString := EEncargo.text +  '%' ;
         DataModule1.FDQEncargosSinEntregar2.Active := True;
         DBESe�a.DataSource := DataModule1.DSEncargosSinEntregar2;
         DBIDSe�.DataSource := DataModule1.DSEncargosSinEntregar2;
       end;
   end;

end;

procedure TFFinalizarVenta.BBFinalizarClick(Sender: TObject);
begin
                   e := 0;
                   with DataModule1.FDTVenta do
                        begin
                           Open;
                           Append;
                           FieldByname('Fecha').AsDateTime := FPrincipal.DateTimePicker1.DateTime;
                           FieldByName('Turno').AsString    := FPrincipal.CBTurno.Text;
                           FieldByName('Descuento').AsFloat := StrToFloat(LEDescuento.Text);
                           FieldByName('Total').AsFloat   := StrToFloat (LETotal.Text);
                           FieldByName('FormadePago').AsString   := CBFormadePago.Text;
                           if (CHEncargo.Checked = True) then
                             begin
                               FieldByName('IdEncargo').AsInteger :=StrToInt(DBIDSe�.Text);
                               e := 1;
                             end;
                           if (CBFormadePago.ItemIndex = 3) then
                             begin
                               FieldByName('IdCuenta').AsInteger :=StrToInt(DBIdCue.Text);
                               if (CBTipoCuenta.ItemIndex = 1) then
                                 begin
                                   FieldByName('EmpleadoEmpresa').AsString := LENomClienteEmp.Text;
                                 end;
                             end;
                           Post;
                        end;
                  j := StrToInt(EJ.Text);

                   while j > 0 do
                      begin
                         DataModule1.FDTLineadeVenta.Open;  //crea la linea de venta y aqui falta bajar la cantidad de stock
                         DataModule1.FDTLineadeVenta.Append;
                         DataModule1.FDTLineadeVenta.FieldByName('IdVenta').AsInteger := StrToInt(DBEdit1.Text);
                         DataModule1.FDTLineadeVenta.FieldByName('IdProducto').AsLargeInt := StrToInt64(FVentasAgregar.SGLineadeVenta.Cells[0,j]);
                         DataModule1.FDTLineadeVenta.FieldByName('Descripcion').AsString := FVentasAgregar.SGLineadeVenta.Cells[1,j];
                         DataModule1.FDTLineadeVenta.FieldByName('Anillado').AsBoolean := StrToBool(FVentasAgregar.SGLineadeVenta.Cells[2,j]);
                         DataModule1.FDTLineadeVenta.FieldByName('PrecioA').AsFloat := StrToFloat(FVentasAgregar.SGLineadeVenta.Cells[3,j]);
                         DataModule1.FDTLineadeVenta.FieldByName('PrecioU').AsFloat := StrToFloat(FVentasAgregar.SGLineadeVenta.Cells[4,j]);
                         DataModule1.FDTLineadeVenta.FieldByName('Cantidad').AsInteger := StrToInt(FVentasAgregar.SGLineadeVenta.Cells[5,j]);
                         DataModule1.FDTLineadeVenta.FieldByName('Monto').AsFloat := StrToFloat(FVentasAgregar.SGLineadeVenta.Cells[6,j]);
                         DataModule1.FDTLineadeVenta.Post;
                         if StrToInt64(FVentasAgregar.SGLineadeVenta.Cells[0,j]) = 99 then
                           begin

                            end
                         else
                           begin
                             DataModule1.FDTProducto.Locate('IdProducto', StrToInt64(FVentasAgregar.SGLineadeVenta.Cells[0,j]));
                             if DataModule1.FDTProducto.FieldByName('Logico').AsBoolean = False then
                               begin
                                 cant := 0;
                                 cant := (StrToInt(DBECantProd.Text) - StrToInt(FVentasAgregar.SGLineadeVenta.Cells[5,j]));
                                 DataModule1.FDTProducto.Edit;
                                 DataModule1.FDTProducto.FieldByName('stock').AsInteger := cant;
                                 DataModule1.FDTProducto.Post;
                               end;
                           end;
                         j := j - 1;
                      end;

                  if (e = 1) then
                    begin
                      with DataModule1.FDTEncargo do
                         begin
                            Locate('IdEncargo', StrToInt(DBIDSe�.Text));
                            Edit;
                            FieldByName('estado').AsString := 'entregado';
                            Post;
                          end;
                    end;  //encargo entregado

                  if (CBFormadePago.ItemIndex = 3) then
                    begin
                      with DataModule1.FDTCuenta do
                         begin
                            Locate('IdCuenta', StrToInt(DBIdCue.Text));
                            Edit;
                            FieldByName('Saldo').AsFloat := (StrToFloat(DBESaldoCuenta.Text) - StrToFloat(LETotal.Text));
                            Post;
                          end; //descuenta saldo en cuenta correspondiente
                    end
                  else
                    begin
                       if (CBFormadePago.ItemIndex = 0) then
                         begin
                             with DataModule1.FDTLogica do
                                 begin
                                     Locate('IdLog', 1);
                                     Edit;
                                     FieldByName('MontoLog').AsFloat := (StrToFloat(FPrincipal.DBEEfectivoCaja.Text) + StrToFloat(LETotal.Text));
                                     Post;
                                 end;
                             DataModule1.FDQEfectivo.Active := False;
                             DataModule1.FDQEfectivo.Active := True;
                             // baja el monto en caja efectivo
                         end
                       else
                         begin
                             with DataModule1.FDTLogica do
                                 begin
                                     Locate('IdLog', 2);
                                     Edit;
                                     FieldByName('MontoLog').AsFloat := (StrToFloat(FPrincipal.DBTarjetas.Text) + StrToFloat(LETotal.Text));
                                     Post;
                                 end;
                             DataModule1.FDQTarjetas.Active := False;
                             DataModule1.FDQTarjetas.Active := True;
                             // baja el monto en caja tarjeta
                         end;
                    end;
                  ShowMessage('La venta se registr� correctamente');
                  FVentasAgregar.BBLimpiar.Click;
                  FVentasAgregar.BBLimpiarGrilla.Click;
                  DataModule1.FDQCuentasActivas.Active := False;
                  DataModule1.FDQCuentasActivas.Active := True;
                  BBVolver.Click;

end;

procedure TFFinalizarVenta.BBLimpiarClick(Sender: TObject);
begin
  LESe�a.Text := '0';
  EEncargo.Text := '';
  CHEncargo.Checked := False;
  RBIdEncargo.Visible := False;
  RBNombre.Visible := False;
  DBGEncargo.Visible := False;
  EEncargo.Visible := False;
  BBBuscarEncargo.Visible := False;
  BBSe�a.Visible := False;
  CBFormadePago.ItemIndex := 0;
  DBGCuentas.Visible := False;
end;

procedure TFFinalizarVenta.BBSe�aClick(Sender: TObject);
begin
  if StrToFloat(DBESe�a.Text) > 0 then
    begin
      LESe�a.Text := DBESe�a.Text;
    end
  else
    begin
      ShowMessage('El cliente no dej� se�a por este encargo');
      LESe�a.Text := '0';
    end;
end;

procedure TFFinalizarVenta.BBVolverClick(Sender: TObject);
begin
   CHEncargo.Checked := False;
   EEncargo.Text := '';
   DBGEncargo.DataSource := DataModule1.DSEncargo;
   CBFormadePago.ItemIndex := 0;
   CBTipoCuenta.ItemIndex := 0;
   LENomClienteEmp.Text := '';
   EJ.Text := '';
   LETotal.Text := '';
   LESubtotal.Text := '';
   LEDescuento.Text := '0';
   LESe�a.Text := '0';
   FFinalizarVenta.Close;
end;

procedure TFFinalizarVenta.CBFormadePagoChange(Sender: TObject);
begin
  if CBFormadePago.ItemIndex = 3 then
    begin
     DBGCuentas.Visible := True;
     CBTipoCuenta.Visible := True;
    end
  else
    begin
     DBGCuentas.Visible := False;
     CBTipoCuenta.Visible := False;
     CBTipoCuenta.ItemIndex := 0;
     LENomClienteEmp.Visible := False;
    end;
end;

procedure TFFinalizarVenta.CBTipoCuentaChange(Sender: TObject);
begin
    if (CBTipoCuenta.ItemIndex = 1) then
      begin
       LENomClienteEmp.Visible := True;
       DBGCuentas.DataSource := DataModule1.DSCuentasActivasEmpresas;
       DBIdCue.DataSource := DataModule1.DSCuentasActivasEmpresas;
      end
    else
      begin
       LENomClienteEmp.Visible := False;
       DBGCuentas.DataSource := DataModule1.DSCuentasActivas;
       DBIdCue.DataSource := DataModule1.DSCuentasActivas;
      end;
end;

procedure TFFinalizarVenta.CHEncargoClick(Sender: TObject);
begin
  if CHEncargo.Checked = True then
    begin
      LESe�a.Text := '0';
      RBIdEncargo.Visible := True;
      RBNombre.Visible := True;
      DBGEncargo.Visible := True;
      EEncargo.Visible := True;
      BBBuscarEncargo.Visible := True;
      BBSe�a.Visible := True;
    end
  else
    begin
      LESe�a.Text := '0';
      RBIdEncargo.Visible := False;
      RBNombre.Visible := False;
      DBGEncargo.Visible := False;
      EEncargo.Visible := False;
      BBBuscarEncargo.Visible := False;
      BBSe�a.Visible := False;
    end;
end;

procedure TFFinalizarVenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BBLimpiar.Click;
  FFinalizarVenta.Close;
end;

procedure TFFinalizarVenta.FormShow(Sender: TObject);
begin
    BBActualizar.Click;
end;

procedure TFFinalizarVenta.LEDescuentoChange(Sender: TObject);
begin
 BBActualizar.Click;
end;

procedure TFFinalizarVenta.LESe�aChange(Sender: TObject);
begin
  BBActualizar.Click;
end;

procedure TFFinalizarVenta.RBIdEncargoClick(Sender: TObject);
begin
  EEncargo.Text := '';
  EEncargo.NumbersOnly := True;
end;

procedure TFFinalizarVenta.RBNombreClick(Sender: TObject);
begin
  EEncargo.NumbersOnly := False;
  EEncargo.Text := '';
end;

end.
