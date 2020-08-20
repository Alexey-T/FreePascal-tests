unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, CheckLst, ColorBox, Grids,
  ValEdit, ComCtrls, Spin, Arrow, Calendar, ShellCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Calendar1: TCalendar;
    CheckListBox1: TCheckListBox;
    ColorListBox1: TColorListBox;
    DrawGrid1: TDrawGrid;
    FloatSpinEdit1: TFloatSpinEdit;
    HeaderControl1: THeaderControl;
    Image1: TImage;
    Label1: TLabel;
    ListBox1: TListBox;
    ListView1: TListView;
    Memo1: TMemo;
    PaintBox1: TPaintBox;
    Panel1: TPanel;
    ShellListView1: TShellListView;
    ShellTreeView1: TShellTreeView;
    SpinEdit1: TSpinEdit;
    Splitter1: TSplitter;
    StaticText1: TStaticText;
    StringGrid1: TStringGrid;
    TrackBar1: TTrackBar;
    TreeView1: TTreeView;
    UpDown1: TUpDown;
    ValueListEditor1: TValueListEditor;
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

end.

