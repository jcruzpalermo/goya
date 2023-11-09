unit UBuscarVenta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, FireDAC.Stan.Param, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TFBuscarVenta = class(TForm)
    DBGBuscarVenta: TDBGrid;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    BBBuscarIdVenta: TBitBtn;
    DBGLineadeVenta: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    RBIdV: TRadioButton;
    RBFiltrar: TRadioButton;
    CBTurno: TComboBox;
    Label4: TLabel;
    EIdVenta: TEdit;
    DBELdV: TDBEdit;
    BBFiltrarVentas: TBitBtn;
    BCheck: TButton;
    BBVolver: TBitBtn;
    procedure BBBuscarIdVentaClick(Sender: TObject);
    procedure BCheckClick(Sender: TObject);
    procedure DBELdVChange(Sender: TObject);
    procedure BBFiltrarVentasClick(Sender: TObject);
    procedure BBVolverClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBuscarVenta: TFBuscarVenta;
  id: Integer;
  fec: TDate;
  tur: string;

implementation

{$R *.dfm}

uses UDataModule;

procedure TFBuscarVenta.BBBuscarIdVentaClick(Sender: TObject);
 begin
    if EIdVenta.Text = '' then
       begin
         ShowMessage('Ingrese Id a buscar');
       end
    else
       begin
         DBGBuscarVenta.DataSource := DataModule1.DSVenta;
         DBELdV.DataSource := DataModule1.DSVenta;
         DataModule1.FDTVenta.Locate('IdVenta', StrToInt(EIdVenta.Text));
        end;

 end;

procedure TFBuscarVenta.BBFiltrarVentasClick(Sender: TObject);
begin
         DBGBuscarVenta.DataSource := DataModule1.DSFiltrarVenta;
         DataModule1.FDQFiltrarVenta.Active := False;
         fec := DateTimePicker1.Date;
         tur := CBTurno.Text;
         DataModule1.FDQFiltrarVenta.ParamByName('tur').AsString := CBTurno.Text;
         DataModule1.FDQFiltrarVenta.ParamByName('fec').AsDate := DateTimePicker1.Date;
         DataModule1.FDQFiltrarVenta.Active := True;
end;

procedure TFBuscarVenta.BBVolverClick(Sender: TObject);
begin
  FBuscarVenta.Close;
end;

procedure TFBuscarVenta.BCheckClick(Sender: TObject);
begin
 if RBIdV.Checked = True then
    begin
      BBBuscarIdVenta.Enabled := True;
      BBFiltrarVentas.Enabled := False;
      DBGLineadeVenta.Visible := True;
      Label3.Visible := True;
    end;

 if RBFiltrar.Checked = True then
   begin
     BBBuscarIdVenta.Enabled := False;
     BBFiltrarVentas.Enabled := True;
     DBGLineadeVenta.Visible := False;
     Label3.Visible := False;
   end;
end;


procedure TFBuscarVenta.DBELdVChange(Sender: TObject);
begin
       DataModule1.FDQLineadeVenta.Active := False;
       id := StrToInt(DBELdV.Text);
       DataModule1.FDQLineadeVenta.ParamByName('id').AsInteger := StrToInt(DBELdV.text);
       DataModule1.FDQLineadeVenta.Active := True;
end;

end.
