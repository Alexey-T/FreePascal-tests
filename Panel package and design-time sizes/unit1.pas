unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, MyPanel;

type

  { TForm1 }

  TForm1 = class(TForm)
    MyPanel1: TMyPanel;
    MyPanel2: TMyPanel;
    MyPanel3: TMyPanel;
    MyPanel4: TMyPanel;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

end.

