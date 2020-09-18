unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, LCLType;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses windows;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  mi: TMENUINFO;
begin
  Fillchar(mi, sizeof(mi), 0);
  mi.cbSize:= sizeof(mi);
  mi.fMask:= MIM_BACKGROUND or MIM_APPLYTOSUBMENUS;

  mi.hbrBack:= CreateSolidBrush(RGB(200,0,200));
  {
  mnuInfo.hbrBack = GetSysColorBrush(COLOR_ACTIVECAPTION);
  or
  mnuInfo.hbrBack = (HBRUSH) GetStockObject(DKGRAY_BRUSH);
  }

  SetMenuInfo(GetMenu(Handle), @mi);
end;

end.

