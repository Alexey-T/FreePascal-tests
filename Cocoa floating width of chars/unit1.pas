unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    FontDialog1: TFontDialog;
    procedure Button1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
  public

  end;

var
  Form1: TForm1;

implementation

uses
  {$ifdef darwin}
  CocoaInt,
  {$endif}
  LCLProc, LCLType;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if FontDialog1.Execute then
  begin
    Self.Font.Assign(FontDialog1.Font);
    Invalidate;
  end;
end;

procedure TForm1.FormPaint(Sender: TObject);
var
  s, sres: string;
  w, h: double;
  i, xout, yout: integer;
begin
  Canvas.Font.Assign(Self.Font);
  for i:= 32 to 126 do
  begin
    s:= chr(i);
    {$ifdef darwin}
    CocoaWidgetSet.GetTextExtentPointF(Canvas.Handle, PChar(s), 1, w, h);
    {$else}
    w:= Canvas.GetTextWidth(s);
    h:= Canvas.GetTextHeight(s);
    {$endif}
    sres:= Format('"%s": %s, %s', [
      s,
      FormatFloat('0.###', w),
      FormatFloat('0.###', h)
      ]);
    xout:= (i-32) div 20 * 120;
    yout:= (i-32) mod 20 * 20;
    Canvas.TextOut(xout, yout, sres);
  end;
end;

end.

