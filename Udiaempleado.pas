unit Udiaempleado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, FireDAC.Stan.Param, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls;

type
  TFDiaEmpleado = class(TForm)
    DBGEmpAct: TDBGrid;
    StaticText1: TStaticText;
    DBEEmpAct: TDBEdit;
    SBAgregar: TSpeedButton;
    SBBorrar: TSpeedButton;
    DBEIdUltCaja: TDBEdit;
    DBGDiaEmp: TDBGrid;
    DBEIdEmpleadodeldia: TDBEdit;
    BBFinalizar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure SBAgregarClick(Sender: TObject);
    procedure SBBorrarClick(Sender: TObject);
    procedure DBEIdEmpleadodeldiaChange(Sender: TObject);
    procedure BBFinalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDiaEmpleado: TFDiaEmpleado;
  emp : Integer;

implementation

{$R *.dfm}

uses UDataModule, UPrincipal;

procedure TFDiaEmpleado.BBFinalizarClick(Sender: TObject);
begin

 FDiaEmpleado.Close;


end;

procedure TFDiaEmpleado.DBEIdEmpleadodeldiaChange(Sender: TObject);
begin
 if (DBEIdEmpleadodeldia.Text = '') then
   begin
     SBBorrar.Enabled := False;
   end
 else
   begin
     SBBorrar.Enabled := True;
   end;

end;

procedure TFDiaEmpleado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FPrincipal.CBTurno.ItemIndex = 0 then
     begin
       with DataModule1.FDTFechaTurno do
       begin
         Locate('Idfec','1');
         Edit;
         FieldByName('TurnoSist').AsInteger := 1;
         Post;
         Active := False;
         Active := True;
       end;
       FPrincipal.BFechaTurno.Click;
       FDiaEmpleado.Close;
       ShowMessage('La caja se cerr� con exito y el turno del sistema fue modificado a "Turno Tarde"');
     end
   else
     begin
       FPrincipal.DateTimePicker1.Date := FPrincipal.DateTimePicker1.Date + 1;
       FPrincipal.DateTimePicker1.MinDate := FPrincipal.DateTimePicker1.Date;
       with DataModule1.FDTFechaTurno do
        begin
         Locate('Idfec','1');
         Edit;
         FieldByName('FechaSist').AsDateTime := FPrincipal.DateTimePicker1.Date;
         FieldByName('TurnoSist').AsInteger := 0;
         Post;
         Active := False;
         Active := True;
        end;
       FPrincipal.BFechaTurno.Click;
           with DataModule1.FDTLogica do
               begin
                 Locate('IdLog', 6);
                 Edit;
                 FieldByName('MontoLog').AsFloat := 1;
                 Post;
               end;
                 DataModule1.FDQHabilitar.Active := False;
                 DataModule1.FDQHabilitar.Active := True;
                 DataModule1.FDQTarjetas.Active := False;
                 DataModule1.FDQTarjetas.Active := True;
                 FPrincipal.BHabilitar.Click;
                 FDiaEmpleado.Close;
     end;
end;

procedure TFDiaEmpleado.FormCreate(Sender: TObject);
begin

         SBBorrar.Enabled := False;
         emp := StrToInt(DBEIdUltCaja.Text);
         DataModule1.FDQEmpleadodeldia.ParamByName('emp').AsInteger := StrToInt(DBEIdUltCaja.Text);
         DataModule1.FDQEmpleadodeldia.Active := True;
end;

procedure TFDiaEmpleado.SBAgregarClick(Sender: TObject);
begin
   DataModule1.FDQEmpleadodeldia.Active := False;
   with DataModule1.FDTDiaEmp do
               begin
                 Open;
                 Append;
                 FieldByName('IdCaja').AsInteger := StrToInt(DBEIdUltCaja.Text);
                 FieldByName('Empleado').AsString := DBEEmpAct.Text;
                 Post;//realizar alta
               end;
   emp := StrToInt(DBEIdUltCaja.Text);
   DataModule1.FDQEmpleadodeldia.ParamByName('emp').AsInteger := StrToInt(DBEIdUltCaja.Text);
   DataModule1.FDQEmpleadodeldia.Active := True;
end;

procedure TFDiaEmpleado.SBBorrarClick(Sender: TObject);
begin

   with DataModule1.FDTDiaEmp do
               begin
                 Locate('IdDiaEmp', StrToInt(DBEIdEmpleadodeldia.Text));
                 Delete;
               end;
   DataModule1.FDQEmpleadodeldia.Active := False;
   DataModule1.FDQEmpleadodeldia.Active := True;
end;

end.
