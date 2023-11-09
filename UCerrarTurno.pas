unit UCerrarTurno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Data.DB, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFCerrarTurno = class(TForm)
    BBContinuar: TBitBtn;
    DBGFotocActivas: TDBGrid;
    DBEIdFotoc: TDBEdit;
    DBEUltCont: TDBEdit;
    Label1: TLabel;
    LEContadorFinal: TLabeledEdit;
    BBAgregar: TBitBtn;
    DBEIdUltCaja: TDBEdit;
    DBEMaquina: TDBEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    DBEToner: TDBEdit;
    Label3: TLabel;
    CHToner: TCheckBox;
    procedure BBContinuarClick(Sender: TObject);
    procedure BBAgregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCerrarTurno: TFCerrarTurno;
  aux: Integer;

implementation

{$R *.dfm}

uses UDataModule, Udiaempleado;

procedure TFCerrarTurno.BBAgregarClick(Sender: TObject);
begin
   if (StrToInt(DBEIdFotoc.Text) = aux) then
     begin
        BBAgregar.Enabled := False;
     end
   else
     begin
       with DataModule1.FDTDiaFotoCaja do
               begin
                 Open;
                 Append;
                 FieldByName('IdCaja').AsInteger := StrToInt(DBEIdUltCaja.Text);
                 FieldByName('Maquina').AsString := DBEMaquina.Text;
                 FieldByName('ContadorIn').AsInteger := StrToInt(DBEUltCont.Text);
                 FieldByName('ContadorFi').AsInteger := StrToInt(LEContadorFinal.Text);
                 if CHToner.Checked = True then
                   begin
                     FieldByName('Toner').AsInteger := 1;
                   end;
                 Post;//realizar alta
               end;
       with DataModule1.FDTFotocopiadora do
               begin
                 Locate('IdFotoc', StrToInt(DBEIdFotoc.Text));
                 Open;
                 Edit;
                 FieldByName('UltCont').AsInteger := StrToInt(LEContadorFinal.Text);
                 Post;//realizar alta
               end;
       aux := StrToInt(DBEIdFotoc.Text);
       DataModule1.FDQFotocopActiva.Active := False;
       DataModule1.FDQFotocopActiva.Active := True;
       DataModule1.FDQFotocopActiva.Locate('IdFotoc', aux);
       DataModule1.FDQFotocopActiva.Next;
       LEContadorFinal.Text := '';
       CHToner.Checked := False;
       if (StrToInt(DBEIdFotoc.Text) = aux) then
         begin
           BBAgregar.Enabled := False;
         end;
     end;
end;

procedure TFCerrarTurno.BBContinuarClick(Sender: TObject);
begin
 { DataModule1.FDTLogica.Locate('IdLog', '4');
  if DataModule1.FDTLogica.FieldByName('MontoLog').AsFloat > 0 then
    begin

    end;  }

  FCerrarTurno.Close;
end;

procedure TFCerrarTurno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCerrarTurno.Close;
  FDiaEmpleado.ShowModal;
end;

procedure TFCerrarTurno.FormCreate(Sender: TObject);
begin
  aux := 0;
end;

procedure TFCerrarTurno.SpeedButton1Click(Sender: TObject);
begin
with DataModule1.FDTDiaFotoCaja do
  begin
    while not Eof do
       begin
         Last;
         if FieldByName('IdCaja').AsInteger = StrToInt(DBEIdUltCaja.Text) then
           begin
             Delete;
             First;
           end
         else
           begin
             Next;
           end;
       end;
  end;
DataModule1.FDQFotocopActiva.First;
BBAgregar.Enabled := True;
aux := 0;

end;

end.
