unit UEmpleado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFEmpleado = class(TForm)
    DBGEmpleado: TDBGrid;
    LEEmpleado: TLabeledEdit;
    CBEstadoEmp: TComboBox;
    Label1: TLabel;
    BBAgregar: TBitBtn;
    BBEliminar: TBitBtn;
    BBModificar: TBitBtn;
    BBVolver: TBitBtn;
    procedure BBAgregarClick(Sender: TObject);
    procedure BBVolverClick(Sender: TObject);
    procedure BBEliminarClick(Sender: TObject);
    procedure BBModificarClick(Sender: TObject);
    procedure DBGEmpleadoCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmpleado: TFEmpleado;
  buttonSelected: Integer;

implementation

{$R *.dfm}

uses UDataModule;

procedure TFEmpleado.BBAgregarClick(Sender: TObject);
begin
      if (LEEmpleado.Text = '') then
         begin
           ShowMessage('Ningún campo puede estar vacío');
         end
      else
         begin
           with DataModule1.FDTEmpleado do
               begin
                 Open;
                 Append;
                 FieldByName('NombreEmp').AsString := LEEmpleado.Text;
                 FieldByName('EstadoEmp').AsString := CBEstadoEmp.Text;
                 Post;
                 ShowMessage('el alta se realizo con exito');//realizar alta
               end;
           LEEmpleado.Text := '';
         end;
end;

procedure TFEmpleado.BBEliminarClick(Sender: TObject);
begin
   buttonSelected := messagedlg('¿Esta seguro que desea eliminar el registro seleccionado?',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTEmpleado do
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

procedure TFEmpleado.BBModificarClick(Sender: TObject);
begin
  if (LEEmpleado.Text = '') then
    begin
     ShowMessage('Ningún campo puede estar vacío');
    end
  else
   begin
    buttonSelected := messagedlg('¿Esta seguro que desea modificar el registro seleccionado?',mtConfirmation, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTEmpleado do
          begin
             Edit;
             FieldByName('NombreEmp').AsString := LEEmpleado.Text;
             FieldByName('EstadoEmp').AsString := CBEstadoEmp.Text;
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

procedure TFEmpleado.BBVolverClick(Sender: TObject);
begin
    FEmpleado.Close;
end;

procedure TFEmpleado.DBGEmpleadoCellClick(Column: TColumn);
begin
  LEEmpleado.Text := DataModule1.FDTEmpleado.FieldByName('NombreEmp').AsString;
  if DataModule1.FDTEmpleado.FieldByName('EstadoEmp').AsString = 'Activo' then
    begin
      CBEstadoEmp.ItemIndex := 0;
    end
  else
    begin
      CBEstadoEmp.ItemIndex := 1;
    end;
end;

end.
