unit UCuentas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, FireDAC.Stan.Param, System.UITypes, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFCuentas = class(TForm)
    Label1: TLabel;
    DBGCuentas: TDBGrid;
    CBTipoCuenta: TComboBox;
    BBAgregar: TBitBtn;
    BBEliminar: TBitBtn;
    BBModificar: TBitBtn;
    BBBuscar: TBitBtn;
    BBVolver: TBitBtn;
    LENombreCE: TLabeledEdit;
    LESaldo: TLabeledEdit;
    LELimite: TLabeledEdit;
    CBEstadoCuenta: TComboBox;
    Label2: TLabel;
    LEDniCuit: TLabeledEdit;
    LEDireccion: TLabeledEdit;
    BBListarCuenta: TBitBtn;
    SBResma: TSpeedButton;
    SBToner: TSpeedButton;
    procedure BBVolverClick(Sender: TObject);
    procedure BBAgregarClick(Sender: TObject);
    procedure BBEliminarClick(Sender: TObject);
    procedure BBModificarClick(Sender: TObject);
    procedure DBGCuentasCellClick(Column: TColumn);
    procedure LELimiteKeyPress(Sender: TObject; var Key: Char);
    procedure BBBuscarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBListarCuentaClick(Sender: TObject);
    procedure SBResmaClick(Sender: TObject);
    procedure SBTonerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCuentas: TFCuentas;
  buttonSelected, i: Integer;
  Key: Char;
  cue: String;

implementation

{$R *.dfm}

uses UDataModule, UListarCuentas, UPrincipal;

procedure TFCuentas.BBAgregarClick(Sender: TObject);
begin
if LESaldo.Text = '' then
  begin
    LESaldo.Text := '0';
  end;

if LELimite.Text = '' then
  begin
    LELimite.Text := '-500';
  end;
if (LENombreCE.Text = '') then
         begin
           ShowMessage('El campo Nombre del Cliente/Empresa no puede estar vacio');
         end
      else
         begin
           with DataModule1.FDTCuenta do
               begin
                 Open;
                 Append;
                 FieldByName('Tipo').AsString := CBTipoCuenta.Text;
                 FieldByName('Nombre').AsString := LENombreCE.Text;
                 FieldByName('DnioCUIT').AsFloat := StrToFloat(LEDniCuit.Text);
                 FieldByName('Estado').AsString := CBEstadoCuenta.Text;
                 FieldByName('Direccion').AsString := LEDireccion.Text;
                 FieldByName('Saldo').AsFloat := StrToFloat(LESaldo.Text);
                 FieldByName('Limite').AsFloat := StrToFloat(LELimite.Text);
                 Post;
                 ShowMessage('el alta se realizo con exito');
               end;
           LENombreCE.Text := '';
           CBEstadoCuenta.ItemIndex := 0;
           CBTipoCuenta.ItemIndex := 0;
           LEDniCuit.Text := '';
           LEDireccion.Text := '';
           LESaldo.Text := '';
           LELimite.Text := '';
         end;
end;

procedure TFCuentas.BBBuscarClick(Sender: TObject);
begin
   if LENombreCE.Text = '' then
      begin
        ShowMessage('El nombre a buscar se encuentra vac�o');
      end
   else
      begin
         DBGCuentas.DataSource := DataModule1.DSBuscarCuenta;
         DataModule1.FDQBuscarCuenta.Active := False;
         cue := '%' + LENombreCE.Text + '%';
         DataModule1.FDQBuscarCuenta.ParamByName('cue').AsString := '%' + LENombreCE.Text + '%';
         DataModule1.FDQBuscarCuenta.Active := True;
      end;
end;

procedure TFCuentas.BBEliminarClick(Sender: TObject);
begin
  buttonSelected := messagedlg('�Esta seguro que desea eliminar el registro seleccionado?',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTCuenta do
          begin
             Delete;
          end;
        ShowMessage('El registro se elimin� con exito');
      end;
    if buttonSelected = mrCancel then
      begin
        ShowMessage('Se cancel� la operaci�n');
      end;
end;

procedure TFCuentas.BBListarCuentaClick(Sender: TObject);
begin
  DataModule1.FDQListarCuentas.Active := True;
  FListarCuentas.ShowModal;
end;

procedure TFCuentas.BBModificarClick(Sender: TObject);
begin
 if (LENombreCE.Text = '') then
  begin
   ShowMessage('El campo Nombre no puede estar vacio');
  end
else
  begin
   buttonSelected := messagedlg('Esta acci�n no modificar� el valor "Saldo" de la cuenta seleccionada, recuerde que para modificar dicho campo de una cuenta debe ir a la pantalla "Cobrar Cuentas"',mtConfirmation, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTCuenta do
          begin
             Edit;
             FieldByName('Tipo').AsString := CBTipoCuenta.Text;
             FieldByName('Nombre').AsString := LENombreCE.Text;
             FieldByName('DnioCUIT').AsFloat := StrToFloat(LEDniCuit.Text);
             FieldByName('Estado').AsString := CBEstadoCuenta.Text;
             FieldByName('Direccion').AsString := LEDireccion.Text;
             FieldByName('Limite').AsFloat := StrToFloat(LELimite.Text);
             Post;
             if (FieldByName('Saldo').AsFloat < FieldByName('Limite').AsFloat) then
                begin
                   Edit;
                   FieldByName('Estado').AsString := 'Con Deuda';
                   Post;
                end
             else
                begin
                   Edit;
                   FieldByName('Estado').AsString := 'Habilitada';
                   Post;
                end;
          end;
        ShowMessage('El registro se modific� con exito');
      end;
    if buttonSelected = mrCancel then
      begin
        ShowMessage('Se cancel� la operaci�n');
      end;
  end;
end;

procedure TFCuentas.BBVolverClick(Sender: TObject);
begin
  FCuentas.Close;
end;

procedure TFCuentas.DBGCuentasCellClick(Column: TColumn);
begin
  CBTipoCuenta.Text := DataModule1.FDTCuenta.FieldByName('Tipo').AsString;
  LENombreCE.Text := DataModule1.FDTCuenta.FieldByName('Nombre').AsString;
  LEDniCuit.Text := FloatToStr(DataModule1.FDTCuenta.FieldByName('DnioCUIT').AsFloat);
  LEDireccion.Text := DataModule1.FDTCuenta.FieldByName('Direccion').AsString;
  LESaldo.Text := FloatToStr(DataModule1.FDTCuenta.FieldByName('Saldo').AsFloat);
  LELimite.Text := FloatToStr(DataModule1.FDTCuenta.FieldByName('Limite').AsFloat);
  CBEstadoCuenta.Text := DataModule1.FDTCuenta.FieldByName('Estado').AsString;
end;

procedure TFCuentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DBGCuentas.DataSource := DataModule1.DSCuenta;
end;

procedure TFCuentas.LELimiteKeyPress(Sender: TObject; var Key: Char);
begin
 if (key = '.') then
  begin
    key := #0;
    key := ',';
  end;

 if not (CharInSet (UpCase(Key), ['0'..'9',',','-',#8])) then
    begin
      key:=#0;
      showmessage('Por favor introduzca numeros')
    end;
end;

procedure TFCuentas.SBResmaClick(Sender: TObject);
begin
  FPrincipal.SBResma.Click;
end;

procedure TFCuentas.SBTonerClick(Sender: TObject);
begin
  FPrincipal.SBToner.Click;
end;

end.
