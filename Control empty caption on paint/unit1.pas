unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, Menus, Types;

type

  { TMy }

  TMy = class(TCustomControl)
  protected
    procedure Paint; override;
    procedure Click; override;
  end;


  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    PopupMenu1: TPopupMenu;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fmy, fmy2, fmy3: TMy;
    pn: TPanel;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TMy }

procedure TMy.Paint;
var
  s: string;
begin
  s:= Caption;
  Canvas.brush.Color:= clyellow;
  Canvas.FillRect(ClientRect);
  Canvas.Font.Size:= 12;
  Canvas.Font.Color:= clGreen;
  Canvas.TextOut(2, 2, '['+s+']');
end;

procedure TMy.Click;
var
  p: TPoint;
begin
  inherited;
  p:= ClientToScreen(Point(0, Height));
  Form1.PopupMenu1.Popup(p.x, p.y);
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  fmy:= TMy.Create(Self);
  fmy.Parent:= Self;
  fmy.Left:= 50;
  fmy.Top:= 50;
  fmy.Width:= 150;
  fmy.Height:= 50;
  fmy.Caption:= 'some button here';

  pn:= TPanel.Create(Self);
  pn.Parent:= Self;
  pn.Align:= alRight;
  pn.Width:= 100;
  pn.color:= clGreen;
  pn.caption:= '??';

  fmy2:= TMy.Create(Self);
  fmy2.Parent:= pn;
  fmy2.Align:= alTop;
  fmy2.Caption:= 'more1';
  fmy2.Height:= 50;

  fmy3:= TMy.Create(Self);
  fmy3.Parent:= pn;
  fmy3.Align:= alBottom;
  fmy3.Caption:= 'more2';
  fmy3.Height:= 50;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  p: TPoint;
begin
  p:= Button1.ClientToScreen(Point(0, Button1.Height));
  Form1.PopupMenu1.Popup(p.x, p.y);
end;


end.

