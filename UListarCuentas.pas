unit UListarCuentas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TFListarCuentas = class(TForm)
    DBGCuentas: TDBGrid;
    BBVolver: TBitBtn;
    procedure BBVolverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListarCuentas: TFListarCuentas;

implementation

{$R *.dfm}

uses UDataModule;

procedure TFListarCuentas.BBVolverClick(Sender: TObject);
begin
  DataModule1.FDQListarCuentas.Active := False;
  FListarCuentas.Close;
end;

end.
