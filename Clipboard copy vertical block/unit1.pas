unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonCopy: TButton;
    Memo1: TMemo;
    procedure ButtonCopyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses Clipbrd, InterfaceBase;

{$R *.lfm}

const
  cATClipboardFormatId: integer = 0; //must be inited
  cATClipboardSignatureColBlock: integer = $1000;

{ TForm1 }

procedure TForm1.ButtonCopyClick(Sender: TObject);
begin
  Clipboard.AsText:= Memo1.Text;
  Clipboard.AddFormat(
    cATClipboardFormatId,
    cATClipboardSignatureColBlock,
    SizeOf(cATClipboardSignatureColBlock));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  caption:= 'Widgetset: '+GetLCLWidgetTypeName;
end;


initialization

  cATClipboardFormatId:= RegisterClipboardFormat('Application/X-Laz-ATSynEdit-Block');


end.

