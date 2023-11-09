unit UActualizarCuenta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls;

type
  TFActualizarCuenta = class(TForm)
    DBGCuentas: TDBGrid;
    CBFormadePago: TComboBox;
    Label1: TLabel;
    LEMonto: TLabeledEdit;
    BBPagar: TBitBtn;
    BBVolver: TBitBtn;
    Label2: TLabel;
    DBESaldo: TDBEdit;
    SBResma: TSpeedButton;
    SBToner: TSpeedButton;
    LEDetalle: TLabeledEdit;
    BBListarCuenta: TBitBtn;
    procedure BBVolverClick(Sender: TObject);
    procedure BBPagarClick(Sender: TObject);
    procedure SBResmaClick(Sender: TObject);
    procedure SBTonerClick(Sender: TObject);
    procedure LEMontoKeyPress(Sender: TObject; var Key: Char);
    procedure BBListarCuentaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FActualizarCuenta: TFActualizarCuenta;
  aux: Double;

implementation

{$R *.dfm}

uses UDataModule, UPrincipal, UHistorialCuenta;

procedure TFActualizarCuenta.BBListarCuentaClick(Sender: TObject);
begin
  FHistoricoCuenta.ShowModal;
end;

procedure TFActualizarCuenta.BBPagarClick(Sender: TObject);
begin
  if LEMonto.Text = '' then
    begin
     LEMonto.Text := '0';
    end;
  if LEMonto.Text = '0' then
    begin
      ShowMessage('El monto debe ser superior a 0');
    end
  else
    begin
    if (TryStrToFloat(LEMonto.Text, aux) = True) then
      begin
       with DataModule1.FDTPagarCuenta do
          begin
               Open;
               Append;
               FieldByname('fecha').AsDateTime := FPrincipal.DateTimePicker1.DateTime;
               FieldByName('turno').AsString    := FPrincipal.CBTurno.Text;
               FieldByName('nombre').AsString := DataModule1.FDTCuenta.FieldByName('Nombre').AsString;
               FieldByName('formadepago').AsString := CBFormadePago.Text;
               FieldByName('monto').AsFloat   := StrToFloat (LEMonto.Text);
               FieldByName('saldo').AsFloat   := (StrToFloat(DBESaldo.Text) + StrToFloat(LEMonto.Text));
               FieldByName('detalle').AsString := LEDetalle.Text;
               Post;
               //registra un impacto de pago a cajas para informe
          end;

       with DataModule1.FDTCuenta do
          begin
             Edit;
             FieldByName('Saldo').AsFloat := (StrToFloat(DBESaldo.Text) + StrToFloat(LEMonto.Text));
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
        ShowMessage('El registro se modificó con exito');
        if CBFormadePago.ItemIndex = 0 then
          begin
            with DataModule1.FDTLogica do
                    begin
                      Locate('IdLog', 1);
                      Edit;
                      FieldByName('MontoLog').AsFloat := (StrToFloat(FPrincipal.DBEEfectivoCaja.Text) + StrToFloat(LEMonto.Text));
                      Post;
                    end;
                 DataModule1.FDQEfectivo.Active := False;
                 DataModule1.FDQEfectivo.Active := True;
          end
        else
          begin
            with DataModule1.FDTLogica do
                    begin
                      Locate('IdLog', 2);
                      Edit;
                      FieldByName('MontoLog').AsFloat := (StrToFloat(FPrincipal.DBTarjetas.Text) + StrToFloat(LEMonto.Text));
                      Post;
                    end;
                 DataModule1.FDQTarjetas.Active := False;
                 DataModule1.FDQTarjetas.Active := True;
          end;
      LEMonto.Text := '';
      end
    else
      begin
       ShowMessage('El número ingreso no es valido');
      end;
    end;
end;

procedure TFActualizarCuenta.BBVolverClick(Sender: TObject);
begin
  FActualizarCuenta.Close;
end;

procedure TFActualizarCuenta.LEMontoKeyPress(Sender: TObject; var Key: Char);
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

procedure TFActualizarCuenta.SBResmaClick(Sender: TObject);
begin
  FPrincipal.SBResma.Click;
end;

procedure TFActualizarCuenta.SBTonerClick(Sender: TObject);
begin
  FPrincipal.SBToner.Click;
end;

end.
