unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormPaint(Sender: TObject);
begin
  Canvas.Font.Size := 12;

  Canvas.Font.Orientation := -9;
  Canvas.TextOut(10,10, 'This is almost one degree of rotation');

  Canvas.Font.Orientation := -10;
  Canvas.TextOut(10,40, 'This is exactly one degree of rotation');

  Canvas.Font.Orientation := -450;
  Canvas.TextOut(10,70, 'This is 45 degrees');
end;

end.

