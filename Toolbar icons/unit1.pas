unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ImageList1: TImageList;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  {$IFDEF LCLcocoa}
  caption := 'Cocoa';
  {$ENDIF}
  {$IFDEF LCLgtk2}
  caption := 'GTK2';
  {$ENDIF}
  {$IFDEF LCLgtk3}
  caption := 'GTK3';
  {$ENDIF}
  {$IFDEF LCLqt5}
  caption := 'QT5';
  {$ENDIF}
  {$IFDEF LCLwindows}
  caption := 'Windows';
  {$ENDIF}
end;

end.

