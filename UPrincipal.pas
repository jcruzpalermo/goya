unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, FireDAC.Stan.Param, System.UITypes, System.SysUtils, System.DateUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Imaging.GIFImg, Vcl.Imaging.jpeg, Vcl.Mask, Vcl.DBCtrls;

type
  TFPrincipal = class(TForm)
    BBSalir: TBitBtn;
    IEgreso: TImage;
    LEgreso: TLabel;
    DateTimePicker1: TDateTimePicker;
    CBTurno: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    LBLEmpleado: TLabel;
    IEmpleados: TImage;
    LBLFotocop: TLabel;
    IFotocop: TImage;
    LBLEncargos: TLabel;
    IEncargos: TImage;
    LBLCuenta: TLabel;
    ICuenta: TImage;
    LBLProducto: TLabel;
    IProducto: TImage;
    LBLVenta: TLabel;
    IVenta: TImage;
    LBLActCuenta: TLabel;
    IActualizarCuentas: TImage;
    BBCerrarCaja: TBitBtn;
    DBEEfectivoCaja: TDBEdit;
    Label3: TLabel;
    DBTarjetas: TDBEdit;
    Label4: TLabel;
    SBResma: TSpeedButton;
    Label5: TLabel;
    SBToner: TSpeedButton;
    Label6: TLabel;
    DBEResmas: TDBEdit;
    DBEToner: TDBEdit;
    BBReporte: TBitBtn;
    DBEEfinicial: TDBEdit;
    LBLFechaYe: TLabel;
    BAcFecha: TButton;
    DBEHabilitar: TDBEdit;
    DBETurno: TDBEdit;
    BHabilitar: TButton;
    BFechaTurno: TButton;
    DBEFecha: TDBEdit;
    procedure BBSalirClick(Sender: TObject);
    procedure AbrirEgresos(Sender: TObject);
    procedure LBLEmpleadoClick(Sender: TObject);
    procedure LBLFotocopClick(Sender: TObject);
    procedure LBLEncargosClick(Sender: TObject);
    procedure LBLCuentaClick(Sender: TObject);
    procedure LBLProductoClick(Sender: TObject);
    procedure LBLVentaClick(Sender: TObject);
    procedure LBLActCuentaClick(Sender: TObject);
    procedure SBResmaClick(Sender: TObject);
    procedure SBTonerClick(Sender: TObject);
    procedure BBCerrarCajaClick(Sender: TObject);
    procedure BBReporteClick(Sender: TObject);
    procedure BAcFechaClick(Sender: TObject);
    procedure BHabilitarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BFechaTurnoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;
  fech: TDate;

implementation

{$R *.dfm}

uses UEgresos, UDataModule, UEmpleado, UFotocopiadora, UEncargos, UCuentas,
  UProductos, UOpcVenta, UActualizarCuenta, UCerrarTurno, UInformeTurno;

procedure TFPrincipal.BAcFechaClick(Sender: TObject);
begin
  DataModule1.FDTCaja.Last;
  if (DateTimePicker1.Date <= DataModule1.FDTCaja.FieldByName('Fecha').AsDateTime) then
    begin
      ShowMessage('La fecha seleccionada es anterior o igual a la ultima caja registrada, por favor elija una fecha posterior');
    end
  else
    begin
        with DataModule1.FDTFechaTurno do
          begin
            Locate('Idfec','1');
            Edit;
            FieldByName('FechaSist').AsDateTime := DateTimePicker1.Date;
            FieldByName('TurnoSist').AsInteger := CBTurno.ItemIndex;
            Post;
            Active := False;
            Active := True;
          end;
        with DataModule1.FDTLogica do
               begin
                 Locate('IdLog', 6);
                 Edit;
                 FieldByName('MontoLog').AsFloat := 0;
                 Post;
               end;
                 DataModule1.FDQHabilitar.Active := False;
                 DataModule1.FDQHabilitar.Active := True;
                 BFechaTurno.Click;
                 BHabilitar.Click;
    end;
end;

