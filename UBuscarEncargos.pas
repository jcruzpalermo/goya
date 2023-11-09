unit UBuscarEncargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, FireDAC.Stan.Param, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFBuscarEncargos = class(TForm)
    DBGEncargo: TDBGrid;
    DBIDEnc: TDBEdit;
    RBIdEncargo: TRadioButton;
    RBNombre: TRadioButton;
    EEncargo: TEdit;
    BBBuscarEncargo: TBitBtn;
    BBListar: TBitBtn;
    CBEstadoEnc: TComboBox;
    BBModificar: TBitBtn;
    BBEliminar: TBitBtn;
    BBVolver: TBitBtn;
    procedure BBBuscarEncargoClick(Sender: TObject);
    procedure BBListarClick(Sender: TObject);
    procedure BBModificarClick(Sender: TObject);
    procedure BBEliminarClick(Sender: TObject);
    procedure BBVolverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBuscarEncargos: TFBuscarEncargos;
  enc: String;
  buttonSelected: integer;

implementation

{$R *.dfm}

uses UDataModule;

procedure TFBuscarEncargos.BBBuscarEncargoClick(Sender: TObject);
begin
 if EEncargo.Text = '' then
   begin
     ShowMessage('Por favor ingrese Nro de encargo o el nombre del cliente');
   end
 else
   begin
     if (RBIdEncargo.Checked = True) then
       begin
         DBGEncargo.DataSource := DataModule1.DSBuscarEncID;
         DataModule1.FDQBuscarEncID.Active := False;
         enc := EEncargo.Text;
         DataModule1.FDQBuscarEncID.ParamByName('enc').AsString := EEncargo.text;
         DataModule1.FDQBuscarEncID.Active := True;
         DBIDEnc.DataSource := DataModule1.DSBuscarEncID;
       end;
     if (RBNombre.Checked = True) then
       begin
         DBGEncargo.DataSource := DataModule1.DSBuscarEncNom;
         DataModule1.FDQBuscarEncNom.Active := False;
         enc :=  EEncargo.Text+  '%';
         DataModule1.FDQBuscarEncNom.ParamByName('enc').AsString := EEncargo.text +  '%' ;
         DataModule1.FDQBuscarEncNom.Active := True;
         DBIDEnc.DataSource := DataModule1.DSBuscarEncNom;
       end;
   end;

end;

procedure TFBuscarEncargos.BBEliminarClick(Sender: TObject);
begin
   buttonSelected := messagedlg('�Esta seguro que desea eliminar el registro seleccionado?',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTEncargo do
          begin
             Locate('IdEncargo', StrToInt(DBIDEnc.Text));
             Delete;
          end;
        ShowMessage('El registro se elimin� con exito');
        DBGEncargo.DataSource := DataModule1.DSEncargo;
        DBIDEnc.DataSource := DataModule1.DSEncargo;
      end;
    if buttonSelected = mrCancel then
      begin
        ShowMessage('Se cancel� la operaci�n');
      end;
end;

procedure TFBuscarEncargos.BBListarClick(Sender: TObject);
begin

  DataModule1.FDQListarEncargos.Active := False;
  enc := CBEstadoEnc.Text;
  DataModule1.FDQListarEncargos.ParamByName('enc').AsString := CBEstadoEnc.Text;
  DataModule1.FDQListarEncargos.Active := True;
  DBGEncargo.DataSource := DataModule1.DSListarEncargos;
  DBIDEnc.DataSource :=  DataModule1.DSListarEncargos;

end;

procedure TFBuscarEncargos.BBModificarClick(Sender: TObject);
begin
  buttonSelected := messagedlg('�Esta seguro que desea modificar el estado del registro seleccionado?',mtConfirmation, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTEncargo do
          begin
             Locate('IdEncargo', StrToInt(DBIDEnc.Text));
             Edit;
             FieldByName('estado').AsString := CBEstadoEnc.Text;
             Post;

          end;
        ShowMessage('El registro se modific� con exito');
        DBGEncargo.DataSource := DataModule1.DSEncargo;
        DBIDEnc.DataSource := DataModule1.DSEncargo;
      end;
    if buttonSelected = mrCancel then
      begin
        ShowMessage('Se cancel� la operaci�n');
      end;
end;

procedure TFBuscarEncargos.BBVolverClick(Sender: TObject);
begin
   DBGEncargo.DataSource := DataModule1.DSEncargo;
   DBIDEnc.DataSource := DataModule1.DSEncargo;
   FBuscarEncargos.Close;
end;

end.
