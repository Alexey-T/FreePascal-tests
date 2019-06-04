unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin,
  PrintersDlgs;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    chkMm: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    FloatSpinEdit1: TFloatSpinEdit;
    PageSetupDialog1: TPageSetupDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if chkMm.Checked then
    PageSetupDialog1.Units:= pmMillimeters
  else
    PageSetupDialog1.Units:= pmInches;

  if PageSetupDialog1.Execute then
  begin
    edit1.text:= inttostr(PageSetupDialog1.PageWidth);
    edit2.text:= inttostr(PageSetupDialog1.PageHeight);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
end;

end.

