unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  {$ifdef windows}
  Windows,
  {$endif}
  Menus, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    bToggle: TButton;
    bShowMenu: TButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    procedure bShowMenuClick(Sender: TObject);
    procedure bToggleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
  private
    FShowMenu: boolean;
    procedure SetShowMenu(AValue: boolean);

  public
    property ShowMenu: boolean read FShowMenu write SetShowMenu;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}


procedure MenuItem_Copy(ASrc, ADest: TMenuItem);
var
  mi: TMenuItem;
  i: integer;
begin
  ADest.Clear;
  ADest.Action:= ASrc.Action;
  ADest.AutoCheck:= ASrc.AutoCheck;
  ADest.Caption:= ASrc.Caption;
  ADest.Checked:= ASrc.Checked;
  ADest.Default:= ASrc.Default;
  ADest.Enabled:= ASrc.Enabled;
  ADest.Bitmap:= ASrc.Bitmap;
  ADest.GroupIndex:= ASrc.GroupIndex;
  ADest.GlyphShowMode:= ASrc.GlyphShowMode;
  ADest.HelpContext:= ASrc.HelpContext;
  ADest.Hint:= ASrc.Hint;
  ADest.ImageIndex:= ASrc.ImageIndex;
  ADest.RadioItem:= ASrc.RadioItem;
  ADest.RightJustify:= ASrc.RightJustify;
  ADest.ShortCut:= ASrc.ShortCut;
  ADest.ShortCutKey2:= ASrc.ShortCutKey2;
  ADest.ShowAlwaysCheckable:= ASrc.ShowAlwaysCheckable;
  ADest.SubMenuImages:= ASrc.SubMenuImages;
  ADest.SubMenuImagesWidth:= ASrc.SubMenuImagesWidth;
  ADest.Visible:= ASrc.Visible;
  ADest.OnClick:= ASrc.OnClick;
  ADest.OnDrawItem:= ASrc.OnDrawItem;
  ADest.OnMeasureItem:= ASrc.OnMeasureItem;
  ADest.Tag:= ASrc.Tag;

  for i:= 0 to ASrc.Count-1 do
  begin
    mi:= TMenuItem.Create(ASrc.Owner);
    MenuItem_Copy(ASrc.Items[i], mi);
    ADest.Add(mi);
  end;
end;

procedure Menu_Copy(ASrc, ADest: TMenu);
begin
  MenuItem_Copy(ASrc.Items, ADest.Items);
end;

{ TForm1 }

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Showmessage('dlg');
end;

procedure TForm1.bToggleClick(Sender: TObject);
begin
  ShowMenu:= not ShowMenu;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FShowMenu:= true;
end;

procedure TForm1.bShowMenuClick(Sender: TObject);
var
  P: TPopupMenu;
begin
  P:= TPopupMenu.Create(Self);
  Menu_Copy(MainMenu1, P);
  P.PopUp();
  P.Free;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  //OpenDialog1.Execute;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  //SaveDialog1.Execute;
end;

procedure TForm1.SetShowMenu(AValue: boolean);
begin
  FShowMenu:= AValue;
  {$ifdef windows}
  if AValue then
    Windows.SetMenu(Handle, MainMenu1.Handle)
  else
    Windows.SetMenu(Handle, 0);
  {$else}
  if AValue then
    Menu:= MainMenu1
  else
    Menu:= nil;
  {$endif}
end;

end.

