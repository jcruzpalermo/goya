unit UEncargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask;

type
  TFEncargo = class(TForm)
    Label1: TLabel;
    DBGEncargos: TDBGrid;
    LEDetalleEnc: TLabeledEdit;
    CBEstadoEnc: TComboBox;
    BBAgregar: TBitBtn;
    BBEliminar: TBitBtn;
    BBBuscar: TBitBtn;
    BBVolver: TBitBtn;
    LECliente: TLabeledEdit;
    DBGEmpAct: TDBGrid;
    DBEEmpAct: TDBEdit;
    LESe�a: TLabeledEdit;
    Label2: TLabel;
    SBResma: TSpeedButton;
    SBToner: TSpeedButton;
    procedure BBVolverClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBAgregarClick(Sender: TObject);
    procedure BBEliminarClick(Sender: TObject);
    procedure LESe�aKeyPress(Sender: TObject; var Key: Char);
    procedure SBResmaClick(Sender: TObject);
    procedure SBTonerClick(Sender: TObject);
    procedure BBBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEncargo: TFEncargo;
  buttonSelected: integer;

implementation

{$R *.dfm}

uses UDataModule, UPrincipal, UBuscarEncargos;

procedure TFEncargo.BBAgregarClick(Sender: TObject);
begin
if LESe�a.Text = '' then
  begin
    LESe�a.Text := '0';
  end;
if ((LEDetalleEnc.Text = '') or (LECliente.Text = '')) then
         begin
           ShowMessage('Ning�n campo puede estar vac�o');
         end
      else
         begin
           with DataModule1.FDTEncargo do
               begin
                 Open;
                 Append;
                 FieldByName('FechaEnc').AsDateTime := FPrincipal.DateTimePicker1.DateTime;
                 FieldByName('DetalleEnc').AsString := LEDetalleEnc.Text;
                 FieldByName('Nombre').AsString := LECliente.Text;
                 FieldByName('estado').AsString := CBEstadoEnc.Text;
                 FieldByName('Se�a').AsFloat := StrToFloat(LESe�a.Text);
                 FieldByName('NombreEmpGoya').AsString := DBEEmpAct.Text;
                 Post;
                 ShowMessage('el alta se realizo con exito');//realizar alta
               end;
           with DataModule1.FDTLogica do
                    begin
                      Locate('IdLog', 1);
                      Edit;
                      FieldByName('MontoLog').AsFloat := (StrToFloat(FPrincipal.DBEEfectivoCaja.Text) + StrToFloat(LESe�a.Text));
                      Post;
                    end;
                 DataModule1.FDQEfectivo.Active := False;
                 DataModule1.FDQEfectivo.Active := True;
           LEDetalleEnc.Text := '';
           LECliente.Text := '';
           CBEstadoEnc.ItemIndex := 0;
           LESe�a.Text := '';
         end;
end;

procedure TFEncargo.BBBuscarClick(Sender: TObject);
begin
  FBuscarEncargos.ShowModal;
end;

procedure TFEncargo.BBEliminarClick(Sender: TObject);
begin
   buttonSelected := messagedlg('�Esta seguro que desea eliminar el registro seleccionado?',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTEncargo do
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

procedure TFEncargo.BBVolverClick(Sender: TObject);
begin
  FEncargo.Close;
end;

procedure TFEncargo.FormCreate(Sender: TObject);
begin
  DataModule1.QEmpleadosActivos.Active := True;
  DataModule1.QEmpleadosActivos.Refresh;

end;

procedure TFEncargo.LESe�aKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '.') then
  begin
    key := #0;
    key := ',';
  end;

 if not (CharInSet (UpCase(Key), ['0'..'9',',',#8])) then
    begin
      key:=#0;
      showmessage('Por favor introduzca numeros')
    end;
end;

procedure TFEncargo.SBResmaClick(Sender: TObject);
begin
  FPrincipal.SBResma.Click;
end;

procedure TFEncargo.SBTonerClick(Sender: TObject);
begin
  FPrincipal.SBToner.Click;
end;

end.
