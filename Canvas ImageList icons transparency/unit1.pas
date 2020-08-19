unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    Panel1: TPanel;
    procedure Panel1Paint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Panel1Paint(Sender: TObject);
var
  c: TCanvas;
begin
  c:= panel1.Canvas;
  c.Brush.color:= clYellow;
  c.FillRect(panel1.ClientRect);

  ImageList1.Draw(c, 10, 10, 0);
  ImageList1.Draw(c, 40, 10, 1);
  ImageList1.Draw(c, 70, 10, 2);
  ImageList1.Draw(c, 100, 10, 3);

  ImageList2.Draw(c, 10, 40, 0);
  ImageList2.Draw(c, 60, 40, 1);
  ImageList2.Draw(c, 110, 40, 2);
end;

end.

