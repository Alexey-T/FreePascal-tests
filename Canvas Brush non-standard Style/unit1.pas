unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, ExtCtrls, Buttons;

type

{ TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

const
  p1:TPoint=(x:1;y:1);
  p2:TPoint=(x:199;y:1);
  p3:TPoint=(x:100;y:160);

procedure TForm1.FormCreate(Sender: TObject);
begin
 with Image1.Canvas do
 begin
   Pen.Color:=clGreen;
   Brush.Color:=clGreen;
   Brush.Style:=TBrushStyle(5);
   Rectangle(Image1.ClientRect);

   Pen.Color:=clRed;
   Brush.Color:=clRed;
   Brush.Style:=TBrushStyle(4);
   Polygon([p1,p2,p3]);
 end;
end;

end.

