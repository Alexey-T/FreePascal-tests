unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type
  TForm2 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    CtlCount: integer;
    ListCount: integer;
  end;

type

  { TMyCtl }

  TMyCtl = class(TCustomControl)
  private
    Cnt: integer;
  public
    constructor Create(AOwner: TComponent); override;
  protected
    procedure Paint; override;
    procedure DoOnResize; override;
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TMyCtl }

constructor TMyCtl.Create(AOwner: TComponent);
begin
  inherited;
  //ControlStyle:= ControlStyle+[csOpaque, csDoubleClicks, csTripleClicks];
end;

procedure TMyCtl.Paint;
begin
  Inc(Cnt);
  Canvas.Pen.Color:= clNavy;
  Canvas.Brush.Color:= clMoneyGreen;
  Canvas.Rectangle(2, 2, Width-2, Height-2);
  Canvas.TextOut(10, 10, 'paints: '+IntToStr(Cnt));
end;

procedure TMyCtl.DoOnResize;
begin
  inherited DoOnResize;
  Invalidate;
end;

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.FormShow(Sender: TObject);
var
  i: integer;
  c: TMyCtl;
begin
  for i:= 1 to CtlCount do
  begin
    c:= TMyCtl.Create(Self);
    c.Parent:= Self;
    c.Align:= alTop;
    c.Height:= 90;
  end;
end;

end.

