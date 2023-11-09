unit UFotocopiadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFFotocopiadora = class(TForm)
    DBGFotocopiadora: TDBGrid;
    LEFotocopiadora: TLabeledEdit;
    CBEstadoFot: TComboBox;
    Label1: TLabel;
    BBAgregar: TBitBtn;
    BBEliminar: TBitBtn;
    BBModificar: TBitBtn;
    BBVolver: TBitBtn;
    LEUltCont: TLabeledEdit;
    Button1: TButton;
    procedure BBVolverClick(Sender: TObject);
    procedure BBAgregarClick(Sender: TObject);
    procedure BBEliminarClick(Sender: TObject);
    procedure BBModificarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGFotocopiadoraCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFotocopiadora: TFFotocopiadora;
  buttonSelected: Integer;

implementation

{$R *.dfm}

uses UDataModule;

procedure TFFotocopiadora.BBAgregarClick(Sender: TObject);
begin
     if ((LEFotocopiadora.Text = '') or (LEUltCont.Text = '')) then
         begin
           ShowMessage('Ningún campo puede estar vacío');
         end
      else
         begin
           with DataModule1.FDTFotocopiadora do
               begin
                 Open;
                 Append;
                 FieldByName('Maquina').AsString  := LEFotocopiadora.Text;
                 FieldByName('Estado').AsString   := CBEstadoFot.Text;
                 FieldByName('UltCont').AsInteger := StrToInt(LEUltCont.Text);
                 Post;
                 ShowMessage('el alta se realizo con exito');//realizar alta
               end;
           LEFotocopiadora.Text := '';
           LEUltCont.Text := '';
           CBEstadoFot.ItemIndex := 0;
         end;
end;

procedure TFFotocopiadora.BBEliminarClick(Sender: TObject);
begin
   buttonSelected := messagedlg('¿Esta seguro que desea eliminar el registro seleccionado?',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTFotocopiadora do
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

procedure TFFotocopiadora.BBModificarClick(Sender: TObject);
begin
  if ((LEFotocopiadora.Text = '') or (LEUltCont.Text = '')) then
         begin
           ShowMessage('Ningún campo puede estar vacío');
         end
  else
   begin
    buttonSelected := messagedlg('¿Esta seguro que desea modificar el registro seleccionado?',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTFotocopiadora do
          begin
             Edit;
             FieldByName('Maquina').AsString  := LEFotocopiadora.Text;
             FieldByName('Estado').AsString   := CBEstadoFot.Text;
             FieldByName('UltCont').AsInteger := StrToInt(LEUltCont.Text);
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

procedure TFFotocopiadora.BBVolverClick(Sender: TObject);
begin
   FFotocopiadora.Close;
end;

procedure TFFotocopiadora.DBGFotocopiadoraCellClick(Column: TColumn);
begin
  LEFotocopiadora.Text := DataModule1.FDTFotocopiadora.FieldByName('Maquina').AsString;
  LEUltCont.Text := IntToStr(DataModule1.FDTFotocopiadora.FieldByName('UltCont').AsInteger);
  if DataModule1.FDTFotocopiadora.FieldByName('Estado').AsString = 'Activa' then
    begin
      CBEstadoFot.ItemIndex := 0;
    end
  else
    begin
      CBEstadoFot.ItemIndex := 1;
    end;
end;

procedure TFFotocopiadora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   LEFotocopiadora.Text := '';
   LEUltCont.Text := '';
   CBEstadoFot.ItemIndex := 0;

end;

end.
