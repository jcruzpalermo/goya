unit UListarProductos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFListarProductos = class(TForm)
    DBGProducto: TDBGrid;
    BBVolver: TBitBtn;
    procedure BBVolverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListarProductos: TFListarProductos;

implementation

{$R *.dfm}

uses UDataModule;

procedure TFListarProductos.BBVolverClick(Sender: TObject);
begin
  DataModule1.FDQListarProductos.Active := False;
  FListarProductos.Close;
end;

end.
