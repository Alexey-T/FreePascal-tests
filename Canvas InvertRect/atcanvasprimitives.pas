{
Copyright (C) Alexey Torgashin, uvviewsoft.com
License: MPL 2.0 or LGPL
}
unit ATCanvasPrimitives;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Graphics,
  Types,
  Math;

procedure CanvasInvertRect(C: TCanvas; const R: TRect; AColor: TColor);

implementation

var
  _Pen: TPen = nil;


procedure CanvasInvertRect(C: TCanvas; const R: TRect; AColor: TColor);
var
  X: integer;
  AM: TAntialiasingMode;
begin
  AM:= C.AntialiasingMode;
  _Pen.Assign(C.Pen);

  X:= (R.Left+R.Right) div 2;
  //C.Pen.Mode:= {$ifdef darwin} pmNot {$else} pmNotXor {$endif};
  C.Pen.Mode:= pmNotXor;
  C.Pen.Style:= psSolid;
  C.Pen.Color:= AColor;
  C.AntialiasingMode:= amOff;
  C.Pen.EndCap:= pecFlat;
  C.Pen.Width:= R.Width;

  C.MoveTo(X, R.Top);
  C.LineTo(X, R.Bottom);

  C.Pen.Assign(_Pen);
  C.AntialiasingMode:= AM;
  C.Rectangle(0, 0, 0, 0); //apply pen
end;


initialization
  _Pen:= TPen.Create;

finalization
  if Assigned(_Pen) then
    FreeAndNil(_Pen);

end.

