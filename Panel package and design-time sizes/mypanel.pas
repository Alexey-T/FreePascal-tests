{
Copyright (C) Alexey Torgashin, uvviewsoft.com
License: MPL 2.0 or LGPL
}

unit MyPanel;

{$ifdef FPC}
{$mode objfpc}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, Graphics, Controls, ExtCtrls, Types;

procedure Register;

type
  { TMyPanel }

  TMyPanel = class(TCustomControl)
  private
    FBorderWidth: integer; //new
    FBorderColor: TColor;
  public
    constructor Create(AOwner: TComponent); override;
    function CanFocus: boolean; override;
  protected
    procedure Paint; override;
    procedure Resize; override;
  published
    property Align;
    property Caption;
    property Color;
    property ParentColor;
    property Enabled;
    property Font;
    property Visible;
    property BorderColor: TColor read FBorderColor write FBorderColor default clBlack;
    property BorderWidth: integer read FBorderWidth write FBorderWidth default 0;
    property OnClick;
    property OnDblClick;
    property OnResize;
  end;


implementation

{ TMyPanel }

constructor TMyPanel.Create(AOwner: TComponent);
begin
  inherited;
  Width:= 150;
  Height:= 100;
  Caption:= '';
  Color:= clWhite;
  {$ifdef FPC}
  BorderStyle:= bsNone;
  {$endif}
  BorderWidth:= 0;
  BorderColor:= clBlack;
end;

function TMyPanel.CanFocus: boolean;
begin
  Result:= false;
end;

procedure TMyPanel.Paint;
var
  R: TRect;
  Pnt: TPoint;
  Size: TSize;
  i: integer;
begin
  //inherited;
  R:= ClientRect;

  Canvas.Brush.Style:= bsSolid;
  Canvas.Brush.Color:= Color;
  Canvas.FillRect(R);

  Canvas.Pen.Color:= BorderColor;
  for i:= 1 to BorderWidth do
  begin
    Canvas.Rectangle(R);
    InflateRect(R, -1, -1);
  end;

  if Caption<>'' then
  begin
    Canvas.Font.Assign(Self.Font);
    Size:= Canvas.TextExtent(Caption);
    Pnt.X:= (R.Right-Size.cx) div 2;
    Pnt.Y:= (R.Bottom-Size.cy) div 2;
    Canvas.TextOut(Pnt.X, Pnt.Y, Caption);
  end;
end;

procedure TMyPanel.Resize;
begin
  inherited Resize;
  Invalidate;
end;


procedure Register;
begin
  RegisterComponents('Misc', [
    TMyPanel
    ]);
end;


end.

