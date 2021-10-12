unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TMy }

  TMy = class(TCustomControl)
  private
    b: TBitmap;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Paint; override;
  end;


var
  _flag: boolean;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TCheckBox;
    procedure Button1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    myPanel: TMy;

  public

  end;

var
  Form1: TForm1;

implementation

uses
  Types, LCLProc, LCLType;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  myPanel:= TMy.Create(Self);
  myPanel.Parent:= Self;
  myPanel.Align:= alClient;
  myPanel.BorderSpacing.Around:= 6;
end;

procedure TForm1.Button1Change(Sender: TObject);
begin
  _flag:= button1.Checked;
  myPanel.Invalidate;
end;

{ TMy }

constructor TMy.Create(AOwner: TComponent);
begin
  inherited;

  Caption:= '';
  ControlStyle:= ControlStyle+[csOpaque];
  DoubleBuffered:= true;
  DragMode:= dmManual; //required Manual
  ParentColor:= false; //better don't support ParentColor, it's mess in code
  Width:= 400;
  Height:= 35;

  b:= TBitmap.Create;
end;

procedure TMy.Paint;
var
  C: TCanvas;
  Rb: TRect;
begin
  b.SetSize(Width, Height);

  C:= b.Canvas;
  if _flag then
    C.AntialiasingMode:= amOn
  else
    C.AntialiasingMode:= amOff;

  Rb:= Rect(0, 0, b.Width, b.Height);

  C.Brush.Color:= clYellow;
  C.Pen.Color:= clRed;
  C.FillRect(Rb);
  C.Rectangle(Rb);

  InflateRect(Rb, -3, -3);
  C.Pen.Color:= clBlue;
  C.Rectangle(Rb);

  C.Brush.Color:= clRed;
  C.FillRect(6, 6, 20, 20);

  C.Line(20, 20, 80, 20);
  C.Line(80, 20, 80, 80);
  C.Line(20, 20, 20, 80);
  C.Line(20, 80, 80, 80);

  C.Frame(22, 22, 78, 78);

  C.Ellipse(20, 20, 80, 80);

  C.Polygon([Point(10, 110), Point(80,110), Point(40,220)]);

  C.PolyBezier([Point(110, 110), Point(180,110), Point(140,220), Point(90,20), Point(50,20)], true{filled});

  C.RadialPie(90, 90, 200, 200, 0, 500);

  Canvas.CopyRect(ClientRect, C, Rect(0, 0, b.Width, b.Height));
end;

{ TForm1 }



end.

