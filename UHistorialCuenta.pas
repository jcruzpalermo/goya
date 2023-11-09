unit UHistorialCuenta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, FireDAC.Stan.Param, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TFHistoricoCuenta = class(TForm)
    DTPFecha: TDateTimePicker;
    CBCuenta: TCheckBox;
    LECuenta: TLabeledEdit;
    BVerTodo: TButton;
    BBVolver: TBitBtn;
    DBGHistorico: TDBGrid;
    BBFiltrar: TBitBtn;
    BVerFecha: TButton;
    procedure BBVolverClick(Sender: TObject);
    procedure BVerTodoClick(Sender: TObject);
    procedure BBFiltrarClick(Sender: TObject);
    procedure BVerFechaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHistoricoCuenta: TFHistoricoCuenta;
  nom: string;



implementation

{$R *.dfm}

uses UDataModule;

procedure TFHistoricoCuenta.BBFiltrarClick(Sender: TObject);
begin
  nom := '%';
  if CBCuenta.Checked = True then
    begin
      DataModule1.FDQHistPagoCuenta.Active := False;
      DataModule1.FDQHistPagoCuenta.ParamByName('nom').AsString := '%' + LECuenta.Text + '%';
      DataModule1.FDQHistPagoCuenta.Active := True;
      DBGHistorico.DataSource := DataModule1.DSHistPagoCuenta;
    end
  else
    begin
      BVerTodo.Click;
    end;

end;

procedure TFHistoricoCuenta.BBVolverClick(Sender: TObject);
begin
   FHistoricoCuenta.Close;
end;

procedure TFHistoricoCuenta.BVerFechaClick(Sender: TObject);
begin
  if DBGHistorico.DataSource = DataModule1.DSPagarCuenta then
    begin
      DataModule1.FDTPagarCuenta.Locate('fecha', DTPFecha.Date);
    end
  else
    begin
      DataModule1.FDQHistPagoCuenta.Locate('fecha', DTPFecha.Date);
    end;
end;

procedure TFHistoricoCuenta.BVerTodoClick(Sender: TObject);
begin
  DBGHistorico.DataSource := DataModule1.DSPagarCuenta;
end;

end.
