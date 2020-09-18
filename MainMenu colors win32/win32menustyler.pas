{
Copyright (C) Alexey Torgashin, uvviewsoft.com
License: MPL 2.0 or LGPL
}
unit win32menustyler;

{$mode objfpc}{$H+}

interface

uses
  Windows, SysUtils, Classes, Graphics, Menus, Forms, LCLType;

type
  TWin32MenuStylerColors = record
    ColorBk: TColor;
    ColorBkSelected: TColor;
    ColorFont: TColor;
    ColorFontDisabled: TColor;
  end;

type
  { TWin32MenuStyler }

  TWin32MenuStyler = class
  private
    procedure HandleMenuDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
  public
    procedure ApplyToForm(AForm: TForm);
  end;

var
  MenuStylerColors: TWin32MenuStylerColors;
  MenuStyler: TWin32MenuStyler = nil;


implementation

procedure TWin32MenuStyler.ApplyToForm(AForm: TForm);
var
  menu: TMainMenu;
  mi: TMENUINFO;
begin
  menu:= AForm.Menu;
  if menu=nil then exit;

  menu.OwnerDraw:= true;
  menu.OnDrawItem:= @HandleMenuDrawItem;

  //this is to theme 2-3 pixel frame around menu popups
  FillChar(mi{%H-}, sizeof(mi), 0);
  mi.cbSize:= sizeof(mi);
  mi.fMask:= MIM_BACKGROUND or MIM_APPLYTOSUBMENUS;
  mi.hbrBack:= CreateSolidBrush(MenuStylerColors.ColorBk);
  SetMenuInfo(GetMenu(AForm.Handle), @mi);
end;

procedure TWin32MenuStyler.HandleMenuDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
var
  mi: TMenuItem;
  dx, dy: integer;
begin
  mi:= Sender as TMenuItem;

  if odDisabled in AState then
    ACanvas.Font.Color:= MenuStylerColors.ColorFontDisabled
  else
    ACanvas.Font.Color:= MenuStylerColors.ColorFont;

  if odSelected in AState then
    ACanvas.Brush.Color:= MenuStylerColors.ColorBkSelected
  else
    ACanvas.Brush.Color:= MenuStylerColors.ColorBk;

  dx:= 5;
  if not mi.IsInMenuBar then
    Inc(dx, 16);
  dy:= 2;

  ACanvas.FillRect(ARect);
  ACanvas.TextOut(ARect.Left+dx, ARect.Top+dy, mi.Caption);
end;

initialization

  MenuStyler:= TWin32MenuStyler.Create;

  with MenuStylerColors do
  begin
    ColorBk:= clDkGray;
    ColorBkSelected:= clNavy;
    ColorFont:= clWhite;
    ColorFontDisabled:= clMedGray;
  end;

finalization

  FreeAndNil(MenuStyler);

end.
