unit UInformeTurno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, FireDAC.Stan.Param,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TFInformeDia = class(TForm)
    DateTimePicker1: TDateTimePicker;
    CBTurno: TComboBox;
    BBSalir: TBitBtn;
    LTitulo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BDescargar: TButton;
    LOculto1: TLabel;
    BGenerar: TButton;
    LFecha: TLabel;
    LTurno: TLabel;
    LVentaFotoc: TLabel;
    LVentaLib: TLabel;
    LVentasTot: TLabel;
    LEgresos: TLabel;
    DBGVentas: TDBGrid;
    DBGCaja: TDBGrid;
    Label5: TLabel;
    Label6: TLabel;
    LVentaNR: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LVentaEf: TLabel;
    LPaCEf: TLabel;
    Label11: TLabel;
    LIngEf: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    LBalanceEf: TLabel;
    Panel1: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    LIngTarj: TLabel;
    LVentaTarj: TLabel;
    LPaCTarj: TLabel;
    Label17: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    LVentaEf1: TLabel;
    LVentaTarj1: TLabel;
    LVentaCuenta: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    LBalanceEf1: TLabel;
    LEfInDia: TLabel;
    LEfFinDia: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    LResmas: TLabel;
    LToners: TLabel;
    Label29: TLabel;
    SBFechaAct: TSpeedButton;
    Label31: TLabel;
    DBGEgresos: TDBGrid;
    Label30: TLabel;
    SGVentas99: TStringGrid;
    procedure BBSalirClick(Sender: TObject);
    procedure BDescargarClick(Sender: TObject);
    procedure BGenerarClick(Sender: TObject);
    procedure SBFechaActClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInformeDia: TFInformeDia;
  VLib,VFot,VSin,VTot, ETot,PaCEf,PaCTarj,VEf,VTarj,VCue,IngEf,IngTarj : Double;
  id, emp, c99: Integer;
  egr: string;
  fec: TDate;

implementation

{$R *.dfm}

uses UDataModule, UPrincipal;




procedure TFInformeDia.BBSalirClick(Sender: TObject);
begin
 // DateTimePicker1.Date := StrToDate(Label5.Caption);
  FInformeDia.Close;
end;

procedure TFInformeDia.BDescargarClick(Sender: TObject);
begin
 //aparecen
  LFecha.Caption := 'Fecha: ' + DateToStr(DateTimePicker1.Date);
  LFecha.Visible := True;
  LTurno.Caption := 'Turno: ' + CBTurno.Text;
  LTurno.Visible := True;
  LOculto1.Visible := True;
  LVentaFotoc.Visible := True;
  LVentaLib.Visible := True;
  LVentasTot.Visible := True;
  LEgresos.Visible := True;
 //desaparecen
  DateTimePicker1.Visible := False;
  CBTurno.Visible := False;
  BBSalir.Visible := False;
  BDescargar.Visible := False;
  BGenerar.Visible := False;
  LTitulo.Visible := False;
  SBFechaAct.Visible := False;
  // Diseño
  SGVentas99.Height := 304;
  //impresion
  FInformeDia.Print;
 //regresan
  DateTimePicker1.Visible := True;
  CBTurno.Visible := True;
  BBSalir.Visible := True;
  BDescargar.Visible := True;
  BGenerar.Visible := True;
  LTitulo.Visible := True;
  SBFechaAct.Visible := True;
 //vuelven a oculto
  LOculto1.Visible := False;
  LTurno.Visible := False;
  LFecha.Visible := False;
  LVentaFotoc.Visible := False;
  LVentaLib.Visible := False;
  LVentasTot.Visible := False;
  LEgresos.Visible := False;
  //Diseño
  SGVentas99.Height := 253;

end;

