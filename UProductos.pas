unit UProductos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TFProducto = class(TForm)
    DBGProducto: TDBGrid;
    BBAgregar: TBitBtn;
    BBEliminar: TBitBtn;
    BBModificar: TBitBtn;
    BBBuscar: TBitBtn;
    BBVolver: TBitBtn;
    LEDescripcion: TLabeledEdit;
    LEStock: TLabeledEdit;
    LEPrecioU: TLabeledEdit;
    LEIdProducto: TLabeledEdit;
    LECantMin: TLabeledEdit;
    CHLogico: TCheckBox;
    BBListarProd: TBitBtn;
    SBResma: TSpeedButton;
    SBToner: TSpeedButton;
    BActualizarPrecios: TButton;
    DBEPrecio: TDBEdit;
    LEPorcentaje: TLabeledEdit;
    Label1: TLabel;
    BBActualizar: TBitBtn;
    EPass: TEdit;
    BBHabilitar: TBitBtn;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    procedure BBVolverClick(Sender: TObject);
    procedure BBEliminarClick(Sender: TObject);
    procedure DBGProductoCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBAgregarClick(Sender: TObject);
    procedure BBModificarClick(Sender: TObject);
    procedure LEPrecioUKeyPress(Sender: TObject; var Key: Char);
    procedure BBBuscarClick(Sender: TObject);
    procedure BBListarProdClick(Sender: TObject);
    procedure SBResmaClick(Sender: TObject);
    procedure SBTonerClick(Sender: TObject);
    procedure LEIdProductoKeyPress(Sender: TObject; var Key: Char);
    procedure BBActualizarClick(Sender: TObject);
    procedure BActualizarPreciosClick(Sender: TObject);
    procedure BBHabilitarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProducto: TFProducto;
  buttonSelected: Integer;
  B: Boolean;
  log: Boolean;

implementation

{$R *.dfm}

uses UDataModule, UListarProductos, UPrincipal, UBuscarProducto;

procedure TFProducto.BActualizarPreciosClick(Sender: TObject);
begin
  ShowMessage('Recuerde que la acción de modificar todos los precios no puede volverse atrás una vez realizado.');
  LEPorcentaje.Visible := True;
  Label1.Visible := True;
  BBActualizar.Visible := True;
end;

