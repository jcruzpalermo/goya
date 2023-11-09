unit UBuscarProducto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, FireDAC.Stan.Param, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFBuscarProducto = class(TForm)
    LEProducto: TLabeledEdit;
    BBAgregar: TBitBtn;
    BBVolver: TBitBtn;
    BBuscar: TButton;
    DBGProducto: TDBGrid;
    BVerTodo: TButton;
    DBEIdProd: TDBEdit;
    procedure BBuscarClick(Sender: TObject);
    procedure BVerTodoClick(Sender: TObject);
    procedure BBAgregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBVolverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBuscarProducto: TFBuscarProducto;
  parc: Text;

implementation

{$R *.dfm}

uses UDataModule, UVentas, UProductos;

procedure TFBuscarProducto.BBAgregarClick(Sender: TObject);
begin
  FVentasAgregar.LEIdProducto.Text := DBEIdProd.Text;
  FProducto.LEIdProducto.Text := DBEIdProd.Text;
  BBVolver.Click;
  FVentasAgregar.BBBuscar.Click;
  FProducto.BBBuscar.Click;

end;

procedure TFBuscarProducto.BBuscarClick(Sender: TObject);
begin
         DataModule1.FDQBusqParcProductos.Active := False;
         DataModule1.FDQBusqParcProductos.ParamByName('parc').AsString := '%' + LEProducto.text +  '%' ;
         DataModule1.FDQBusqParcProductos.Active := True;
         DBEIdProd.DataField := 'IdProducto';
end;

procedure TFBuscarProducto.BBVolverClick(Sender: TObject);
begin
  FBuscarProducto.Close;
end;

procedure TFBuscarProducto.BVerTodoClick(Sender: TObject);
begin
    LEProducto.Text := '';
    BBuscar.Click;
end;

procedure TFBuscarProducto.FormCreate(Sender: TObject);
begin
 BVerTodo.Click;
end;

end.
