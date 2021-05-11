unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, Types, LCLType;

type

  { TForm1 }

  TForm1 = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ImageList1: TImageList;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Panel1Paint(Sender: TObject);
    procedure SpeedButton1Paint(Sender: TObject);
  private
    procedure DoPnt(C: TCanvas);

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.DoPnt(C: TCanvas);
begin
  C.Pen.Color:= clRed;
  C.Brush.Color:= clYellow;
  C.Rectangle(5, 5, 105, 40);
  ImageList1.Draw(C, 10, 10, 0);
  ImageList1.Draw(C, 40, 10, 1);
  ImageList1.Draw(C, 70, 10, 2);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  bmp: TBitmap;
  fn: string;
begin
  bmp:= TBItmap.Create;
  fn:= ExtractFilePath(APplication.ExeName)+'bmp1.bmp';
  if FileExists(fn) then
    bmp.LoadFromFile(fn);
  //bmp.Transparent:= false;
  bmp.TransparentColor:= clYellow;
  SpeedButton1.Glyph.Assign(bmp);
end;

procedure TForm1.Panel1Paint(Sender: TObject);
begin
  DoPnt(Panel1.Canvas);
end;

procedure TForm1.SpeedButton1Paint(Sender: TObject);
begin
  DoPnt(SpeedButton1.Canvas);
end;

end.

