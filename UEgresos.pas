{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit UEgresos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.UITypes, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TFEgreso = class(TForm)
    BBSalir: TBitBtn;
    DBGEgresos: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    EDetalleEgr: TEdit;
    EMontoEgr: TEdit;
    BBAltaEgr: TBitBtn;
    CBDetalleEnc: TComboBox;
    Label3: TLabel;
    BBBajaEgr: TBitBtn;
    BBBuscarEgr: TBitBtn;
    BBModEgr: TBitBtn;
    DBEMonto: TDBEdit;
    DBEDetalle: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EModifMonto: TEdit;
    Label7: TLabel;
    EModifDetalle: TEdit;
    Panel1: TPanel;
    DBEId: TDBEdit;
    DBEFecha: TDBEdit;
    DBETurno: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BBHabilitar: TBitBtn;
    BBActualizar: TBitBtn;
    SBResma: TSpeedButton;
    SBToner: TSpeedButton;
    EPass: TEdit;
    BLimpiar: TButton;
    procedure BBSalirClick(Sender: TObject);
    procedure CBDetalleEncChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBAltaEgrClick(Sender: TObject);
    procedure BBBajaEgrClick(Sender: TObject);
    procedure BBModEgrClick(Sender: TObject);
    procedure BBHabilitarClick(Sender: TObject);
    procedure BBBuscarEgrClick(Sender: TObject);
    procedure EMontoEgrKeyPress(Sender: TObject; var Key: Char);
    procedure BBActualizarClick(Sender: TObject);
    procedure SBResmaClick(Sender: TObject);
    procedure SBTonerClick(Sender: TObject);
    procedure BLimpiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEgreso: TFEgreso;
  buttonSelected : Integer;
  key: Char;
implementation

{$R *.dfm}

uses UDataModule, UPrincipal, UBuscarEgreso;

procedure TFEgreso.BBActualizarClick(Sender: TObject);
begin
 DataModule1.FDTEgreso.Close;
 DataModule1.FDTEgreso.Open;
end;

procedure TFEgreso.BBAltaEgrClick(Sender: TObject);
 begin
  if (EMontoEgr.Text = '') then
   begin
    ShowMessage('Por favor ingrese un monto');
   end
  else
   begin
     if (CBDetalleEnc.ItemIndex = (-1)) then
       begin
          ShowMessage('Por favor seleccione un tipo de egreso');
       end
      else
       begin
           if CBDetalleEnc.ItemIndex > 0 then
             begin
               if (EDetalleEgr.Text = '') then
                 begin
                  ShowMessage('Por favor detalle el motivo del egreso');
                 end
               else
                 begin
                    with DataModule1.FDTEgreso do
                        begin
                           Open;
                           Append;
                           FieldByname('FechaEg').AsDateTime := FPrincipal.DateTimePicker1.DateTime;
                           FieldByName('Turno').AsString    := FPrincipal.CBTurno.Text;
                           FieldByName('Detalle').AsString := (CBDetalleEnc.Text + ', ' + EDetalleEgr.Text);
                           FieldByName('Monto').AsFloat   := StrToFloat (EMontoEgr.Text);
                           Post;
                           ShowMessage('el alta se realizo con exito');//realizar alta
                        end;
                    with DataModule1.FDTLogica do
                        begin
                          Locate('IdLog', 1);
                          Edit;
                          FieldByName('MontoLog').AsFloat := (StrToFloat(FPrincipal.DBEEfectivoCaja.Text) - StrToFloat(EMontoEgr.Text));
                          Post;
                        end;
                    DataModule1.FDQEfectivo.Active := False;
                    DataModule1.FDQEfectivo.Active := True;
                 end;
             end
           else
             begin
               if CBDetalleEnc.ItemIndex = 0 then
                 begin
                   with DataModule1.FDTEgreso do
                        begin
                          Open;
                          Append;
                          FieldByname('FechaEg').AsDateTime := FPrincipal.DateTimePicker1.DateTime;
                          FieldByName('Turno').AsString    := FPrincipal.CBTurno.Text;
                          FieldByName('Detalle').AsString := (CBDetalleEnc.Text);
                          FieldByName('Monto').AsFloat   := StrToFloat (EMontoEgr.Text);
                          Post;
                          ShowMessage('el alta se realizo');//realizar alta
                        end;
                    with DataModule1.FDTLogica do
                        begin
                          Locate('IdLog', 1);
                          Edit;
                          FieldByName('MontoLog').AsFloat := (StrToFloat(FPrincipal.DBEEfectivoCaja.Text) - StrToFloat(EMontoEgr.Text));
                          Post;
                        end;
                    DataModule1.FDQEfectivo.Active := False;
                    DataModule1.FDQEfectivo.Active := True;
                 end;
             end;
       end;
   end;
  BBActualizar.Click;
  BLimpiar.Click;
 end;

procedure TFEgreso.BBBajaEgrClick(Sender: TObject);
begin
    buttonSelected := messagedlg('�Esta seguro que desea eliminar el registro seleccionado?',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTEgreso do
          begin
             Delete;
             Refresh;
             DBGEgresos.Refresh;
          end;
        ShowMessage('El registro se elimin� con exito');
      end;
    if buttonSelected = mrCancel then
      begin
        ShowMessage('Se cancel� la operaci�n');
      end;
end;

procedure TFEgreso.BBBuscarEgrClick(Sender: TObject);
begin
  FBuscarEgreso.ShowModal;
end;

procedure TFEgreso.BBHabilitarClick(Sender: TObject);
begin
 DataModule1.FDTLogica.Locate('IdLog', 8);
 if (EPass.Text = DataModule1.FDTLogica.FieldByName('EstadoLog').AsString) then
  begin
   BBModEgr.Visible := True;
   Panel1.Visible := True;
   EModifMonto.Visible := True;
   EModifDetalle.Visible := True;
   Label4.Visible := True;
   Label5.Visible := True;
   Label6.Visible := True;
   Label7.Visible := True;
   DBEId.Visible := True;
   DBEFecha.Visible := True;
   DBETurno.Visible := True;
   DBEMonto.Visible := True;
   DBEDetalle.Visible := True;
   BBBajaEgr.Visible := True;
   EPass.Visible := False;
  end
 else
  begin
    ShowMessage('Contrase�a Incorrecta');

  end;
end;

procedure TFEgreso.BBModEgrClick(Sender: TObject);
begin
  if ((EModifMonto.Text = '') or (EModifDetalle.Text = '')) then
    begin
      ShowMessage('Los campos a modificar no pueden estar vacios');
    end
  else
   begin
    buttonSelected := messagedlg('�Esta seguro que desea modificar el registro seleccionado?',mtConfirmation, mbOKCancel, 0);
    if buttonSelected = mrOK     then
      begin
        with DataModule1.FDTEgreso do
          begin
             Edit;
             FieldByName('Detalle').AsString := EModifDetalle.Text;
             FieldByName('Monto').AsFloat := StrToFloat(EModifMonto.Text);
             Post;
          end;
        ShowMessage('El registro se modific� con exito');
      end;
    if buttonSelected = mrCancel then
      begin
        ShowMessage('Se cancel� la operaci�n');
      end;
   end;
end;

procedure TFEgreso.BBSalirClick(Sender: TObject);
begin
   FEgreso.CloseModal;
end;

procedure TFEgreso.BLimpiarClick(Sender: TObject);
begin
  EMontoEgr.Text := '';
  EDetalleEgr.Text := '';
end;

procedure TFEgreso.CBDetalleEncChange(Sender: TObject);
begin
   if (CBDetalleEnc.ItemIndex = 0)  then
      begin
        EDetalleEgr.Visible := False;
        Label1.Visible := False;
      end
   else
     begin
        EDetalleEgr.Visible := True;
        Label1.Visible := True;
     end;


end;

procedure TFEgreso.EMontoEgrKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '.') then
  begin
    key := #0;
    key := ',';
  end;

 if not (CharInSet (UpCase(Key), ['0'..'9',',',#8])) then
    begin
      key:=#0;
      showmessage('Por favor introduzca numeros')
    end;
end;

procedure TFEgreso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CBDetalleEnc.ItemIndex := -1;
   EDetalleEgr.Text := '';
   EMontoEgr.Text := '';
   EDetalleEgr.Visible := False;
   BBBajaEgr.Visible := False;
   BBModEgr.Visible := False;
   Panel1.Visible := False;
   EModifMonto.Visible := False;
   EModifDetalle.Visible := False;
   Label4.Visible := False;
   Label5.Visible := False;
   Label6.Visible := False;
   Label7.Visible := False;
   DBEId.Visible := False;
   DBEFecha.Visible := False;
   DBETurno.Visible := False;
   DBEMonto.Visible := False;
   DBEDetalle.Visible := False;
   EPass.Visible := True;
   EPass.Text := 'Password';

end;

procedure TFEgreso.SBResmaClick(Sender: TObject);
begin
  FPrincipal.SBResma.Click;
end;

procedure TFEgreso.SBTonerClick(Sender: TObject);
begin
  FPrincipal.SBToner.Click;
end;

end.
