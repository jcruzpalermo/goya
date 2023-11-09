unit UOpcVenta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFOpcVentas = class(TForm)
    BBSalir: TBitBtn;
    BBAgregarV: TBitBtn;
    BBEliminarV: TBitBtn;
    BBModificarV: TBitBtn;
    BBBuscarV: TBitBtn;
    procedure BBSalirClick(Sender: TObject);
    procedure BBAgregarVClick(Sender: TObject);
    procedure BBBuscarVClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOpcVentas: TFOpcVentas;

implementation

{$R *.dfm}

uses UVentas, UBuscarVenta;

procedure TFOpcVentas.BBAgregarVClick(Sender: TObject);
begin
  FVentasAgregar.ShowModal;
  FVentasAgregar.BBLimpiar.Click;
  FOpcVentas.Close;
end;

procedure TFOpcVentas.BBBuscarVClick(Sender: TObject);
begin
    FBuscarVenta.ShowModal;
end;

procedure TFOpcVentas.BBSalirClick(Sender: TObject);
begin
 FOpcVentas.Close;
end;

end.