procedure TFProducto.BBActualizarClick(Sender: TObject);
begin
  buttonSelected := messagedlg('¿Esta seguro que desea modificar todos los registros en el porcentaje seleccionado?',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
          with DataModule1.FDTProducto do
            begin
              First;
              Locate('IdProducto', 101);
              while not Eof do
                begin
                 Edit;
                 FieldByName('PrecioU').AsFloat := Round(StrToFloat(DBEPrecio.Text)*((StrToFloat(LEPorcentaje.Text)/100)+1));
                 Post;
                 Next;
                end;
            end;
        ShowMessage('Los registros se modificaron con éxito');
      end;
    if buttonSelected = mrCancel then
      begin
        ShowMessage('Se canceló la operación');
      end;
end;

procedure TFProducto.BBAgregarClick(Sender: TObject);
begin
   if ((LEIdProducto.Text = '') or (LEDescripcion.Text = '') or (LEStock.Text = '') or (LEPrecioU.Text = '') or (LECantMin.Text = '')) then
     begin
       ShowMessage('Ningun campo puede estar vacio');
     end
   else
     begin
       B := False;
       DataModule1.FDTProducto.Close;
       DataModule1.FDTProducto.Open;
       while not DataModule1.FDTProducto.Eof do
        begin
          if ((DataModule1.FDTProducto.FieldByName('IdProducto').AsFloat) = (StrToFloat(LEIdProducto.Text)))  then
             begin
               B := True;
             end;
          DataModule1.FDTProducto.Next;
        end;
       DataModule1.FDTProducto.Close;
       DataModule1.FDTProducto.Open;
       if ((StrToInt(LEStock.text)) <= (StrToInt(LECantMin.Text))) then
         begin
           log := True;
           //log lo uso para levantar el campo bandera si falta stock, no lo uso para el campo Logico de modificacion de stock
         end
       else
         begin
           log := False;
         end;
       if B = True then
         begin
           ShowMessage('Ya existe un producto con ese número de registro');
         end
       else
         begin
           with DataModule1.FDTProducto do
               begin
                 Open;
                 Append;
                 FieldByName('IdProducto').AsFloat := StrToFloat(LEIdProducto.Text);
                 FieldByName('Descripcion').AsString := LEDescripcion.Text;
                 FieldByName('stock').AsInteger := StrToInt(LEStock.Text);
                 FieldByName('PrecioU').AsFloat := StrToFloat(LEPrecioU.Text);
                 FieldByName('CantMin').AsInteger := StrToInt(LECantMin.Text);
                 FieldByName('Logico').AsBoolean := CHLogico.Checked;
                 FieldByName('Bandera').AsBoolean := log;
                 Post;
                 ShowMessage('el alta se realizo con exito');
               end;
           LEIdProducto.Text := '';
           LEDescripcion.Text := '';
           LEStock.Text := '';
           LEPrecioU.Text := '';
           LECantMin.Text := '';
           CHLogico.Checked := True;
          end;
     end;
   DataModule1.FDTProducto.Close;
   DataModule1.FDTProducto.Open;
end;

procedure TFProducto.BBBuscarClick(Sender: TObject);
begin
  if LEIdProducto.Text = '' then
      begin
        ShowMessage('Ingrese Id del producto a buscar ');
      end
   else
      begin
         DataModule1.FDTProducto.Locate('IdProducto', StrToInt64(LEIdProducto.Text));
         BBModificar.Enabled := True;
      end;
end;

procedure TFProducto.BBEliminarClick(Sender: TObject);
begin
  buttonSelected := messagedlg('¿Esta seguro que desea eliminar el registro seleccionado?',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTProducto do
          begin
             Delete;
          end;
        ShowMessage('El registro se eliminó con exito');
      end;
    if buttonSelected = mrCancel then
      begin
        ShowMessage('Se canceló la operación');
      end;
end;

procedure TFProducto.BBHabilitarClick(Sender: TObject);
begin
 DataModule1.FDTLogica.Locate('IdLog', 8);
 if (EPass.Text = DataModule1.FDTLogica.FieldByName('EstadoLog').AsString) then
  begin
    Label2.Visible := False;
    EPass.Visible := False;
    BBHabilitar.Visible := False;
    BActualizarPrecios.Visible := True;
    BBModificar.Visible := True;
    BBEliminar.Visible := True;
  end
 else
  begin
    ShowMessage('Contraseña Incorrecta');

  end;
end;

procedure TFProducto.BBListarProdClick(Sender: TObject);
begin
  DataModule1.FDQListarProductos.Active := True;
  FListarProductos.ShowModal;
end;

procedure TFProducto.BBModificarClick(Sender: TObject);
begin
if ((LEIdProducto.Text = '') or (LEDescripcion.Text = '') or (LEStock.Text = '') or (LEPrecioU.Text = '') or (LECantMin.Text = ''))then
  begin
   ShowMessage('Ningún campo puede estar vacio');
  end
else
  begin
   buttonSelected := messagedlg('Esta acción no modificará el ID del producto, ¿está seguro que desea modificar los demás campos del registro seleccionado con los valores en pantalla?',mtConfirmation, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        if ((StrToInt(LEStock.text)) <= (StrToInt(LECantMin.Text))) then
         begin
            log := True;
         end
       else
         begin
           log := False;
         end;
        with DataModule1.FDTProducto do
          begin
             Edit;
             FieldByName('Descripcion').AsString := LEDescripcion.Text;
             FieldByName('stock').AsInteger := StrToInt(LEStock.Text);
             FieldByName('PrecioU').AsFloat := StrToFloat(LEPrecioU.Text);
             FieldByName('CantMin').AsInteger := StrToInt(LECantMin.Text);
             FieldByName('Logico').AsBoolean := CHLogico.Checked;
             FieldByName('Bandera').AsBoolean := log;
             Post;
          end;
        ShowMessage('El registro se modificó con exito');
      end;
    if buttonSelected = mrCancel then
      begin
        ShowMessage('Se canceló la operación');
      end;
  end;
end;

procedure TFProducto.BBVolverClick(Sender: TObject);
begin
  LEPorcentaje.Visible := False;
  BBActualizar.Visible := False;
  Label1.Visible := False;
  FProducto.Close;
end;

procedure TFProducto.DBGProductoCellClick(Column: TColumn);
begin
  LEIdProducto.Text := FloatToStr(DataModule1.FDTProducto.FieldByName('IdProducto').AsFloat);
  LEDescripcion.Text := DataModule1.FDTProducto.FieldByName('Descripcion').AsString;
  LEStock.Text := IntToStr(DataModule1.FDTProducto.FieldByName('stock').AsInteger);
  LEPrecioU.Text := FloatToStr(DataModule1.FDTProducto.FieldByName('PrecioU').AsFloat);
  LECantMin.Text := IntToStr(DataModule1.FDTProducto.FieldByName('CantMin').AsInteger);
  if (DataModule1.FDTProducto.FieldByName('Logico').AsBoolean = True) then
    begin
      CHLogico.Checked := True;
    end
  else
    begin
      CHLogico.Checked := False;
    end;
end;

procedure TFProducto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LEIdProducto.Text := '';
  LEDescripcion.Text := '';
  LEStock.Text := '';
  LEPrecioU.Text := '';
  LECantMin.Text := '';
  CHLogico.Checked := False;
  Label2.Visible := True;
  EPass.Visible := True;
  BBHabilitar.Visible := True;
  BActualizarPrecios.Visible := False;
  BBModificar.Visible := False;
  BBEliminar.Visible := False;
  EPass.Text := 'Password';
end;

procedure TFProducto.LEIdProductoKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
   begin
     BBBuscar.Click;
   end;
end;

procedure TFProducto.LEPrecioUKeyPress(Sender: TObject; var Key: Char);
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

procedure TFProducto.SBResmaClick(Sender: TObject);
begin
  FPrincipal.SBResma.Click;
end;

procedure TFProducto.SBTonerClick(Sender: TObject);
begin
  FPrincipal.SBToner.Click;
end;

procedure TFProducto.SpeedButton1Click(Sender: TObject);
begin
   FBuscarProducto.ShowModal;
   FBuscarProducto.BVerTodo.Click;
end;

end.
