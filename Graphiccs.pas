unit Graphiccs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Spin, var_gbl;

type
  TGraphcs = class(TForm)
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    DrawLine: TButton;
    TrackBar1: TTrackBar;
    BaseColor: TSpinEdit;
    Trackcenter: TTrackBar;
    Trackrange: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    LoadImgFile: TButton;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    procedure DrawLineClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure LoadImgFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Graphcs: TGraphcs;
  Datos: Array [1..128,1..128] of Single;
  Range, Center: Integer;
  h: TIMGheader;
  F: TFileStream;
   
implementation

{$R *.DFM}

procedure TGraphcs.DrawLineClick(Sender: TObject);
var

miCol: TColor;

begin
Range:=TrackRange.Position;
Center:=TrackCenter.Position;

end;

procedure TGraphcs.TrackBar1Change(Sender: TObject);

var
miCol: TColor;


begin
PaintBox1.Canvas.Pen.Color:=Trackbar1.Position;
PaintBox1.Canvas.Pen.Width:=10;
PaintBox1.Canvas.Moveto(100,100);
PaintBox1.Canvas.Rectangle(0,0,100,100);
end;

procedure TGraphcs.LoadImgFileClick(Sender: TObject);
var
Ext: String;
h: TIMGHeader;
lectura: Word;
i: Integer;

begin

 if OpenDialog1.Execute then
 begin

   F:=TFileStream.Create(OpenDialog1.Filename,fmOpenRead) ;
   Ext:=UpperCase(ExtractFileExt(OpenDialog1.Filename)) ;
   F.Seek(0,soFromBeginning) ;

 if Ext = '.img' then
  begin
   for i:=1 to 1000 do
    begin
     F.Read(lectura,Sizeof(lectura));
     Label3.Caption:=InttoStr(lectura);
    end;
  end;
 F.Destroy;

 end;

 end;

end.
