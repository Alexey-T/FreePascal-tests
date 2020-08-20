unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Types;

type

  { TForm1 }

  TForm1 = class(TForm)
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      ARect: TRect; State: TOwnerDrawState);
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
  canvas.font.style:= [fsStrikeOut];
  canvas.font.name:= 'Courier';
  canvas.font.size:= 15;
  canvas.textout(20,20,'must be crossed...');
end;

procedure TForm1.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  ARect: TRect; State: TOwnerDrawState);
begin
  Listbox1.Canvas.Font.Style:= [fsStrikeOut];
  Listbox1.Canvas.Font.Color:= clRed;
  Listbox1.Canvas.Textout(ARect.Left, ARect.Top, Listbox1.Items[Index]);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ListBox1.Items.add('must be crossed, but is not');
  ListBox1.Items.add('two...');
end;

end.