procedure TFInformeDia.BGenerarClick(Sender: TObject);
begin
  //filtrar cajas
  DataModule1.FDQCajaInforme.Active := False;
  DataModule1.FDQCajaInforme.ParamByName('fec').AsDate := DateTimePicker1.Date;
  DataModule1.FDQCajaInforme.ParamByName('tur').AsString := CBTurno.Text;
  DataModule1.FDQCajaInforme.Active := True;
  DataModule1.FDQCajaInforme.Last;
  //filtrar ventas
  DataModule1.FDQFiltrarVenta.Active := False;
  DataModule1.FDQFiltrarVenta.ParamByName('fec').AsDate := DateTimePicker1.Date;
  DataModule1.FDQFiltrarVenta.ParamByName('tur').AsString := CBTurno.Text;
  DataModule1.FDQFiltrarVenta.Active := True;
  //filtrar pagos de cuenta
  DataModule1.FDQPagoCuentaInfo.Active := False;
  DataModule1.FDQPagoCuentaInfo.ParamByName('fec').AsDate := DateTimePicker1.Date;
  DataModule1.FDQPagoCuentaInfo.ParamByName('tur').AsString := CBTurno.Text;
  DataModule1.FDQPagoCuentaInfo.Active := True;

  id := 0;
  c99 := 0;
  if DataModule1.FDQCajaInforme.IsEmpty then
      begin
        ShowMessage('No existe una caja para esa fecha y turno');
      end
  else
      begin
        emp := DataModule1.FDQCajaInforme.FieldByName('IdCaja').AsInteger;
        //colocar valores generales
        LEfInDia.Caption := '$ ' + FloatToStr(DataModule1.FDQCajaInforme.FieldByName('MontoEfIn').AsFloat);
        LEfFinDia.Caption := '$ ' + FloatToStr(DataModule1.FDQCajaInforme.FieldByName('MontoEfFi').AsFloat);
        //recorrer ventas y lineas de ventas para informe
        VLib := 0;
        VFot := 0;
        VSin := 0;
        VTot := 0;
        VEf := 0;
        VTarj := 0;
        VCue := 0;
        DataModule1.FDQFiltrarVenta.First;
        while not DataModule1.FDQFiltrarVenta.eof do
           begin
             // contabilizamos ventas por forma de pago
             if (DataModule1.FDQFiltrarVenta.FieldByName('FormadePago').AsString = 'Efectivo') then
                begin
                   VEf := VEf + DataModule1.FDQFiltrarVenta.FieldByName('Total').AsFloat;
                end
             else
                begin
                    if (DataModule1.FDQFiltrarVenta.FieldByName('FormadePago').AsString = 'A Cuenta') then
                       begin
                         VCue := VCue + DataModule1.FDQFiltrarVenta.FieldByName('Total').AsFloat;
                       end
                    else
                       begin
                         VTarj := VTarj + DataModule1.FDQFiltrarVenta.FieldByName('Total').AsFloat;
                       end;
                end;
             VTot := VTot + (DataModule1.FDQFiltrarVenta.FieldByName('Total').AsFloat);
             id := DataModule1.FDQFiltrarVenta.FieldByName('IdVenta').AsLargeInt;
             DataModule1.FDQLineadeVenta.Active := False;
             DataModule1.FDQLineadeVenta.ParamByName('id').AsInteger := id;
             DataModule1.FDQLineadeVenta.Active := True;
             while not DataModule1.FDQLineadeVenta.Eof do
                begin
                   if (DataModule1.FDQLineadeVenta.FieldByName('IdProducto').AsLargeInt < 98) then
                      begin
                        VFot := VFot + DataModule1.FDQLineadeVenta.FieldByName('Monto').AsFloat;
                      end
                   else
                      begin
                        if (DataModule1.FDQLineadeVenta.FieldByName('IdProducto').AsLargeInt > 100) then
                           begin
                             VLib := VLib + DataModule1.FDQLineadeVenta.FieldByName('Monto').AsFloat;
                           end
                        else
                          begin
                             VSin := VSin + DataModule1.FDQLineadeVenta.FieldByName('Monto').AsFloat;
                             c99 := c99 + 1;
                             if c99 > 15 then
                               begin
                                 SGVentas99.RowCount := c99;
                               end;
                             //hay q pasar a la grilla idventa, descripcion, precio, cantidad, monto
                               SGVentas99.Cells[0,c99] := IntToStr(DataModule1.FDQLineadeVenta.FieldByName('IdVenta').AsInteger);
                               SGVentas99.Cells[1,c99] := DataModule1.FDQLineadeVenta.FieldByName('Descripcion').AsString;
                               SGVentas99.Cells[2,c99] := FloatToStr(DataModule1.FDQLineadeVenta.FieldByName('PrecioU').AsFloat);
                               SGVentas99.Cells[3,c99] := IntToStr(DataModule1.FDQLineadeVenta.FieldByName('Cantidad').AsInteger);
                               SGVentas99.Cells[4,c99] := FloatToStr(DataModule1.FDQLineadeVenta.FieldByName('Monto').AsFloat);
                          end;
                      end;

                   DataModule1.FDQLineadeVenta.Next;
                end;
             DataModule1.FDQFiltrarVenta.Next;
           end;
        LVentasTot.Caption := '$ ' + FloatToStr(VTot);
        LVentaFotoc.Caption := '$ ' + FloatToStr(VFot);
        LVentaLib.Caption := '$ ' + FloatToStr(VLib);
        LVentaNR.Caption := '$ ' + FloatToStr(VSin);
        LVentaEf1.Caption := '$ ' + FloatToStr(VEf);
        LVentaEf.Caption := '$ ' + FloatToStr(VEf);
        LVentaTarj1.Caption := '$ ' + FloatToStr(VTarj);
        LVentaTarj.Caption := '$ ' + FloatToStr(VTarj);
        LVentaCuenta.Caption := '$ ' + FloatToStr(VCue);
        //filtrar egresos
        DataModule1.FDQEgresoInforme.Active := False;
        DataModule1.FDQEgresoInforme.ParamByName('fec').AsDate := DateTimePicker1.Date;
        DataModule1.FDQEgresoInforme.ParamByName('tur').AsString := CBTurno.Text;
        DataModule1.FDQEgresoInforme.Active := True;
        ETot := 0;
        //recorrer egresos y sumarlos
        while not DataModule1.FDQEgresoInforme.eof do
           begin
              ETot := ETot + DataModule1.FDQEgresoInforme.FieldByName('Monto').AsFloat;
              DataModule1.FDQEgresoInforme.Next;
           end;
        LEgresos.Caption :='-$ ' + FloatToStr(ETot);
        // recorrer pagos de cuenta y sumarlos
        PaCEf := 0;
        PaCTarj := 0;
        while not DataModule1.FDQPagoCuentaInfo.Eof do
           begin
             if (DataModule1.FDQPagoCuentaInfo.FieldByName('formadepago').AsString = 'Efectivo') then
                begin
                  PaCEf := PaCEf + DataModule1.FDQPagoCuentaInfo.FieldByName('monto').AsFloat;
                end
             else
                begin
                  PaCTarj := PaCTarj + DataModule1.FDQPagoCuentaInfo.FieldByName('monto').AsFloat;
                end;
             DataModule1.FDQPagoCuentaInfo.Next;
           end;
         LPaCEf.Caption := '$ ' + FloatToStr(PaCEf);
         LPaCTarj.Caption := '$ ' + FloatToStr(PaCTarj);
         IngEf := VEf + PaCEf;
         IngTarj := VTarj + PaCTarj;
         LIngEf.Caption := '$ ' + FloatToStr(IngEf);
         LIngTarj.Caption := '$ ' + FloatToStr(IngTarj);
         LBalanceEf.Caption := '$ ' + FloatToStr(IngEf - ETot);
         LBalanceEf1.Caption := '$ ' + FloatToStr(IngEf - ETot);
         LResmas.Caption := IntToStr(DataModule1.FDQCajaInforme.FieldByName('resmasusadas').AsInteger);
         LToners.Caption := IntToStr(DataModule1.FDQCajaInforme.FieldByName('tonersusados').AsInteger);
         //mostrar empleados de esa caja
         DataModule1.FDQEmpleadodeldia.Active := False;
         DataModule1.FDQEmpleadodeldia.ParamByName('emp').AsInteger := emp;
         DataModule1.FDQEmpleadodeldia.Active := True;
         //mostrar maquinas y contadores de esa caja
         DataModule1.FDQFotocajainforme.Active := False;
         DataModule1.FDQFotocajainforme.ParamByName('emp').AsInteger := emp;
         DataModule1.FDQFotocajainforme.Active := True;
         //grilla egresos del dia
         DBGEgresos.DataSource := DataModule1.DSEgresoBuscar;
         DataModule1.QTegresoBuscar.Active := False;
         fec := DateTimePicker1.Date;
         egr := '%';
         DataModule1.QTegresoBuscar.ParamByName('egr').AsString := '%';
         DataModule1.QTegresoBuscar.ParamByName('fec').AsDate := DateTimePicker1.Date;
         DataModule1.QTegresoBuscar.Active := True;
      end;

end;

procedure TFInformeDia.FormCreate(Sender: TObject);
begin
  SBFechaAct.Click;
  SGVentas99.Cells[0,0] := 'IdVenta';
  SGVentas99.Cells[1,0] := 'Descripcion';
  SGVentas99.Cells[2,0] := 'Precio';
  SGVentas99.Cells[3,0] := 'Cant.';
  SGVentas99.Cells[4,0] := 'Monto';
end;

procedure TFInformeDia.SBFechaActClick(Sender: TObject);
begin
  DateTimePicker1.Date := FPrincipal.DateTimePicker1.Date;
end;

end.