procedure TFPrincipal.BBCerrarCajaClick(Sender: TObject);
begin
   buttonSelected := messagedlg('�Desea cerrar el turno? Una vez cerrado el turno ya no podr� volver a abrirse.',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTCaja do
               begin
                 Open;
                 Append;
                 FieldByName('Fecha').AsDateTime := FPrincipal.DateTimePicker1.DateTime;
                 FieldByName('Turno').AsString := CBTurno.Text;
                 FieldByName('resmasusadas').AsInteger := StrToInt(DBEResmas.Text);
                 FieldByName('tonersusados').AsInteger := StrToInt(DBEToner.Text);
                 FieldByName('MontoEfIn').AsFloat := StrToFloat(DBEEfinicial.Text);
                 FieldByName('MontoEfFi').AsFloat := StrToFloat(DBEEfectivoCaja.Text);
                 FieldByName('MontoTarj').AsFloat := StrToFloat(DBTarjetas.Text);
                 Post;//realizar alta
               end;
        with DataModule1.FDTLogica do
               begin
                 Locate('IdLog', 3);
                 Edit;
                 FieldByName('MontoLog').AsFloat := 0;
                 Post;
               end;
                 DataModule1.FDQResmas.Active := False;
                 DataModule1.FDQResmas.Active := True;
        with DataModule1.FDTLogica do
               begin
                 Locate('IdLog', 4);
                 Edit;
                 FieldByName('MontoLog').AsFloat := 0;
                 Post;
               end;
                 DataModule1.FDQToner.Active := False;
                 DataModule1.FDQToner.Active := True;
         with DataModule1.FDTLogica do
               begin
                 Locate('IdLog', 5);
                 Edit;
                 FieldByName('MontoLog').AsFloat := StrToFloat(DBEEfectivoCaja.Text);
                 Post;
               end;
         with DataModule1.FDTLogica do
               begin
                 Locate('IdLog', 2);
                 Edit;
                 FieldByName('MontoLog').AsFloat := 0;
                 Post;
               end;
                 DataModule1.FDQEfInicial.Active := False;
                 DataModule1.FDQEfInicial.Active := True;
                 DataModule1.FDQTarjetas.Active := False;
                 DataModule1.FDQTarjetas.Active := True;
       FCerrarTurno.ShowModal;
      end;
    if buttonSelected = mrCancel then
      begin

      end;
end;

procedure TFPrincipal.BBReporteClick(Sender: TObject);
begin
 FInformeDia.ShowModal;
 FInformeDia.SBFechaAct.Click;


 { buttonSelected := messagedlg('Recuerde que al cerrar cada turno se genera su reporte automaticamente, �seguro desea generar manualmente un reporte de una fecha pasada?',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        ShowMessage('Generar reporte.');
      end;
    if buttonSelected = mrCancel then
      begin

      end;  }
end;

procedure TFPrincipal.BBSalirClick(Sender: TObject);
begin
  FPrincipal.Close;
end;

procedure TFPrincipal.BFechaTurnoClick(Sender: TObject);
begin
      DateTimePicker1.Date := StrToDate(DBEFecha.Text);
      DateTimePicker1.MinDate := StrToDate(DBEFecha.Text);
      CBTurno.ItemIndex := StrToInt(DBETurno.Text);
end;

procedure TFPrincipal.BHabilitarClick(Sender: TObject);
begin
   with DataModule1 Do
     begin
      FDQTurno.Active := False;
      FDQTurno.Active := True;
      FDQHabilitar.Active := False;
      FDQHabilitar.Active := True;
     end;
   if (DBEHabilitar.Text = FloatToStr(1)) then
     begin
      IEgreso.Enabled := False;
      IEmpleados.Enabled := False;
      IFotocop.Enabled := False;
      IEncargos.Enabled := False;
      ICuenta.Enabled := False;
      IProducto.Enabled := False;
      IVenta.Enabled := False;
      IActualizarCuentas.Enabled := False;
      LBLEmpleado.Enabled := False;
      LBLFotocop.Enabled := False;
      LBLEncargos.Enabled := False;
      LBLCuenta.Enabled := False;
      LBLProducto.Enabled := False;
      LBLVenta.Enabled := False;
      LBLActCuenta.Enabled := False;
      LEgreso.Enabled := False;
      SBResma.Enabled := False;
      SBToner.Enabled := False;
      BBCerrarCaja.Enabled := False;
      LBLFechaYe.Visible := True;
      BAcFecha.Visible := True;
      DateTimePicker1.Enabled := True;
      CBTurno.ItemIndex := 0;
      CBTurno.Enabled := True;
     end;
    //DateTimePicker1.MinDate := Tomorrow; esto sirve para pasar el dia minimo????
   if (DBEHabilitar.Text = FloatToStr(0)) then
     begin
      IEgreso.Enabled := True;
      IEmpleados.Enabled := True;
      IFotocop.Enabled := True;
      IEncargos.Enabled := True;
      ICuenta.Enabled := True;
      IProducto.Enabled := True;
      IVenta.Enabled := True;
      IActualizarCuentas.Enabled := True;
      LBLEmpleado.Enabled := True;
      LBLFotocop.Enabled := True;
      LBLEncargos.Enabled := True;
      LBLCuenta.Enabled := True;
      LBLProducto.Enabled := True;
      LBLVenta.Enabled := True;
      LBLActCuenta.Enabled := True;
      LEgreso.Enabled := True;
      SBResma.Enabled := True;
      SBToner.Enabled := True;
      BBCerrarCaja.Enabled := True;
      LBLFechaYe.Visible := False;
      BAcFecha.Visible := False;
      DateTimePicker1.Enabled := False;
      CBTurno.Enabled := False;
     end;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  BHabilitar.Click;
  BFechaTurno.Click;
end;

procedure TFPrincipal.LBLFotocopClick(Sender: TObject);
begin
   FFotocopiadora.ShowModal;
end;

procedure TFPrincipal.LBLProductoClick(Sender: TObject);
begin
 FProducto.ShowModal;
end;

procedure TFPrincipal.LBLVentaClick(Sender: TObject);
begin
  FOpcVentas.Show;
end;

procedure TFPrincipal.SBResmaClick(Sender: TObject);
begin
  buttonSelected := messagedlg('�Desea agregar una resma al conteo diario?',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTLogica do
                    begin
                      Locate('IdLog', 3);
                      Edit;
                      FieldByName('MontoLog').AsFloat := (StrToFloat(FPrincipal.DBEResmas.Text) + 1);
                      Post;
                    end;
                 DataModule1.FDQResmas.Active := False;
                 DataModule1.FDQResmas.Active := True;
        ShowMessage('Registrado con �xito.');
      end;
    if buttonSelected = mrCancel then
      begin

      end;
end;

procedure TFPrincipal.SBTonerClick(Sender: TObject);
begin
  buttonSelected := messagedlg('�Desea agregar un Toner al conteo diario?',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTLogica do
                    begin
                      Locate('IdLog', 4);
                      Edit;
                      FieldByName('MontoLog').AsFloat := (StrToFloat(FPrincipal.DBEToner.Text) + 1);
                      Post;
                    end;
                 DataModule1.FDQToner.Active := False;
                 DataModule1.FDQToner.Active := True;
        ShowMessage('Registrado con �xito.');
      end;
    if buttonSelected = mrCancel then
      begin

      end;
end;

procedure TFPrincipal.LBLActCuentaClick(Sender: TObject);
begin
  FActualizarCuenta.ShowModal;
end;

procedure TFPrincipal.LBLCuentaClick(Sender: TObject);
begin
 FCuentas.ShowModal;
end;

procedure TFPrincipal.LBLEmpleadoClick(Sender: TObject);
begin
   FEmpleado.ShowModal;
end;

procedure TFPrincipal.LBLEncargosClick(Sender: TObject);
begin
   DataModule1.QEmpleadosActivos.Refresh;
   FEncargo.ShowModal;
end;

procedure TFPrincipal.AbrirEgresos(Sender: TObject);
begin
  FEgreso.ShowModal;
end;

end.
