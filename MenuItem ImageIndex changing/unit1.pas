unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    N1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  with MenuItem2 do
  begin
    ImageIndex:= ImageIndex+1;
    if ImageIndex>=ImageList1.Count then
      ImageIndex:= 0;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  with MenuItem9 do
  begin
    ImageIndex:= ImageIndex+1;
    if ImageIndex>=ImageList1.Count then
      ImageIndex:= 0;
  end;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

end.

