unit MiLee;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, xyyGraph, blqLoader,blqDataSet, Info, Spin,
  ComCtrls, Tabnotbk, auxgraph,var_gbl, Neighbors, Grids ;


type
//  TPoint = record
//      x,y:integer;
//    end;
  TConnection = record
      P1,P2:TPoint;
    end;
  TPart = record
      num:array of TPoint;
    end;
  TAngle = record
      i:integer;
      alpha:extended;
    end;
  TCircle = record
      a:boolean;
      r,mx,my:extended;
    end;
  TNeighbor = record
      P1:TPoint;
      num:array of TPoint;
      a:integer;
    end;
  TValProm = class(TForm)
    Button1: TButton;
    OpenFichero: TOpenDialog;
    SaveDialog1: TSaveDialog;
    TabbedNotebook1: TTabbedNotebook;
    DelGrpah: TButton;
    PlotXYZ0: TCheckBox;
    PlotXYZCorner: TCheckBox;
    PlotDifference: TCheckBox;
    Plottout: TCheckBox;
    Button2: TButton;
    ColorDialog1: TColorDialog;
    SaveIMGFile: TCheckBox;
    Points: TLabel;
    PointNr: TLabel;
    Label6: TLabel;
    DataNr: TLabel;
    Label7: TLabel;
    LinesNr: TLabel;
    Deriva: TCheckBox;
    PDeriva: TEdit;
    CorrigeOffset: TCheckBox;
    Offset: TEdit;
    Label4: TLabel;
    Skip: TLabel;
    SpinSkip: TSpinEdit;
    Promedia: TLabel;
    PromAround0: TEdit;
    PromBegin: TEdit;
    a: TLabel;
    PromEnd: TEdit;
    Label5: TLabel;
    TomaCurvas: TRadioGroup;
    Label3: TLabel;
    CortaDebajode: TEdit;
    Label8: TLabel;
    CortaEncimade: TEdit;
    Label9: TLabel;
    AjustaA: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    NroLinea: TLabel;
    NroDato: TLabel;
    Label2: TLabel;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    RichEdit1: TRichEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Button5: TButton;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    Button6: TButton;
    Merge_f: TButton;
    TabbedNotebook2: TTabbedNotebook;
    xyyGraph2: TxyyGraph;
    DiffAjust: TxyyGraph;
    SpinPlotLine: TSpinEdit;
    Label22: TLabel;
    Label20: TLabel;
    SpinData: TSpinEdit;
    Label21: TLabel;
    xyyGraph1: TxyyGraph;
    xyyGraphCorner: TxyyGraph;
    xyyGraph4: TxyyGraph;
    Label23: TLabel;
    Promaround_: TEdit;
    Label24: TLabel;
    PaintBox2: TPaintBox;
    ReadAsciiSaveImg: TButton;
    Button7: TButton;
    Button3: TButton;
    Button8: TButton;
    Button9: TButton;
    ImageData: TxyyGraph;
    Button10: TButton;
    Button11: TButton;
    SpinEdit1: TSpinEdit;
    Label25: TLabel;
    Button12: TButton;
    Label26: TLabel;
    Label27: TLabel;
    Edit1: TEdit;
    Button13: TButton;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    RadioGroup1: TRadioGroup;
    Button14: TButton;
    CheckDrawCurve: TCheckBox;
    Edit2: TEdit;
    Label31: TLabel;
    Button15: TButton;
    FixPtNrc: TCheckBox;
    FixPtNr: TEdit;
    Label33: TLabel;
    Edit3: TEdit;
    Label34: TLabel;
    Edit4: TEdit;
    Label35: TLabel;
    Edit5: TEdit;
    Label36: TLabel;
    Edit6: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Edit7: TEdit;
    Label32: TLabel;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    SpinEdit2: TSpinEdit;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    CheckBox3: TCheckBox;
    Edit8: TEdit;
    BaseLine: TCheckBox;
    CheckBox4: TCheckBox;
    Edit9: TEdit;
    Label1: TLabel;
    Edit10: TEdit;
    Label41: TLabel;
    Edit11: TEdit;
    Label46: TLabel;
    mV: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    SpinEdit3: TSpinEdit;
    Button22: TButton;
    SaveDialog2: TSaveDialog;
    Label50: TLabel;
    Label51: TLabel;
    Button23: TButton;
    Label52: TLabel;
    Label53: TLabel;
    CheckBox5: TCheckBox;
    RadioGroup2: TRadioGroup;
    SpinEdit4: TSpinEdit;
    Label54: TLabel;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Image1: TImage;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    SpinEdit5: TSpinEdit;
    Label56: TLabel;
    Label57: TLabel;
    Label55: TLabel;
    Button30: TButton;
    Button31: TButton;
    Edit12: TEdit;
    Label58: TLabel;
    Edit13: TEdit;
    Label59: TLabel;
    Label60: TLabel;
    NeighborButton: TButton;
    TrackBar3: TTrackBar;
    TrackBar4: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure DelGrpahClick(Sender: TObject);
    procedure DerivaRectas (vin:vcurva; var vout:vcurva);
    procedure ReadAsciiSaveImgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PlotLine(GraphNr: Integer;GraphColor: TColor; Val: Double);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Merge_fClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure PaintBox2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
//    procedure PaintBox2DblClick(Sender: TObject);
    procedure PaintBox2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button14Click(Sender: TObject);
    procedure PaintBox2DblClick(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure NeighborButtonClick(Sender: TObject);
private
    { Private declarations }
    procedure Plotiv(Sender: TObject; X,Y: Integer);

  public
    { Public declarations }
    procedure SetLengthofStr(Sender: TObject; MyLength: Integer; var MyString: String);
  end;

var
  ValProm: TValProm;
   b : TblqLoader ;
   DS : TblqDataSet ;


implementation

uses Graphiccs, BCSFit, HeaderSPM, Math, MiFunc;

     {$R *.DFM}

var
  MyGraphNr: Integer;
  MiPosXY: Array[0..1024,0..1024] of string;
  MiMoment: Double;
  MiTime: Double;
  MiComment: String;
  DatatoPaint: Array[0..1024,0..1024] of Integer;
  Max, Min, Center: Double;
  DatatoPlotinFile: Array[0..1024,0..1024] of Single;  // variable con los datos buenos (ficheros)
  DatatoPlotinGraph: Array[0..1024,0..1024] of Single; // con datos arreglados para que quepan en 256x256
  GuardaDato: Array[0..2000,0..2000] of Double;  // Buffer de tratamiento de datos
  SizeofImgNumber: Integer;    // El tamaño de imagen (256 o 64 o 32
  MiFindX,MiFindY: Integer;
  F: TFileStream;
  h: TIMGheader;
  XStartforLine,YStartforLine,XEndforLine,YEndforLine: Integer;
  LinePainted: Boolean;
  b_xx_tot: Array[0..256,0..512,0..512] of Single;
  b_yy_tot: Array[0..256,0..512,0..512] of Single;
  b_xx_treat_tot: Array[0..256,0..512,0..512] of Single;
  b_yy_treat_tot: Array[0..256,0..512,0..512] of Single;
  DataWsxmtoPlotinFile: Array[0..1024,0..1024] of SmallInt;  // variable con los datos buenos (ficheros)
  //MaxMin_ofImg, Center_ofImg: Double;
  FExist:boolean;

procedure TValProm.Button1Click(Sender: TObject);
var
  b_xx: Array[0..100000] of Extended;
  b_yy: Array[0..100000] of Extended;
  CurvaADerivar: vcurva;
  CurvaDerivada: vcurva;
   NumRead,i: Integer;
   Buf : Double;
   j,k,kk,ll,l,m,MiPos,cont,conta2,MiLinesNr,MiDataNr: Longint;
   Ff: TextFile;
//   F: TFileStream;
   Ext,MiFile : string;
   w : smallint ;
   Prom: Double;
//   h: TIMGheader;
   //h: TIMG_Cab;
   ValorCortadeb,ValorCortaenc,ValorAjusta: Double;
   Skipfirstblqs: Integer;

  blqname : string ;
  b_offset: Integer;
  N_puntos,ii,Linea,Offset_Van: Integer;
  b_z0: Array[0..1024,0..1024] of Single;
  b_zcorner: Array[0..1024,0..1024] of Single;
  b_difference: Array[0..1024,0..1024] of Single;
  ww: Single;
  SearchinStr: string;
  ValFound: single;
  promaround_val,promaround0val,offsetval,PromBeginval,PromEndval: Double;
  ChkBox1Chkd,ChkBox2Chkd,CorrigeOffsetChkd, DerivaChkd: Boolean;
  TomaCurvItemIndex,SpinDataVal,SpinPlotLineVal: Integer;

  begin

 if Button1.Caption='Working ... Push to stop' then
    begin
    Button1.Caption:='GO';
    exit;
    end;
N_Puntos:=0;
if OpenFichero.Execute then
begin
//j:=1;

  // ABRIR FICHERO
  F:=TFileStream.Create(Openfichero.Filename,fmOpenRead) ;
  Ext:=UpperCase(ExtractFileExt(Openfichero.Filename)) ;
  F.Seek(0,soFromBeginning) ;
  Label2.Caption:=ExtractFileName(Openfichero.Filename);
  Label49.Caption:=ExtractFileName(Openfichero.Filename);
  Label50.Caption:=ExtractFileDir(Openfichero.Filename);
  Button1.Caption:='Working ... Push to stop';

if Ext = '.BLQ' then
begin
F.Destroy;

blqname:=Openfichero.Filename;

  InfoForm.Mensaje.Caption:='Loading BLQ...' ;
  InfoForm.Show ;
  InfoForm.Refresh ;
  b.SelectBlockFile(blqname) ;
  InfoForm.Close ;

  Skipfirstblqs:=SpinSkip.Value;
  if (Skipfirstblqs>0) then
   begin
    for k:=0 to Skipfirstblqs-1 do
      begin
         b_offset:=b.GetEntryOffset(k) ;
         LoadDataSetFromBlock(blqname,b_offset,DS) ;
      end;

   PointNr.Caption:=InttoStr(b.Count-Skipfirstblqs);
   end
  else  PointNr.Caption:=Inttostr(b.Count);

 if (checkbox2.checked) then N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/2))
  else N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/4));
  //N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/4));
  if (FixPtNrc.Checked) then N_puntos:=StrtoInt(FixPtNr.Text);
  Label6.Caption:=InttoStr(N_puntos);

  offsetval:=StrtoFloat(Offset.Text);
  promaround_val:=StrtoFloat(PromAround_.Text);
  promaround0val:=StrtoFloat(PromAround0.Text);
  PromBeginval:= StrtoFloat(PromBegin.Text);
  PromEndval:= StrtoFloat(PromEnd.Text);
  SpinDataVal:=SpinData.Value;
  SpinPlotLineVal:=SpinPlotLine.Value;
  ChkBox2Chkd:=checkbox2.checked;
  TomaCurvItemIndex:=Tomacurvas.Itemindex;
  CorrigeOffsetChkd:=CorrigeOffset.Checked;
  DerivaChkd:=Deriva.checked;


  for k:=0 to N_puntos-1 do
     begin
     NroLinea.Caption:=InttoStr(k);
     Application.ProcessMessages;
// IDA Y VUELTA DE TODA UNA LINEA EN X

 if (ChkBox2Chkd) then Linea:=N_puntos-1 else Linea:=2*N_puntos-1;
 if (ChkBox2Chkd) then Offset_Van:=k*2*N_Puntos else Offset_Van:=k*2*2*N_Puntos;

     for l:=0 to Linea do
        begin
         NroDato.Caption:=InttoStr(l);
         //if Button1.Caption='GO' then exit;
         Application.ProcessMessages;
         /// Lee pares si toca
         if ((TomaCurvItemIndex=0) or (TomaCurvItemIndex=2)) then
          begin
           b_offset:=b.GetEntryOffset(Offset_Van+2*l) ;
           LoadDataSetFromBlock(blqname,b_offset,DS) ;
           Points.Caption:=InttoStr(DS.nrows);
           MiPosXY[k,l]:=Ds.Comment;
           if (l=0) and (k=0) then MiMoment:=DS.Moment;
           if (l=2*N_puntos-1) and (k=N_Puntos-1) then  MiTime:=DS.Moment-MiMoment;
           ii:=0;
            for i:=0 to DS.nrows-1 do
              begin
               b_yy[i]:=DS[1].Value[i];
               b_xx[i]:=DS[0].Value[i];
              end;
          end;
         // lee tambien impares
         if (TomaCurvItemIndex=1) then
           begin
            b_offset:=b.GetEntryOffset(Offset_Van+(2*l+1)) ;
            LoadDataSetFromBlock(blqname,b_offset,DS) ;
            Points.Caption:=InttoStr(DS.nrows);
            MiPosXY[k,l]:=Ds.Comment;

               for i:=0 to DS.nrows-1 do
                begin
                 b_yy[i]:=DS[1].Value[i];  // menos porque ida y vuelta
                 b_xx[i]:=DS[0].Value[i];  // menos porque ida y vuelta
                end;
           end;
         // Lee pares y promedia si hay que hacerlo
            if (TomaCurvItemIndex=2) then
              begin
               b_offset:=b.GetEntryOffset(Offset_Van+2*l+1) ;
               LoadDataSetFromBlock(blqname,b_offset,DS) ;
               Points.Caption:=InttoStr(DS.nrows);

               for i:=0 to DS.nrows-1 do
                begin
                 b_yy[i]:=(DS[1].Value[DS.nrows-1-i]+b_yy[i])/2;
                 b_xx[i]:=(DS[0].Value[DS.nrows-1-i]+b_xx[i])/2;
                end;
              end;
           for i:=0 to DS.nrows-1 do
            begin
             b_yy[i]:=1e9*b_yy[i];  // nA
             b_xx[i]:=1e3*b_xx[i];  // mV
            end;


         // terminado de leer la curva
         // Corrige Offset
         //offsetval:=StrtoFloat(Offset.Text);
         if (CorrigeOffsetChkd) then
           begin
           for i:=0 to DS.nrows-1 do
            begin
              b_xx[i]:=b_xx[i]-offsetval;
            end;
           end;
        // YA TIENE LOS DATOS DE UN PUNTO EN b
        //  AHORA A DERIVAR !
        if (DerivaChkd) then
         begin
          CurvaADerivar.n:=DS.Nrows;
          for i:=0 to DS.nrows-1 do
                begin
                CurvaADerivar.x[i]:=b_xx[i];
                CurvaADerivar.y[i]:=b_yy[i];
                end;
          DerivaRectas(CurvaAderivar,CurvaDerivada);
          for i:=0 to DS.nrows-1 do
                begin
                //Application.ProcessMessages;
                b_xx[i]:=CurvaDerivada.x[i];
                b_yy[i]:=CurvaDerivada.y[i];
                end;
         end;
         // YA tengo la derivada
         // CALCULO PROMEDIO ALREDEDOR DE EL Valor que pone en Promaround_
        prom:=0;
        cont:=0;
        //promaround_val:=StrtoFloat(PromAround_.Text);
        //promaround0val:=StrtoFloat(PromAround0.Text);
         for j:=0 to DS.nrows-1 do
          begin
         if (Abs(b_xx[j]-promaround_val)<promaround0val)  then
           begin
             Prom:=Prom+b_yy[j];
             cont:=cont+1;
           end;
          end;
         if (cont<=0) then cont:=1;
         b_z0[k,l]:=Prom/cont;
         // YA TENGO PROMEDIOS. k,l me da el punto en la imagen

         // PROMEDIO ALREDEDOR DE LA ESQUINA
         cont:=0;    // contador de promedios
         Prom:=0;
         //PromBeginval:= StrtoFloat(PromBegin.Text);
         //PromEndval:= StrtoFloat(PromEnd.Text);

         for j:=0 to DS.nrows-1 do
            begin
             if (Abs(b_xx[j])>PromBeginval)
                and (Abs(b_xx[j])<PromEndval) then
                begin
                Prom:=Prom+b_yy[j];
                cont:=cont+1;
                end;
            end;  // for j
          if (cont<=0) then cont:=1;
          b_zcorner[k,l]:=Prom/cont;

         // DIFERENCIA
          if  (b_zcorner[k,l]<>0) then
           b_difference[k,l]:=(b_zcorner[k,l]-b_z0[k,l])/b_zcorner[k,l]
          else b_difference[k,l]:=0;

         // Pinto las treinta primeras
         if ((l<SpinDataVal) and (k<SpinPlotLineVal)) then
           begin
             xyyGraph1[k*l].Color:=clBlack+30000*l;
             for i:=0 to DS.nrows-1 do
              begin
              if  (b_zcorner[k,l]<>0) then
                xyyGraph1[k*l].Addpoint(b_xx[i],b_yy[i]/b_zcorner[k,l])
              else xyyGraph1[k*l].Addpoint(b_xx[i],0);
              end;
             PlotLine(500,ClRed,promaround_val+StrtoFloat(PromAround0.Text));
             PlotLine(501,ClRed,promaround_val-StrtoFloat(PromAround0.Text));
             PlotLine(502,ClBlue,PromBeginval);
             PlotLine(503,ClBlue,-PromBeginval);
             PlotLine(504,ClGreen,PromEndval);
             PlotLine(505,ClGreen,-PromEndval);
          end;

     end; // for de l
    end;  // for de k

     if(PlotXYZCorner.checked) then
       for k:=0 to N_Puntos-1 do
       begin
         begin
          for l:=0 to 2*N_puntos-1 do
          xyyGraph2[MyGraphNr].Addpoint(l+k*2*N_Puntos,b_zcorner[k,l]);
         end;
       end;
     if(PlotXYZ0.checked) then
       begin
        for k:=0 to N_Puntos-1 do
         begin
          for l:=0 to 2*N_puntos-1 do
          xyyGraphCorner[MyGraphNr].Addpoint(l+k*2*N_Puntos,b_z0[k,l]);
         end;
       end;
     if(PlotDifference.checked) then
       for k:=0 to N_Puntos-1 do
       begin
         begin
          for l:=0 to 2*N_puntos-1 do
          xyyGraph4[MyGraphNr].Addpoint(l+k*2*N_Puntos,b_difference[k,l]);
         end;
       end; // if Plotdiff


  ValorCortadeb:=StrtoFloat(CortaDebajode.Text);
//  if (ValorCortadeb<-100) or (ValorCortadeb>100) then ValorCortadeb:=-100;
  ValorCortaenc:=StrtoFloat(CortaEncimade.Text);
//  if (ValorCortaenc<-100) or (ValorCortaenc>100) then ValorCortaenc:=100;
  ValorAjusta:=StrtoFloat(AjustaA.Text);
//  if (ValorAjusta<-100) or (ValorAjusta>100) then ValorAjusta:=100;
      ChkBox1Chkd:=CheckBox1.checked;

       for k:=0 to N_Puntos-1 do
         begin
          for l:=0 to 2*N_puntos-1 do
            begin
            if (b_difference[k,l]<ValorCortadeb) or (b_difference[k,l]>ValorCortaenc) then
                begin
                 if (ChkBox1Chkd=True) then b_difference[k,l]:=ValorAjusta
                 else
                 begin
                 if (l=0)
                        then
                          begin
                          if (b_difference[k,l+1]>ValorCortadeb) and (b_difference[k,l+1]<ValorCortaenc) then
                                 b_difference[k,l]:=b_difference[k,l+1]
                                else b_difference[k,l]:=ValorAjusta;
                          end
                 else b_difference[k,l]:=b_difference[k,l-1];
                 end;
                 end;
            end;
         end;

        for k:=0 to N_Puntos-1 do
         begin
          for l:=0 to 2*N_puntos-1 do
          DiffAjust[1].Addpoint(l+k*2*N_Puntos,b_difference[k,l]);
         end;


end;  // Fin ext = BLQ
end;  // Fin Opendialog

 if(SaveIMGFile.checked) then
        begin
        SaveDialog1.FilterIndex:=2;
        if SaveDialog1.Execute then
        begin
        MiFile:=SaveDialog1.Filename+ 'i' + '.img';
        F:=TFileStream.Create(MiFile,fmCreate) ;
        h.identif:=$00333333;
        h.version:=$00010000;
        h.day:=1;
        h.month:=1;
        h.year:=2002;
        h.moment:=MiMoment/60/60;  // in hours of the day
        h.time:=MiTime/60;      // in minutes

        if (RadioGroup2.ItemIndex=0) then begin
        SetLength(SearchinStr,12);
        SearchinStr:=Copy(MiPosXY[0,0],(Pos('X:',MiPosXY[0,0]))+2,10);
        if (SearchinStr[1]='-') then
           SearchinStr:=Copy(MiPosXY[0,0],(Pos('X:',MiPosXY[0,0]))+2,11);
        h.xstart:=StrtoFloat(SearchinStr)/2;
        SearchinStr:=Copy(MiPosXY[N_Puntos-1,N_Puntos],(Pos('X:',
            MiPosXY[N_Puntos-1,N_Puntos-1]))+2,10);
        if (SearchinStr[1]='-') then
            SearchinStr:=Copy(MiPosXY[N_Puntos-1,N_Puntos],(Pos('X:',
            MiPosXY[N_Puntos-1,N_Puntos-1]))+2,11);
         h.xend:=StrtoFloat(SearchinStr)/2;
        SearchinStr:=Copy(MiPosXY[0,0],(Pos('Y:',MiPosXY[0,0]))+2,10);
        if (SearchinStr[1]='-') then
           SearchinStr:=Copy(MiPosXY[0,0],(Pos('Y:',MiPosXY[0,0]))+2,11);
        h.ystart:=StrtoFloat(SearchinStr)/2;
        SearchinStr:=Copy(MiPosXY[N_Puntos-1,N_Puntos-1],(Pos('Y:',
            MiPosXY[N_Puntos-1,N_Puntos-1]))+2,10);
        if (SearchinStr[1]='-') then
           SearchinStr:=Copy(MiPosXY[N_Puntos-1,N_Puntos-1],(Pos('Y:',
            MiPosXY[N_Puntos-1,N_Puntos-1]))+2,11);
        h.yend:=StrtoFloat(SearchinStr)/2;
        end
        else
        begin
        h.xstart:=StrtoFloat(Edit3.Text)*1e-8;
        h.xend:=StrtoFloat(Edit4.Text)*1e-8;;
        h.ystart:=StrtoFloat(Edit5.Text)*1e-8;;
        h.yend:=StrtoFloat(Edit6.Text)*1e-8;;
        end;

        h.xn:=N_Puntos;
        h.yn:=N_Puntos;

        MiComment:='Image calculated the '+DatetoStr(Date)+' at '+
        TimetoStr(Time)+' '#13#10+
        'from the IV curves with'#13#10+
        'BLQ File Name :'+Label2.Caption+#13#10+
        'Mean of V below'+
        PromAround0.Text
        +'mV'+#13#10+'norm. to mean from '
        +PromBegin.Text+
        'mV to '+
        PromEnd.Text+' mV'+#13#10;
        if (TomaCurvas.ItemIndex=0) then MiComment:=MiComment+'Only even'#13#10;
        if (TomaCurvas.ItemIndex=1) then MiComment:=MiComment+'Only odd'#13#10;
        if (TomaCurvas.ItemIndex=2) then MiComment:=MiComment+'Even and odd'#13#10;
        MiComment:=MiComment+
        'Voltage offest of '+Offset.Text+' mV substracted'#13#10+
        'Cut below of '+Cortadebajode.Text+#13#10+
        'Cut above of '+Cortaencimade.Text+#13#10+
        'Adjusted to'+AjustaA.Text+#13#10+
        'Begins at file : '#13#10+MiPosXY[0,0]+#13#10+
        'Ends at file : '#13#10+MiPosXY[N_Puntos-1,N_Puntos-1];
        if (Length(MiComment)>512) then SetLength(MiComment,512);

        for k:=1 to (Length(MiComment)-5) do h.comment[k]:=MiComment[k];

        RichEdit1.Text:='';
        for l:=0 to 511 do
          begin
           RichEdit1.Text:=RichEdit1.Text+h.comment[l];
          end;
        Label15.Caption:=InttoStr(Round(h.Time));
        Label16.Caption:=InttoStr(Round(h.Moment));
        Label17.Caption:=FloattoStr(h.yn);

        F.WriteBuffer(h,Sizeof(h));

 // Ida

        for k:=0 to N_Puntos-1 do
         begin
         for l:=0 to N_Puntos-1 do F.Write(b_difference[k,l],4);
         end;
        F.Destroy;

// Ida low voltage
        MiFile:=SaveDialog1.Filename+ 'i_l' + '.img';
        F:=TFileStream.Create(MiFile,fmCreate) ;
        F.WriteBuffer(h,Sizeof(h));

         for k:=0 to N_Puntos-1 do
         begin
         for l:=0 to N_Puntos-1 do F.Write(b_z0[k,l],4);
         end;
         F.Destroy;

// Ida high voltage
        MiFile:=SaveDialog1.Filename+ 'i_h' + '.img';
        F:=TFileStream.Create(MiFile,fmCreate) ;
        F.WriteBuffer(h,Sizeof(h));

         for k:=0 to N_Puntos-1 do
         begin
         for l:=0 to N_Puntos-1 do F.Write(b_zcorner[k,l],4);
         end;
         F.Destroy;


        MiFile:=SaveDialog1.Filename + 'i'+'.txt';
        AssignFile(Ff,MiFile);
        Rewrite(Ff);
        for k:=0 to N_Puntos-1 do
         begin
         for l:=0 to N_Puntos-1 do
          Writeln(Ff,b_difference[k,l]);
         end;
        CloseFile(Ff);

// vuelta

        MiFile:=SaveDialog1.Filename+ 'v' + '.img';
        F:=TFileStream.Create(MiFile,fmCreate) ;
        F.WriteBuffer(h,Sizeof(h));

        for k:=0 to N_Puntos-1 do
         begin
         for l:=2*N_Puntos-1 downto N_Puntos do F.Write(b_difference[k,l],4);
         end;
        F.Destroy;

// vuelta low voltage
        MiFile:=SaveDialog1.Filename+ 'v_l' + '.img';
        F:=TFileStream.Create(MiFile,fmCreate) ;
        F.WriteBuffer(h,Sizeof(h));

        for k:=0 to N_Puntos-1 do
         begin
         for l:=2*N_Puntos-1 downto N_Puntos do F.Write(b_z0[k,l],4);
         end;
        F.Destroy;

// vuelta high voltage
        MiFile:=SaveDialog1.Filename+ 'v_h' + '.img';
        F:=TFileStream.Create(MiFile,fmCreate) ;
        F.WriteBuffer(h,Sizeof(h));

        for k:=0 to N_Puntos-1 do
         begin
         for l:=2*N_Puntos-1 downto N_Puntos do F.Write(b_zcorner[k,l],4);
         end;
        F.Destroy;


        MiFile:=SaveDialog1.Filename + 'v'+'.txt';
        AssignFile(Ff,MiFile);
        Rewrite(Ff);
        for k:=0 to N_Puntos-1 do
         begin
         for l:=2*N_Puntos-1 downto N_Puntos do
          Writeln(Ff,b_difference[k,l]);
         end;
        CloseFile(Ff);

        end;  // savedialog1 execute
        end; // Save IMG File



Button1.Caption:='GO';


end;


procedure TValProm.DelGrpahClick(Sender: TObject);
begin
xyyGraph1.clear;
xyyGraph2.clear;
xyyGraphCorner.clear;
xyyGraph4.clear;
DiffAjust.clear;
end;


PROCEDURE TValProm.DerivaRectas (vin:vcurva; var vout:vcurva);{( x,y: vector; m: integer;
                         VAR x0,y0: vector; VAR tot0: integer );}

    { la curva derivada sale en x0,y0,... y longitud  tot0 }


var       i,o,np,m,tot0                       : integer;
          sx,sy,sx2,sxy,b,bb,cc,nps           : double;{single;}

begin
//pderi:=StrtoInt(PDeriva.Text);

m:=vin.n;
//tot0:=vout.n;
if pderi=0 then begin
     FOR I:=0 TO M-1 do begin
        vout.x[i]:=0.5*(vin.x[i]+vin.x[i+1]);
        if (vin.x[i]-vin.x[i+1])<>0 then vout.y[i]:=(vin.y[i]-vin.y[i+1])/(vin.x[i]-vin.x[i+1]);
        end;
        vout.x[M]:=vout.x[m-1];vout.y[m]:=vout.y[m-1];
end else begin
     FOR I:=0 TO M-1 do begin
          (* minimos cuadrados*)
          SX:=0;SY:=0;SXY:=0;SX2:=0;np:=0;
          FOR O:=(i-pderi) TO (i+pderi) do begin
            if ( (o>0) and (o<=M)) then begin
               inc(np);
               (* nuevo, para ajuste alrd 0,0 *)
               SX:=SX+(vin.X[o]-vin.x[i]);
               SY:=SY+(vin.Y[o]-vin.y[i]);
               SXY:=SXY+(vin.X[o]-vin.x[i])*(vin.y[o]-vin.Y[i]);
               SX2:=SX2+sqr(vin.X[o]-vin.x[i]);
               end;
          end;
          nps:=1.0*np;
          bb:=((nps*SXY)-(SX*SY));
          cc:=((nps*SX2)-(SX*SX));
          if abs(cc)<1e-10  then b:=1e10 else b:=bb/cc;
          vout.x[i]:=vin.x[i];
          //if b <> 0. then vout.y[i]:=1./( RRS + (1./(1e3*b)) ) else vout.y[i]:=1e3*b;
          //vout.y[i]:=1e3*b;
          vout.y[i]:=b;
          tot0:=M;
          vout.n:=tot0;

     end;
end;{pderi >o}

end;  { de DerivaRectas }


procedure TValProm.ReadAsciiSaveImgClick(Sender: TObject);
var
   Ff: TextFile;
   MiFile : string;
   k,l,N_puntos: Integer;
   b_difference: Array[0..256,0..256] of Single;

begin

N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/4));

if OpenFichero.Execute then
    begin
    MiFile:=OpenFichero.Filename;
    AssignFile(Ff,MiFile);
    Reset(Ff);
        for k:=0 to N_Puntos-1 do
         begin
         for l:=0 to N_Puntos-1 do
          Readln(Ff,b_difference[k,l]);
         end;
    CloseFile(Ff);
    end;  //Openfichero.Execute

if(SaveIMGFile.checked) then
        begin
        SaveDialog1.FilterIndex:=2;
        if SaveDialog1.Execute then
        begin
        MiFile:=SaveDialog1.Filename+ 'i' + '.img';
        F:=TFileStream.Create(MiFile,fmCreate) ;
        h.identif:=$00333333;
        h.version:=$00010000;
        h.day:=1;
        h.month:=1;
        h.year:=2002;
        h.moment:=MiMoment/60/60;  // in hours of the day
        h.time:=MiTime/60;      // in minutes
        h.yend:=0;
        h.xstart:=0;
        h.xend:=0;
        h.ystart:=0;
        h.yend:=0;
        h.xn:=N_Puntos;
        h.yn:=N_Puntos;
        MiComment:='imagen trafic';
        for k:=1 to (Length(MiComment)-5) do h.comment[k]:=MiComment[k];

        RichEdit1.Text:='';
        for l:=0 to 511 do
          begin
           RichEdit1.Text:=RichEdit1.Text+h.comment[l];
          end;
        F.WriteBuffer(h,Sizeof(h));

        for k:=0 to N_Puntos-1 do
         begin
         for l:=0 to N_Puntos-1 do F.Write(b_difference[k,l],4);
         end;
        F.Destroy;
        end; // savedialog
    end; //saveclick
end;

procedure TValProm.FormCreate(Sender: TObject);
begin
 b:=TblqLoader.Create(Self) ;
 MyGraphNr:=1;
end;

procedure TValProm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  b.Free ;
end;

procedure TValProm.Button3Click(Sender: TObject);
begin
Graphcs.Show;
end;

procedure TValProm.Button2Click(Sender: TObject);
begin
if ColorDialog1.Execute then
 begin
  MyGraphNr:=MyGraphNr+1;
  xyyGraph1[MyGraphNr].Color:=ColorDialog1.Color;
  xyyGraphCorner[MyGraphNr].Color:=ColorDialog1.Color;
  xyyGraph2[MyGraphNr].Color:=ColorDialog1.Color;
  DiffAjust[MyGraphNr].Color:=ColorDialog1.Color;
  xyyGraph4[MyGraphNr].Color:=ColorDialog1.Color;

 end;
end;

procedure TValProm.PlotLine(GraphNr: Integer;GraphColor: TColor; Val: Double);
var
i: Integer;

begin
  xyyGraph1[GraphNr].Color:=GraphColor;
  xyyGraph1[GraphNr].PlotPoints:=False;
  for i:=1 to 40 do xyyGraph1[GraphNr].Addpoint(Val,i/30);
end;

procedure TValProm.Button4Click(Sender: TObject);
var
   Ext : string;
   l,k: Longint;
   Comentario: string;
begin

if OpenDialog1.Execute then
 begin
  // ABRIR FICHERO
  F:=TFileStream.Create(OpenDialog1.Filename,fmOpenRead) ;
  Ext:=UpperCase(ExtractFileExt(OpenDialog1.Filename)) ;
  F.Seek(0,soFromBeginning) ;
  Label2.Caption:=ExtractFileName(OpenDialog1.Filename);
  Label49.Caption:=ExtractFileName(OpenDialog1.Filename);
  Label50.Caption:=ExtractFileDir(OpenDialog1.Filename);

  if Ext = '.IMG' then
   begin
    F.ReadBuffer(h,Sizeof(h));
    SetLength(Comentario,Sizeof(h.Comment));
    RichEdit1.Text:='';
    for l:=0 to 511 do
     begin
      RichEdit1.Text:=RichEdit1.Text+h.comment[l];
     end;
     Label15.Caption:=InttoStr(Round(h.Time));
     Label16.Caption:=InttoStr(Round(h.Moment));
     Label17.Caption:=FloattoStr(h.yn);
     Label42.Caption:=FloattoStr(h.xstart*1e10);
     Label43.Caption:=FloattoStr(h.ystart*1e10);
     Label44.Caption:=FloattoStr(abs(h.xstart-h.xend)*1e10);
     Label45.Caption:=FloattoStr(abs(h.ystart-h.yend)*1e10);

     SizeofImgNumber:=h.yn;
   end;

        for k:=0 to h.yn-1 do
         begin
         for l:=0 to h.yn-1 do F.Read(DatatoPlotinFile[l,k],4);
         end;

  F.Destroy;
 end;
Button5Click(nil);
end;


procedure TValProm.Button5Click(Sender: TObject);
var
CountX,CountY,CountFX,CountFY: longint;
xmyplot,ymyplot: double;

begin

if (SizeofImgNumber<256) then
begin
for CountY:=0 to 255 do begin
for CountX:=0 to 255 do
begin
 CountFX:=Trunc((CountX+0.5)*SizeofImgNumber/256);
 CountFY:=Trunc((CountY+0.5)*SizeofImgNumber/256);
 DatatoPlotinGraph[CountX,CountY]:=DatatoPlotinFile[CountFX,CountFY];
end;
end;
end
else
begin
for CountY:=0 to SizeofImgNumber-1 do begin
for CountX:=0 to SizeofImgNumber-1 do
begin
 DatatoPlotinGraph[CountX,CountY]:=DatatoPlotinFile[CountX,CountY];
end;
end;
end;

ImageData[1].Clear;
for CountY:=0 to SizeofImgNumber-1 do begin
for CountX:=0 to SizeofImgNumber-1 do
begin
   xmyplot:=CountX+CountY*SizeofImgNumber;
   ymyplot:=DatatoPlotinFile[CountX,CountY];
   ImageData[1].Addpoint(xmyplot,ymyplot);
end;
end;
ImageData.Update;


Max:=-100000000;
Min:=100000000;
for CountX:=0 to 255 do begin
for CountY:=0 to 255 do
begin
 if DatatoPlotinGraph[CountX,CountY]<Min then Min:=DatatoPlotinGraph[CountX,CountY];
 if DatatoPlotinGraph[CountX,CountY]>Max then Max:=DatatoPlotinGraph[CountX,CountY];
end;
end;
Center:=(Max+Min)/2;
if ((Max-Min)=0) then begin Max:=1;Min:=0;end;


for CountY:=0 to 255 do begin
for CountX:=0 to 255 do
 begin
 DatatoPaint[CountX,CountY]:=Round((DatatoPlotinGraph[CountX,CountY]-Center)/(Max-Min)*255+255/2);
 if(DatatoPaint[CountX,CountY]>255) then  DatatoPaint[CountX,CountY]:=255;
 if(DatatoPaint[CountX,CountY]<0) then  DatatoPaint[CountX,CountY]:=0;
 end;
end;


DiffAjust.clear;
for CountY:=0 to 255 do begin
for CountX:=0 to 255 do
   begin
   Paintbox2.Canvas.Pixels[CountX,CountY]:=DatatoPaint[CountX,CountY]*65793;//Int(DatatoPaint[CountX]);
   DiffAjust[1].Addpoint(CountX+CountY*(255),DatatoPaint[CountX,CountY]);
   end;
end;
  
  if LinePainted then
  begin
  Paintbox2.Canvas.Pen.Color:=ClRed;
  Paintbox2.Canvas.MoveTo(XStartforLine, YStartforLine);
  Paintbox2.Canvas.LineTo(XEndforLine, YEndforLine);
  end;
end;

procedure TValProm.Button6Click(Sender: TObject);
var
CountX,CountY: integer;
NewMax,NewMin,NewCenter: Double;

begin

NewMax:=TrackBar2.Position/20*Max;
NewMin:=TrackBar2.Position/20*Min;
NewCenter:=TrackBar1.Position/20*Center+Center;

if ((NewMax-NewMin)=0) then begin NewMax:=1; NewMin:=0; end;

for CountY:=0 to 255 do begin
for CountX:=0 to 255 do
begin
 DatatoPaint[CountX,CountY]:=Round((DatatoPlotinGraph[CountX,CountY]
    -NewCenter)/(NewMax-NewMin)*255+255/2);
 if(DatatoPaint[CountX,CountY]>255) then  DatatoPaint[CountX,CountY]:=255;
 if(DatatoPaint[CountX,CountY]<0) then  DatatoPaint[CountX,CountY]:=0;
end;
end;

for CountY:=0 to 255 do begin
for CountX:=0 to 255 do
   Paintbox2.Canvas.Pixels[CountX,CountY]:=DatatoPaint[CountX,CountY]*65793;
   DiffAjust[1].Addpoint(CountX+CountY*(255),DatatoPaint[CountX,CountY]);
end;

end;

procedure TValProm.Merge_fClick(Sender: TObject);
var
   F,FFF: TFileStream;
   Ext : string;
  blqname,blqname_s : string ;
  b_offset: Integer;
  k: Integer;

begin
if Merge_f.Caption='WORKING PUSH TO STOP' then
 begin
 Merge_f.Caption:='Merge two files';
 exit;
 end;

if OpenFichero.Execute then
begin

  F:=TFileStream.Create(Openfichero.Filename,fmOpenRead) ;
  Ext:=UpperCase(ExtractFileExt(Openfichero.Filename)) ;
  F.Seek(0,soFromBeginning) ;
  Label2.Caption:=ExtractFileName(Openfichero.Filename);

if Ext = '.BLQ' then
begin
  FFF:=TFileStream.Create(ExtractFileDir(Openfichero.Filename)+'/merge.blq',fmCreate) ;
  FFF.Seek(0,soFromBeginning) ;

F.Destroy;
FFF.Destroy;

  blqname:=Openfichero.Filename;
  blqname_s:=ExtractFileDir(Openfichero.Filename)+'/merge.blq';
  InfoForm.Mensaje.Caption:='Loading BLQ...' ;
  InfoForm.Show ;
  InfoForm.Refresh ;
  b.SelectBlockFile(blqname) ;
  InfoForm.Close ;

    for k:=0 to b.Count-1 do
      begin
         if (frac(k/100)<0.01) then
          begin
          Application.ProcessMessages;
          Label55.Caption:=InttoStr(k);
          end;
         b_offset:=b.GetEntryOffset(k) ;
         LoadDataSetFromBlock(blqname,b_offset,DS) ;
         WriteDataSetinBlock(blqname_s,DS,False);
      end;

  if OpenFichero.Execute then
   begin

   F:=TFileStream.Create(Openfichero.Filename,fmOpenRead) ;
   Ext:=UpperCase(ExtractFileExt(Openfichero.Filename)) ;
   F.Seek(0,soFromBeginning) ;
   Label2.Caption:=ExtractFileName(Openfichero.Filename);
   F.Destroy;
   blqname:=Openfichero.Filename;
   InfoForm.Mensaje.Caption:='Loading BLQ...' ;
   InfoForm.Show ;
   InfoForm.Refresh ;
   b.SelectBlockFile(blqname) ;
   InfoForm.Close ;

    for k:=0 to b.Count-1 do
      begin
         if (frac(k/100)<0.01) then
          begin
          Application.ProcessMessages;
          Label55.Caption:=InttoStr(k);
          end;
         b_offset:=b.GetEntryOffset(k) ;
         LoadDataSetFromBlock(blqname,b_offset,DS) ;
         WriteDataSetinBlock(blqname_s,DS,False);
      end;
   end;

end;

end;

end;

procedure TValProm.Button7Click(Sender: TObject);
var
CountX,CountY: integer;
lineXStart,lineXEnd: Real;

begin

Max:=TrackBar2.Position;
Center:=TrackBar1.Position;
Min:=0;

for CountY:=1 to Paintbox2.height-1 do begin
lineXStart:=Paintbox2.Canvas.Pixels[1,CountY]/65793;
lineXEnd:=Paintbox2.Canvas.Pixels[Paintbox2.width-1,CountY]/65793;
for CountX:=1 to Paintbox2.width-1 do
begin
 DatatoPaint[CountX,CountY]:=Round((Paintbox2.Canvas.Pixels[CountX,CountY]/65793
    -(lineXStart+(lineXEnd-lineXStart)/(Paintbox2.width-2)*(CountX-1))));
 if(DatatoPaint[CountX,CountY]>255) then  DatatoPaint[CountX,CountY]:=255;
 if(DatatoPaint[CountX,CountY]<0) then  DatatoPaint[CountX,CountY]:=0;
end;
end;

DiffAjust.clear;
for CountY:=1 to Paintbox2.height-1 do begin
for CountX:=1 to Paintbox2.width-1 do
begin
   Paintbox2.Canvas.Pixels[CountX,CountY]:=DatatoPaint[CountX,CountY]*65793;
   DiffAjust[1].Addpoint(CountX+CountY*(Paintbox2.width-1),DatatoPaint[CountX,CountY]);
end;
end;

end;

procedure TValProm.Button8Click(Sender: TObject);
var
CountX,CountY: integer;

begin
Max:=-10000000;
Min:=100000000;
for CountX:=1 to Paintbox2.height-1 do begin
for CountY:=1 to Paintbox2.width-1 do
begin
 GuardaDato[CountX,CountY]:=Paintbox2.Canvas.Pixels[CountX,CountY]/65793;
 if GuardaDato[CountX,CountY]<Min then
   Min:=GuardaDato[CountX,CountY];
 if GuardaDato[CountX,CountY]>Max then
 Max:=GuardaDato[CountX,CountY];
end;
end;
Center:=(Max+Min)/2;

for CountY:=1 to Paintbox2.height-1 do begin
for CountX:=1 to Paintbox2.width-1 do
 begin
 DatatoPaint[CountX,CountY]:=
   Round((-GuardaDato[CountX,CountY]+2*Center));
 if(DatatoPaint[CountX,CountY]>255) then  DatatoPaint[CountX,CountY]:=255;
 if(DatatoPaint[CountX,CountY]<0) then  DatatoPaint[CountX,CountY]:=0;
 end;
end;

DiffAjust.clear;
for CountY:=1 to Paintbox2.height-1 do begin
for CountX:=1 to Paintbox2.width-1 do
begin
   Paintbox2.Canvas.Pixels[CountX,CountY]:=DatatoPaint[CountX,CountY]*65793;//Int(DatatoPaint[CountX]);
   DiffAjust[1].Addpoint(CountX+CountY*(Paintbox2.width-1),DatatoPaint[CountX,CountY]);
end;
end;

end;

procedure TValProm.Button9Click(Sender: TObject);
var
CountX,CountY: integer;

begin
for CountY:=1 to Paintbox2.height-1 do begin
for CountX:=1 to Paintbox2.width-1 do
begin
   Paintbox2.Canvas.Pixels[CountX,CountY]:=DatatoPaint[CountX,CountY]*65793;//Int(DatatoPaint[CountX]);
end;
end;

end;

procedure TValProm.Button12Click(Sender: TObject);
begin
ImageData.Clear;
end;

procedure TValProm.SpinEdit1Change(Sender: TObject);
var
CountX,CountY: integer;
begin
Button5Click(nil);
MiFindY:=Trunc(SpinEdit1.Value/SizeofImgNumber);
MiFindX:=SpinEdit1.Value-MiFindY*SizeofImgNumber;
CountY:=Trunc(256/SizeofImgNumber*Trunc(SpinEdit1.Value/SizeofImgNumber))+1;
CountX:=SpinEdit1.Value*Trunc(256/SizeofImgNumber)-MiFindY*256;
//CountY:=Trunc(SpinEdit1.Value/256);
//CountX:=SpinEdit1.Value-CountY*256;
//Label26.Caption:=InttoStr(CountX);
//Label27.Caption:=InttoStr(CountY);

// Con esto pinta la flecha
Paintbox2.Canvas.Pixels[CountX,CountY]:=clBlue;
Paintbox2.Canvas.Pixels[CountX+1,CountY+1]:=clBlue;
Paintbox2.Canvas.Pixels[CountX+2,CountY+2]:=clBlue;
Paintbox2.Canvas.Pixels[CountX+3,CountY+3]:=clBlue;
Paintbox2.Canvas.Pixels[CountX+4,CountY+3]:=clBlue;
Paintbox2.Canvas.Pixels[CountX+3,CountY+4]:=clBlue;
Paintbox2.Canvas.Pixels[CountX+4,CountY+4]:=clRed;
Paintbox2.Canvas.Pixels[CountX+2,CountY+4]:=clYellow;

ImageData[2].Color:=clBlue;
ImageData[2].Addpoint(1+MiFindX+MiFindY*SizeofImgNumber,DatatoPlotinFile[MiFindX,MiFindY]);
Application.ProcessMessages;
if CheckDrawCurve.checked then
begin
AuxGraph1.GotoPlotNr.Text:=Label30.Caption;
AuxGraph1.Button4Click(nil);
end;

end;

procedure TValProm.Button10Click(Sender: TObject);

begin
DatatoPlotinFile[MiFindX,MiFindY]:=DatatoPlotinFile[MiFindX,MiFindY]+StrtoFloat(Edit1.Text);
ImageData[2].Clear;
Button5Click(nil);
ImageData[2].Color:=clBlue;
ImageData[2].Addpoint(MiFindX+MiFindY*SizeofImgNumber,DatatoPlotinFile[MiFindX,MiFindY]);
Button5Click(nil);
ImageData.Update;
end;

procedure TValProm.Button11Click(Sender: TObject);
begin
DatatoPlotinFile[MiFindX,MiFindY]:=DatatoPlotinFile[MiFindX,MiFindY]-StrtoFloat(Edit1.Text);
ImageData[2].Clear;
Button5Click(nil);
ImageData[2].Color:=clBlue;
ImageData[2].Addpoint(MiFindX+MiFindY*SizeofImgNumber,DatatoPlotinFile[MiFindX,MiFindY]);
ImageData.Update;
end;

procedure TValProm.Button13Click(Sender: TObject);
var
MiFile : string;
k,l: Integer;

begin
        SaveDialog1.FilterIndex:=2;
        if SaveDialog1.Execute then
        begin
        MiFile:=SaveDialog1.Filename+'.img';
        F:=TFileStream.Create(MiFile,fmCreate) ;

        F.WriteBuffer(h,Sizeof(h));

        for l:=0 to h.yn-1 do
         begin
         for k:=0 to h.yn-1 do
          begin
          F.Write(DatatoPlotinFile[k,l],4);
          end;
         end;
         F.Destroy;
        end;
end;

procedure TValProm.PaintBox2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
Var
mxx: Integer;

begin

Label26.Caption:=InttoStr(Trunc(X*SizeofImgNumber/256));
Label27.Caption:=InttoStr(Trunc(Y*SizeofImgNumber/256));

mxx:=StrtoInt(Label26.Caption)+ StrtoInt(Label27.Caption)*SizeofImgNumber;

if (SizeofImgNumber>0) then
begin
if (RadioGroup1.ItemIndex=1) then
Label30.Caption:=InttoStr(-2*(StrtoInt(Label26.Caption)+1)
+4*StrtoInt(Label27.Caption)*SizeofImgNumber+4*SizeofImgNumber)
else
Label30.Caption:=InttoStr(2*mxx+2*Trunc(mxx/SizeofImgNumber)*SizeofImgNumber);
end;

end;


procedure TValProm.PaintBox2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
XStartforLine:=X;
YStartforLine:=Y;
end;

procedure TValProm.PaintBox2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 ContaX,ContaY,i,PointNr: Integer;
 IncrY: Double;
begin
  if (XStartforLine<>X) and (YStartforLine<>Y) then
  begin
  PointNr:=Trunc(sqrt((X-XStartforLine)*(X-XStartforLine)+
  (Y-YStartforLine)*(Y-YStartforLine)));
  for i:=0 to PointNr do
  begin
  IncrY:=(Y-YStartforLine)/(X-XStartforLine);
  if (Abs(IncrY)<10) then begin
  //IncrX:=Trunc((X-XStartforLine)/abs(X-XStartforLine));
  ContaX:=XStartforLine+Trunc((X-XStartforLine)*i/PointNr);
  ContaY:=YStartforLine+Trunc(IncrY*(ContaX-XStartforLine));
  end
  else
  begin
  ContaX:=XStartforLine;
  ContaY:=YStartforLine+Trunc((Y-YStartforLine)/PointNr*i);
  end;
  PlotIV(nil,ContaX,ContaY);
  Paintbox2.Canvas.Pen.Color:=ClRed;
  Paintbox2.Canvas.MoveTo(XStartforLine, YStartforLine);
  XEndforLine:=X;
  YEndforLine:=Y;
  Paintbox2.Canvas.LineTo(XEndforLine, YEndforLine);
  LinePainted:=True;
  end;
  end;
end;

procedure TValProm.Button14Click(Sender: TObject);
begin
AuxGraph1.Show;
end;

procedure TValProm.Plotiv(Sender: TObject; X,Y: Integer);
Var
MariaX,MariaY,mxx: Integer;

begin
Label26.Caption:=InttoStr(Trunc(X*SizeofImgNumber/256));
Label27.Caption:=InttoStr(Trunc(Y*SizeofImgNumber/256));
mxx:=StrtoInt(Label26.Caption)+ StrtoInt(Label27.Caption)*SizeofImgNumber;
if (SizeofImgNumber>0) then
begin
if (RadioGroup1.ItemIndex=1) then
Label30.Caption:=InttoStr(2*mxx+2*Trunc(mxx/SizeofImgNumber)*SizeofImgNumber+
2*SizeofImgNumber)
else
Label30.Caption:=InttoStr(2*mxx+2*Trunc(mxx/SizeofImgNumber)*SizeofImgNumber);
end;
MariaX := StrtoInt(Label26.Caption);
MariaY := StrtoInt(Label27.Caption);
SpinEdit1.Value:=MariaX +  MariaY*SizeofImgNumber;
end;

procedure TValProm.PaintBox2DblClick(Sender: TObject);
Var
MariaX,MariaY,i,j,Pts: Integer;

begin
MariaX := StrtoInt(Label26.Caption);
MariaY := StrtoInt(Label27.Caption);
if (SpinEdit4.Value=0) then SpinEdit1.Value:=MariaX+MariaY*SizeofImgNumber
else
begin
Pts:=SpinEdit4.Value;
for j:=-Pts to Pts do
begin
for i:=-Pts to Pts do
 begin
  PlotIV(nil,Round((MariaX+i)*256/SizeofImgNumber),Round((MariaY+j)*256/SizeofImgNumber));
  //SpinEdit1.Value:=MariaX+i+(MariaY+j)*SizeofImgNumber;
  Application.ProcessMessages;
 end;
end;
end;
end;

procedure TValProm.Button15Click(Sender: TObject);
begin
Form1.Show;
end;

procedure TValProm.Button16Click(Sender: TObject);
var
  b_xx: Array[0..100000] of Extended;
  b_yy: Array[0..100000] of Extended;

  Ext : string;
  Skipfirstblqs: Integer;
  i,k,l: Integer;
  N_puntos,Linea,Offset_Van: Integer;
  offsetval_pares,offsetval_impares: Double;
  ChkBox2Chkd: Boolean;
  TomaCurvItemIndex: Integer;

begin

 if Button16.Caption='Push to stop' then
    begin
    Button16.Caption:='Read File';
    exit;
    end;
if OpenFichero.Execute then
begin
//j:=1;

  // ABRIR FICHERO
  F:=TFileStream.Create(Openfichero.Filename,fmOpenRead) ;
  Ext:=UpperCase(ExtractFileExt(Openfichero.Filename)) ;
  F.Seek(0,soFromBeginning) ;
  Label2.Caption:=ExtractFileName(Openfichero.Filename);
  Label49.Caption:=ExtractFileName(Openfichero.Filename);
  Label50.Caption:=ExtractFileDir(Openfichero.Filename);
  Button16.Caption:='Push to stop';

if Ext = '.BLQ' then
begin
F.Destroy;
  blqname:=Openfichero.Filename;
  InfoForm.Mensaje.Caption:='Loading BLQ...' ;
  InfoForm.Show ;
  InfoForm.Refresh ;
  b.SelectBlockFile(blqname) ;
  InfoForm.Close ;

  Skipfirstblqs:=SpinSkip.Value;
  if (Skipfirstblqs>0) then
   begin
    for k:=0 to Skipfirstblqs-1 do
      begin
         b_offset:=b.GetEntryOffset(k) ;
         LoadDataSetFromBlock(blqname,b_offset,DS) ;
      end;

   PointNr.Caption:=InttoStr(b.Count-Skipfirstblqs);
   end
  else  PointNr.Caption:=Inttostr(b.Count);

 if (checkbox2.checked) then N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/2))
  else N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/4));
  //N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/4));
  if (FixPtNrc.Checked) then N_puntos:=StrtoInt(FixPtNr.Text);
  Label6.Caption:=InttoStr(N_puntos);

  offsetval_pares:=StrtoFloat(Offset.Text)*1e-3;  // en V
  offsetval_impares:=StrtoFloat(Edit2.Text)*1e-3; //en V

  for k:=0 to N_puntos-1 do
     begin
     //NroLinea.Caption:=InttoStr(k);
     //Application.ProcessMessages;
// IDA Y VUELTA DE TODA UNA LINEA EN X

 if (ChkBox2Chkd) then Linea:=N_puntos-1 else Linea:=2*N_puntos-1;
 if (ChkBox2Chkd) then Offset_Van:=k*2*N_Puntos else Offset_Van:=k*2*2*N_Puntos;

     for l:=0 to Linea do
        begin
         //NroDato.Caption:=InttoStr(l);
         //if Button16.Caption='Read File' then exit;
         //Application.ProcessMessages;
         /// Lee pares si toca
         if ((TomaCurvItemIndex=0) or (TomaCurvItemIndex=2)) then
          begin
           b_offset:=b.GetEntryOffset(Offset_Van+2*l) ;
           LoadDataSetFromBlock(blqname,b_offset,DS) ;
           Points.Caption:=InttoStr(DS.nrows);
           MiPosXY[k,l]:=Ds.Comment;
           if (l=0) and (k=0) then MiMoment:=DS.Moment;
           if (l=2*N_puntos-1) and (k=N_Puntos-1) then  MiTime:=DS.Moment-MiMoment;
            for i:=0 to DS.nrows-1 do
              begin
               b_yy[i]:=DS[1].Value[i];
               b_xx[i]:=DS[0].Value[i]-offsetval_pares;
              end;
          end;
         // lee tambien impares
         if (TomaCurvItemIndex=1) then
           begin
            b_offset:=b.GetEntryOffset(Offset_Van+(2*l+1)) ;
            LoadDataSetFromBlock(blqname,b_offset,DS) ;
            Points.Caption:=InttoStr(DS.nrows);
            MiPosXY[k,l]:=Ds.Comment;

               for i:=0 to DS.nrows-1 do
                begin
                 b_yy[i]:=DS[1].Value[i];  // menos porque ida y vuelta
                 b_xx[i]:=DS[0].Value[i]-offsetval_impares;  // menos porque ida y vuelta
                end;
           end;
         // Lee impares y promedia si hay que hacerlo
            if (TomaCurvItemIndex=2) then
              begin
               b_offset:=b.GetEntryOffset(Offset_Van+2*l+1) ;
               LoadDataSetFromBlock(blqname,b_offset,DS) ;
               Points.Caption:=InttoStr(DS.nrows);

               for i:=0 to DS.nrows-1 do
                begin
                 b_yy[i]:=(DS[1].Value[DS.nrows-1-i]+b_yy[i])/2;
                 b_xx[i]:=((DS[0].Value[DS.nrows-1-i]-offsetval_impares)+b_xx[i])/2;
                end;
              end;
           for i:=0 to DS.nrows-1 do
            begin
             b_yy_tot[l,k,i]:=1e9*b_yy[i];  // nA
             b_xx_tot[l,k,i]:=1e3*b_xx[i];  // mV
            end;
         // terminado de leer la curva
     end; // for de l
    end;  // for de k
Button16.Caption:='Read File';
end; // ext=blq
end; // opendialog


end;

procedure TValProm.Button20Click(Sender: TObject);
var
MiFile,NumCol,NumRow,HeadSize_,AmpX,AmpY,OffX,OffY,AmpZ : string;
i,k,l,LAmpZ: Integer;
WsxmComment: Array [0..511] of Char;
xamp,yamp: LongInt;
NumberCol,NumberRow,PosCol,PosFin,PosSize: Integer;
ZMax,ZMin,ZAmplitude: Single;

begin
         xamp:=Round(abs(h.xstart-h.xend)*1e10);
         yamp:=Round(abs(h.ystart-h.yend)*1e10);
         NumberCol:=h.xn;
         NumberRow:=h.yn;
         ZMax:=0;
         ZMin:=0;
         NumCol:=InttoStr(NumberCol);
         NumRow:=InttoStr(NumberRow);

         AmpX:=InttoStr(xamp);
         SetLengthofStr(nil,4,AmpX);
         Label44.Caption:=AmpX;

         AmpY:=InttoStr(yamp);
         SetLengthofStr(nil,4,AmpY);
         Label45.Caption:=AmpY;

         OffX:=InttoStr(Round(h.xstart*1e10));
         SetLengthofStr(nil,5,OffX);
         Label42.Caption:=OffX;

         OffY:=InttoStr(Round(h.ystart*1e10));
         SetLengthofStr(nil,5,OffY);
         Label43.Caption:=OffY;

         for l:=0 to NumberCol-1 do
         begin
         for k:=0 to NumberRow-1 do
          begin
          if (DatatoPlotinFile[k,l]>ZMax) then ZMax:=DatatoPlotinFile[k,l];
          if (DatatoPlotinFile[k,l]<ZMin) then ZMin:=DatatoPlotinFile[k,l];
          end;
         end;
         ZAmplitude:=abs(ZMax-ZMin);
         if (ZAmplitude=0) then ZAmplitude:=1;
         
         AmpZ:=FloattoStrF(ZAmplitude*1e10,ffGeneral,6,6);
         if (Length(AmpZ)<11) then
          begin
           LAmpZ:=Length(AmpZ);
           SetLength(Ampz,11);
           for i:=LAmpZ+1 to 11 do Ampz[i]:=' ';
          end;

         WsxmComment:=
         'WSxM file copyright Nanotec Electronica'+#13#10+
         'SxM Image file'+#13#10+
         'Image header size: SSS'+#13#10+
         '[Control]'+#13#10+
         #13#10+
         'X Amplitude: XAMP Å'+#13#10+
         'Y Amplitude: YAMP Å'+#13#10+
         'Z Gain: 1'+#13#10+
         #13#10+
         '[General Info]'+#13#10+
         #13#10+
         'Head Type: STM'+#13#10+
         'Image Data Type: integer'+#13#10+
         'Number of columns: WWW'+#13#10+
         'Number of rows: XXX'+#13#10+
         //'Number of columns: 128'+NumCol[1]+NumCol[2]+NumCol[3]+#13#10+
         //'Number of rows: '+NumRow[1]+NumRow[2]+NumRow[3]+#13#10+
         'X starting offset: XOFFF Å'+#13#10+
         'Y starting offset: YOFFF Å'+#13#10+
         'Z Amplitude: ZAMPPPPPPP Å'+#13#10+
         #13#10+
         '[Graphic Layers]'+#13#10+
         #13#10+
         'Layer 0: Name: Base Image; Active: Yes;'+#13#10+
         //'Layer 1: Name: Scalebar; Active: Yes;'+#13#10+
         'Number of Layers: 1'+#13#10+
         #13#10+
         '[Header end]'+#13#10+#13#10;

          //WsxmComment[510]:=#13;
          //WsxmComment[511]:=#10;

          PosCol:=0;
          for i:=0 to 511 do if (WsxmComment[i]='W') and (WsxmComment[i+1]='W')
           and (WsxmComment[i+2]='W') then PosCol:=i;
          for i:=0 to 2 do WsxmComment[PosCol+i]:=NumCol[i+1];
          for i:=0 to 2 do WsxmComment[PosCol+21+i]:=NumRow[i+1];

          for i:=0 to 511 do if (WsxmComment[i]='X') and (WsxmComment[i+1]='A')
           and (WsxmComment[i+2]='M') then PosCol:=i;
          for i:=1 to Length(AmpX) do WsxmComment[PosCol+i-1]:=AmpX[i];
          for i:=1 to Length(AmpY) do WsxmComment[PosCol+21+i-1]:=AmpY[i];

          for i:=0 to 511 do if (WsxmComment[i]='X') and (WsxmComment[i+1]='O')
           and (WsxmComment[i+2]='F') then PosCol:=i;
          for i:=1 to Length(OffX) do WsxmComment[PosCol+i-1]:=OffX[i];
          for i:=1 to Length(OffY) do WsxmComment[PosCol+28+i-1]:=OffY[i];
          for i:=1 to Length(AmpZ) do WsxmComment[PosCol+50+i-1]:=AmpZ[i];
          PosFin:=0;
          for i:=0 to 511 do if (WsxmComment[i]='n') and (WsxmComment[i+1]='d')
           and (WsxmComment[i+2]=']') then PosFin:=i+7;
          HeadSize_:=InttoStr(PosFin);
          PosSize:=0;
          for i:=0 to 511 do if (WsxmComment[i]='S') and (WsxmComment[i+1]='S')
           and (WsxmComment[i+2]='S') then PosSize:=i;
          for i:=0 to 2 do WsxmComment[PosSize+i]:=HeadSize_[i+1];

         RichEdit1.Text:='';
         for l:=0 to 511 do
         begin
          RichEdit1.Text:=RichEdit1.Text+WsxmComment[l];
         end;

        //SaveDialog1.FilterIndex:=3;
        //if SaveDialog1.Execute then
        //begin
        MiFile:=Label51.Caption;
        F:=TFileStream.Create(MiFile,fmCreate) ;

        F.WriteBuffer(WsxmComment,PosFin);

        for l:=0 to h.yn-1 do
         begin
         for k:=0 to h.yn-1 do
          begin
          DataWsxmtoPlotinFile[k,l]:=Round(DatatoPlotinFile[k,l]/ZAmplitude*32767);
          end;
         end;

        for l:=0 to h.yn-1 do
         begin
         for k:=0 to h.yn-1 do
          begin
          F.WriteBuffer(DataWsxmtoPlotinFile[k,l],2);
          end;
         end;
         F.Destroy;
        //end;
end;

procedure TValProm.PaintBox2Paint(Sender: TObject);
begin
Button6Click(nil);
end;

procedure TValProm.Button21Click(Sender: TObject);
var
   F,FFF: TFileStream;
   Ext : string;
  blqname,blqname_s : string ;
  b_offset,Skip: Integer;
  k: Integer;

begin
if Button21.Caption='WORKING PUSH TO STOP' then
 begin
 Button21.Caption:='Erase N points from beginning';
 exit;
 end;

Skip:=SpinEdit2.Value;

if OpenFichero.Execute then
begin

  F:=TFileStream.Create(Openfichero.Filename,fmOpenRead) ;
  Ext:=UpperCase(ExtractFileExt(Openfichero.Filename)) ;
  F.Seek(0,soFromBeginning) ;
  Label2.Caption:=ExtractFileName(Openfichero.Filename);

if Ext = '.BLQ' then
begin
  FFF:=TFileStream.Create(ExtractFileDir(Openfichero.Filename)+'/erase.blq',fmCreate) ;
  FFF.Seek(0,soFromBeginning) ;

F.Destroy;
FFF.Destroy;

  blqname:=Openfichero.Filename;
  blqname_s:=ExtractFileDir(Openfichero.Filename)+'/erase.blq';
  InfoForm.Mensaje.Caption:='Loading BLQ...' ;
  InfoForm.Show ;
  InfoForm.Refresh ;
  b.SelectBlockFile(blqname) ;
  InfoForm.Close ;

Button21.Caption:='WORKING PUSH TO STOP';

    for k:=0 to b.Count-1-Skip do
      begin
         if (frac(k/100)<0.01) then
          begin
          Application.ProcessMessages;
          Label57.Caption:=InttoStr(k);
          end;
         b_offset:=b.GetEntryOffset(k+Skip) ;
         LoadDataSetFromBlock(blqname,b_offset,DS) ;
         WriteDataSetinBlock(blqname_s,DS,False);
      end;

end;

end;
Button21.Caption:='Erase N points from beginning';

end;

procedure TValProm.Button18Click(Sender: TObject);
var
  CurvaADerivar: vcurva;
  CurvaDerivada: vcurva;
   NumRead,i: Integer;
   Buf : Double;
   j,k,kk,ll,l,m,MiPos,cont,conta2,MiLinesNr,MiDataNr: Longint;
   Ff: TextFile;
//   F: TFileStream;
   Ext,MiFile : string;
   w : smallint ;
   Prom: Double;
//   h: TIMGheader;
   //h: TIMG_Cab;
   ValorCortadeb,ValorCortaenc,ValorAjusta: Double;
   Skipfirstblqs: Integer;

  blqname : string ;
  b_offset,NRows: Integer;
  N_puntos,ii,Linea,Offset_Van: Integer;
  ww: Single;
  SearchinStr: string;
  ValFound: single;
  promaround_val,promaround0val,offsetval,PromBeginval,PromEndval
  ,secondprom,secondprom_zero: Double;
  ChkBox1Chkd,ChkBox2Chkd,CorrigeOffsetChkd, DerivaChkd,SecondderivaChkd,PromedioChkd
  , NormalizeChkd: Boolean;
  TomaCurvItemIndex,SpinDataVal,SpinPlotLineVal: Integer;

begin
        // YA TIENE LOS DATOS DE UN PUNTO EN b
        //  AHORA A DERIVAR !
  offsetval:=StrtoFloat(Edit11.Text);  // OTRO OFFSET, CUIDADO
  promaround_val:=StrtoFloat(PromAround_.Text);
  PromBeginval:= StrtoFloat(PromBegin.Text);
  PromEndval:= StrtoFloat(PromEnd.Text);
  SpinDataVal:=SpinData.Value;
  SpinPlotLineVal:=SpinPlotLine.Value;
  ChkBox2Chkd:=checkbox2.checked;
  DerivaChkd:=Deriva.checked;
  SecondderivaChkd:=CheckBox3.checked;
  NormalizeChkd:=BaseLine.checked;

  NRows:=StrtoInt(Points.Caption);

 if (checkbox2.checked) then N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/2))
  else N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/4));
  //N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/4));
  if (FixPtNrc.Checked) then N_puntos:=StrtoInt(FixPtNr.Text);
  Label6.Caption:=InttoStr(N_puntos);

    for k:=0 to N_puntos-1 do
     begin
     NroLinea.Caption:=InttoStr(k);
     Application.ProcessMessages;

// IDA Y VUELTA DE TODA UNA LINEA EN X

 if (ChkBox2Chkd) then Linea:=N_puntos-1 else Linea:=2*N_puntos-1;

     for l:=0 to Linea do
      begin
        if (DerivaChkd) then
         begin
         pderi:=StrtoInt(PDeriva.Text);
          CurvaADerivar.n:=NRows;
          for i:=0 to NRows-1 do
                begin
                CurvaADerivar.x[i]:=b_xx_tot[l,k,i]-offsetval;
                CurvaADerivar.y[i]:=b_yy_tot[l,k,i];
                end;
          DerivaRectas(CurvaAderivar,CurvaDerivada);
          if (SecondDerivaChkd) then
          begin
           pderi:=StrtoInt(Edit8.Text);
          for i:=0 to NRows-1 do
                begin
                CurvaADerivar.x[i]:=CurvaDerivada.x[i];
                CurvaADerivar.y[i]:=CurvaDerivada.y[i];
                end;
          DerivaRectas(CurvaAderivar,CurvaDerivada);
          end;

         end;
         // YA tengo la derivada

          if (DerivaChkd) then
          begin
          for i:=0 to NRows-1 do
                begin
                //Application.ProcessMessages;
                b_xx_treat_tot[l,k,i]:=CurvaDerivada.x[i];
                b_yy_treat_tot[l,k,i]:=CurvaDerivada.y[i];
                end;
          end
          else
          begin
          for i:=0 to NRows-1 do
                begin
                //Application.ProcessMessages;
                b_xx_treat_tot[l,k,i]:=b_xx_tot[l,k,i]-offsetval;
                b_yy_treat_tot[l,k,i]:=b_yy_tot[l,k,i];
                end;
          end;


         if NormalizeChkd then
         begin
                  // PROMEDIO ALREDEDOR DE LA ESQUINA
         cont:=0;    // contador de promedios
         Prom:=0;

         for j:=0 to NRows-1 do
            begin
             if (Abs(b_xx_treat_tot[l,k,j])>PromBeginval)
                and (Abs(b_xx_treat_tot[l,k,j])<PromEndval) then
                begin
                Prom:=Prom+b_yy_treat_tot[l,k,j];
                cont:=cont+1;
                end;
            end;  // for j
          if (cont<=0) then cont:=1;
          if (Prom/cont<=0) then Prom:=1;
         for j:=0 to NRows-1 do
            begin
             b_yy_treat_tot[l,k,j]:=b_yy_treat_tot[l,k,j]/(Prom/cont);
            end;  // for j
        end;
         // Pinto las treinta primeras
         if ((l<SpinDataVal) and (k<SpinPlotLineVal)) then
           begin
             xyyGraph1[l].Color:=clBlack+30000*l;
             for i:=0 to NRows-1 do
              begin
              xyyGraph1[l].Addpoint(b_xx_treat_tot[l,k,i],b_yy_treat_tot[l,k,i]);
              end;
             PlotLine(50,ClRed,promaround_val+StrtoFloat(PromAround0.Text));
             PlotLine(51,ClRed,promaround_val-StrtoFloat(PromAround0.Text));
             PlotLine(52,ClBlue,PromBeginval);
             PlotLine(53,ClBlue,-PromBeginval);
             PlotLine(54,ClGreen,PromEndval);
             PlotLine(55,ClGreen,-PromEndval);
          end;

       end;
     end;

end;

procedure TValProm.Button19Click(Sender: TObject);
var
  b_xx: Array[0..100000] of Extended;
  b_yy: Array[0..100000] of Extended;
  CurvaADerivar: vcurva;
  CurvaDerivada: vcurva;
   NumRead,i: Integer;
   Buf : Double;
   j,k,kk,ll,l,m,MiPos,cont,conta2,MiLinesNr,MiDataNr: Longint;
   Ff: TextFile;
//   F: TFileStream;
   Ext,MiFile : string;
   w : smallint ;
   Prom: Double;
//   h: TIMGheader;
   //h: TIMG_Cab;
   ValorCortadeb,ValorCortaenc,ValorAjusta: Double;
   Skipfirstblqs: Integer;

  blqname,FName,DirName,FileNumber : string ;
  b_offset,  NRows,blqPos: Integer;
  N_puntos,ii,Linea,Offset_Van: Integer;
  b_z0: Array[0..1024,0..1024] of Single;
  b_zcorner: Array[0..1024,0..1024] of Single;
  b_difference: Array[0..1024,0..1024] of Single;
  ww: Single;
  SearchinStr: string;
  ValFound: single;
  promaround_val,promaround0val,offsetval,PromBeginval,PromEndval: Double;
  ChkBox1Chkd,ChkBox2Chkd,CorrigeOffsetChkd, DerivaChkd,NormalizeChkd: Boolean;
  TomaCurvItemIndex,SpinDataVal,SpinPlotLineVal: Integer;
  NombreFichero: string;

begin

 if (checkbox2.checked) then N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/2))
  else N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/4));
  //N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/4));
  if (FixPtNrc.Checked) then N_puntos:=StrtoInt(FixPtNr.Text);
  Label6.Caption:=InttoStr(N_puntos);

  promaround_val:=StrtoFloat(PromAround_.Text);
  promaround0val:=StrtoFloat(PromAround0.Text);
  PromBeginval:= StrtoFloat(PromBegin.Text);
  PromEndval:= StrtoFloat(PromEnd.Text);
  ChkBox2Chkd:=checkbox2.checked;
  NormalizeChkd:=BaseLine.checked;

  NRows:=StrtoInt(Points.Caption);

  for k:=0 to N_puntos-1 do
     begin
     NroLinea.Caption:=InttoStr(k);
     Application.ProcessMessages;
// IDA Y VUELTA DE TODA UNA LINEA EN X

 if (ChkBox2Chkd) then Linea:=N_puntos-1 else Linea:=2*N_puntos-1;

     for l:=0 to Linea do
        begin
         //NroDato.Caption:=InttoStr(l);
         //if Button1.Caption='GO' then exit;
         //Application.ProcessMessages;

         // CALCULO PROMEDIO ALREDEDOR DE EL Valor que pone en Promaround_
        prom:=0;
        cont:=0;
        //promaround_val:=StrtoFloat(PromAround_.Text);
        //promaround0val:=StrtoFloat(PromAround0.Text);
         for j:=0 to NRows-1 do
          begin
         if (Abs(b_xx_treat_tot[l,k,j]-promaround_val)<promaround0val)  then
           begin
             Prom:=Prom+b_yy_treat_tot[l,k,j];
             cont:=cont+1;
           end;
          end;
         if (cont<=0) then cont:=1;
         b_z0[l,k]:=Prom/cont;
         // YA TENGO PROMEDIOS. k,l me da el punto en la imagen

         if NormalizeChkd then begin

         // PROMEDIO ALREDEDOR DE LA ESQUINA
         cont:=0;    // contador de promedios
         Prom:=0;
         //PromBeginval:= StrtoFloat(PromBegin.Text);
         //PromEndval:= StrtoFloat(PromEnd.Text);

         for j:=0 to NRows-1 do
            begin
             if (Abs(b_xx_treat_tot[l,k,j])>PromBeginval)
                and (Abs(b_xx_treat_tot[l,k,j])<PromEndval) then
                begin
                Prom:=Prom+b_yy_treat_tot[l,k,j];
                cont:=cont+1;
                end;
            end;  // for j
          if (cont<=0) then cont:=1;
          b_zcorner[l,k]:=Prom/cont;

         // DIFERENCIA
          if  (b_zcorner[l,k]<>0) then
           b_difference[l,k]:=(b_zcorner[l,k]-b_z0[l,k])/b_zcorner[l,k]
          else b_difference[l,k]:=0;
         end
         else b_difference[l,k]:=b_z0[l,k];

     end; // for de l
    end;  // for de k

     if(PlotXYZCorner.checked) then
       for k:=0 to N_Puntos-1 do
       begin
         begin
          for l:=0 to 2*N_puntos-1 do
          xyyGraphCorner[MyGraphNr].Addpoint(l+k*2*N_Puntos,b_zcorner[l,k]);
         end;
       end;
     if(PlotXYZ0.checked) then
       begin
        for k:=0 to N_Puntos-1 do
         begin
          for l:=0 to 2*N_puntos-1 do
          xyyGraph2[MyGraphNr].Addpoint(l+k*2*N_Puntos,b_z0[l,k]);
         end;
       end;
     if(PlotDifference.checked) then
       for k:=0 to N_Puntos-1 do
       begin
         begin
          for l:=0 to 2*N_puntos-1 do
          xyyGraph4[MyGraphNr].Addpoint(l+k*2*N_Puntos,b_difference[l,k]);
         end;
       end; // if Plotdiff


  ValorCortadeb:=StrtoFloat(CortaDebajode.Text);
//  if (ValorCortadeb<-100) or (ValorCortadeb>100) then ValorCortadeb:=-100;
  ValorCortaenc:=StrtoFloat(CortaEncimade.Text);
//  if (ValorCortaenc<-100) or (ValorCortaenc>100) then ValorCortaenc:=100;
  ValorAjusta:=StrtoFloat(AjustaA.Text);
//  if (ValorAjusta<-100) or (ValorAjusta>100) then ValorAjusta:=100;
      ChkBox1Chkd:=CheckBox1.checked;

       for k:=0 to N_Puntos-1 do
         begin
          for l:=0 to 2*N_puntos-1 do
            begin
            if (b_difference[l,k]<ValorCortadeb) or (b_difference[l,k]>ValorCortaenc) then
                begin
                 if (ChkBox1Chkd=True) then b_difference[l,k]:=ValorAjusta
                 else
                 begin
                 if (l=0)
                        then
                          begin
                          if (b_difference[l,k+1]>ValorCortadeb) and (b_difference[l,k+1]<ValorCortaenc) then
                                 b_difference[l,k]:=b_difference[l,k+1]
                                else b_difference[l,k]:=ValorAjusta;
                          end
                 else b_difference[l,k]:=b_difference[l,k-1];
                 end;
                 end;
            end;
         end;

        for k:=0 to N_Puntos-1 do
         begin
          for l:=0 to 2*N_puntos-1 do
          DiffAjust[1].Addpoint(l+k*2*N_Puntos,b_difference[l,k]);
         end;

 if (checkbox5.checked) then
 begin
 if(SaveIMGFile.checked) then
        begin
        h.identif:=$00333333;
        h.version:=$00010000;
        h.day:=1;
        h.month:=1;
        h.year:=2002;
        h.moment:=MiMoment/60/60;  // in hours of the day
        h.time:=MiTime/60;      // in minutes

        if (RadioGroup2.ItemIndex=0) then begin
        SetLength(SearchinStr,12);
        SearchinStr:=Copy(MiPosXY[0,0],(Pos('X:',MiPosXY[0,0]))+2,10);
        if (SearchinStr[1]='-') then
           SearchinStr:=Copy(MiPosXY[0,0],(Pos('X:',MiPosXY[0,0]))+2,11);
        h.xstart:=StrtoFloat(SearchinStr)/2;
        SearchinStr:=Copy(MiPosXY[N_Puntos-1,N_Puntos],(Pos('X:',
            MiPosXY[N_Puntos-1,N_Puntos-1]))+2,10);
        if (SearchinStr[1]='-') then
            SearchinStr:=Copy(MiPosXY[N_Puntos-1,N_Puntos],(Pos('X:',
            MiPosXY[N_Puntos-1,N_Puntos-1]))+2,11);
         h.xend:=StrtoFloat(SearchinStr)/2;
        SearchinStr:=Copy(MiPosXY[0,0],(Pos('Y:',MiPosXY[0,0]))+2,10);
        if (SearchinStr[1]='-') then
           SearchinStr:=Copy(MiPosXY[0,0],(Pos('Y:',MiPosXY[0,0]))+2,11);
        h.ystart:=StrtoFloat(SearchinStr)/2;
        SearchinStr:=Copy(MiPosXY[N_Puntos-1,N_Puntos-1],(Pos('Y:',
            MiPosXY[N_Puntos-1,N_Puntos-1]))+2,10);
        if (SearchinStr[1]='-') then
           SearchinStr:=Copy(MiPosXY[N_Puntos-1,N_Puntos-1],(Pos('Y:',
            MiPosXY[N_Puntos-1,N_Puntos-1]))+2,11);
        h.yend:=StrtoFloat(SearchinStr)/2;
        end
        else
        begin
        h.xstart:=StrtoFloat(Edit3.Text)*1e-8;
        h.xend:=StrtoFloat(Edit4.Text)*1e-8;;
        h.ystart:=StrtoFloat(Edit5.Text)*1e-8;;
        h.yend:=StrtoFloat(Edit6.Text)*1e-8;;
        end;
        h.xn:=N_Puntos;
        h.yn:=N_Puntos;
 // Ida
        for k:=0 to N_Puntos-1 do
         begin
         for l:=0 to N_Puntos-1 do DatatoPlotinFile[l,k]:=b_difference[l,k];
         end;
        DirName:=Label50.Caption;
        FName:=Label49.Caption;
        BlqPos:=Pos('.',FName);
        if BlqPos>0 then SetLength(FName,BlqPos);

        FileNumber:=InttoStr(SpinEdit3.Value);
        if Length(FileNumber)=1 then FileNumber:='0'+'0'+FileNumber
        else if Length(FileNumber)=2 then FileNumber:='0'+FileNumber
        else if Length(FileNumber)>3 then SetLength(FileNumber,3);

        //NombreFichero:=

        Label51.Caption:=DirName+'\'+FName+'i'+FileNumber+'_'
        +Promaround_.Text+
        '.stp';
        Button20Click(nil);
 // vuelta
         for k:=0 to N_Puntos-1 do
         begin
         for l:=2*N_Puntos-1 downto N_Puntos do DatatoPlotinFile[2*N_Puntos-1-l,k]:=b_difference[l,k];
         end;
        end; // Save IMG File

        Label51.Caption:=DirName+'\'+FName+'v'+FileNumber+'_'+Promaround_.Text+'.stp';
        Button20Click(nil);
end // end of save Img File YES
else
begin
         for k:=0 to N_Puntos-1 do
         begin
         for l:=2*N_Puntos-1 downto N_Puntos do DatatoPlotinFile[l,k]:=b_difference[l,k];
         end;
end; // end of save Img File NO

SizeofImgNumber:=N_Puntos;

Button5Click(nil);


end;

procedure TValProm.Button17Click(Sender: TObject);
var
i,NumberCTS: Integer;
PromBegin_nr,StepCTS: Single;

begin
PromBegin_nr:=abs(StrtoFloat(Prombegin.Text));
StepCTS:=abs(StrtoFloat(Edit7.Text));

NumberCTS:=Round(2*PromBegin_nr/StepCTS);

for i:=0 to NumberCTS do
begin
 Promaround_.text:=FloattoStrF(PromBegin_nr-i*StepCTS,ffFixed,3,3);
 SpinEdit3.Value:=SpinEdit3.Value+1;
 Button19Click(nil);
 DelGrpahClick(nil);
end;

end;

procedure TValProm.Button22Click(Sender: TObject);
begin
SaveDialog2.InitialDir:=Label50.Caption;
if SaveDialog2.Execute then
begin
  Label49.Caption:=ExtractFileName(SaveDialog2.Filename);
  Label50.Caption:=ExtractFileDir(SaveDialog2.Filename);
end;

end;

procedure TValProm.Button23Click(Sender: TObject);
var
   Ext : string;
   i,l,k,PosFin,PosFinFin,SizeHead: Longint;
   WsxmComment: Array [0..5000] of Char;
   AmpZ: Array [0..10] of Char;
   AmplZ: Single;
   Encuentra: Boolean;

begin

OpenDialog1.FilterIndex:=3;
OpenDialog1.FileName:='';
FExist:=false;
if not(OpenDialog1.Execute) then exit;
if not(FileExists(OpenDialog1.FileName))
then
begin
  MessageDlg('File not fund', mtError, [mbOK],0);
  exit;
end;
Ext:=UpperCase(ExtractFileExt(OpenDialog1.Filename)) ;
if Ext<>'.STP'
then
begin
  MessageDlg('No stp-file',mtError,[mbOK],0);
  exit;
end;
  // ABRIR FICHERO
  FExist:=true;
  Ext:=UpperCase(ExtractFileExt(OpenDialog1.Filename)) ;
  F:=TFileStream.Create(OpenDialog1.Filename,fmOpenRead) ;
  F.Seek(0,soFromBeginning) ;
  Label2.Caption:=ExtractFileName(OpenDialog1.Filename);
  Label49.Caption:=ExtractFileName(OpenDialog1.Filename);
  Label50.Caption:=ExtractFileDir(OpenDialog1.Filename);
  SizeHead:=0;

  if Ext = '.STP' then
   begin
    F.ReadBuffer(WsxmComment,Sizeof(WsxmComment));
    for i:=0 to 5000 do if (WsxmComment[i]='n') and (WsxmComment[i+1]='d')
     and (WsxmComment[i+2]=']') then SizeHead:=i+5;
    F.Seek(0,soFromBeginning) ;
    WsxmComment:='';
    F.ReadBuffer(WsxmComment,SizeHead);

    RichEdit1.Text:='';
    Form2.RichEdit1.Text:='';
    for l:=0 to SizeHead-1 do
     begin
      RichEdit1.Text:=RichEdit1.Text+WsxmComment[l];
      Form2.RichEdit1.Text:=RichEdit1.Text+WsxmComment[l];
     end;

    // Label15.Caption:=InttoStr(Round(h.Time));
    // Label16.Caption:=InttoStr(Round(h.Moment));
    // Label42.Caption:=FloattoStr(h.xstart*1e10);
    // Label43.Caption:=FloattoStr(h.ystart*1e10);
    // Label44.Caption:=FloattoStr(abs(h.xstart-h.xend)*1e10);
    // Label45.Caption:=FloattoStr(abs(h.ystart-h.yend)*1e10);
     PosFin:=0;
     for i:=0 to SizeHead-1 do if (WsxmComment[i]='n') and (WsxmComment[i+1]='s')
     and (WsxmComment[i+2]=':') then PosFin:=i+4;

     // Number of points
     Label17.Caption:='';
     for i:=0 to 2 do
     begin
     if WsxmComment[PosFin+i]='-' then Label17.Caption:=''; // borra todo antes del -
     Label17.Caption:=Label17.Caption+WsxmComment[PosFin+i];
     end;

     h.yn:=StrtoInt(Label17.Caption);

     for i:=0 to SizeHead-1 do if (WsxmComment[i]='X') and (WsxmComment[i+1]=' ')
     and (WsxmComment[i+2]='s') then PosFin:=i+18;

     Label42.Caption:='';
     for i:=1 to 5  do
     begin
     if WsxmComment[PosFin+i]='-' then Label42.Caption:='';
     Label42.Caption:=Label42.Caption+WsxmComment[PosFin+i];
     end;
     h.xstart:=StrtoInt(Label42.Caption)*1e-10;

     for i:=0 to SizeHead-1 do if (WsxmComment[i]='Y') and (WsxmComment[i+1]=' ')
     and (WsxmComment[i+2]='s') then PosFin:=i+18;

     Label43.Caption:='';
     for i:=1 to 5 do
     begin
     if WsxmComment[PosFin+i]='-' then Label43.Caption:='';
     Label43.Caption:=Label43.Caption+WsxmComment[PosFin+i];
     end;
     h.ystart:=StrtoInt(Label43.Caption)*1e-10;

     for i:=0 to SizeHead-1 do if (WsxmComment[i]='X') and (WsxmComment[i+1]=' ')
     and (WsxmComment[i+2]='A') then PosFin:=i+12;

     Label44.Caption:='';
     for i:=1 to 4 do
     begin
     if WsxmComment[PosFin+i]='-' then Label44.Caption:='';
     Label44.Caption:=Label44.Caption+WsxmComment[PosFin+i];
     end;
     h.xend:=StrtoInt(Label44.Caption)*1e-10+h.xstart;

     for i:=0 to SizeHead-1 do if (WsxmComment[i]='Y') and (WsxmComment[i+1]=' ')
     and (WsxmComment[i+2]='A') then PosFin:=i+12;

     Label45.Caption:='';
     for i:=1 to 4 do
     begin
     if WsxmComment[PosFin+i]='-' then Label45.Caption:='';
     Label45.Caption:=Label45.Caption+WsxmComment[PosFin+i];
     end;
     h.yend:=StrtoInt(Label45.Caption)*1e-10+h.ystart;

     SizeofImgNumber:=h.yn;

        for l:=0 to h.yn-1 do
         begin
         for k:=0 to h.yn-1 do F.Read(DataWsxmtoPlotinFile[k,l],2);
         end;
        PosFin:=0;
        for i:=0 to SizeHead-1 do if (WsxmComment[i]='d') and (WsxmComment[i+1]='e')
           and (WsxmComment[i+2]=':') then PosFin:=i+3;
        encuentra:=True;
        PosFinFin:=PosFin;
        for i:=PosFin to SizeHead-1 do
         begin
         if ((WsxmComment[i]='Å') or (WsxmComment[i]='P')) and encuentra then
           begin PosFinFin:=i; encuentra:=False; end;
         end;

        for i:=0 to 10 do AmpZ[i]:=' ';
        for i:=0 to (PosFinFin-PosFin-1) do AmpZ[i]:=WsxmComment[PosFin+i];

        AmplZ:=StrtoFloat(AmpZ)*1e-10;

        for l:=0 to h.yn-1 do
         begin
         for k:=0 to h.yn-1 do
            DatatoPlotinFile[k,l]:=DataWsxmtoPlotinFile[k,l]*AmplZ/32767;
         end;

  F.Destroy;
 end;
Button5Click(nil);
OpenDialog1.FilterIndex:=1;
end;

procedure TValProm.SetLengthofStr(Sender: TObject; MyLength: Integer; var MyString: String);
var
MyStrLength,LengthDiff,i: Integer;
Buf: String;

begin
Buf:='';
MyStrLength:=Length(MyString);
if (MyStrLength<MyLength) then
 begin
  LengthDiff:=MyLength-MyStrLength;
  if (LengthDiff<10) then SetLength(Buf,LengthDiff)
  else LengthDiff:=0;
  for i:=1 to LengthDiff do Buf[i]:='0';
  //SetLength(MyString,MyLength);
  MyString:=Buf+MyString;
  end;
end;

procedure TValProm.TrackBar2Change(Sender: TObject);
begin
Button6Click(nil);
end;

procedure TValProm.TrackBar1Change(Sender: TObject);
begin
Button6Click(nil);
end;

procedure TValProm.Button24Click(Sender: TObject);
begin
xyyGraph1[500].Clear;
xyyGraph1[501].Clear;
xyyGraph1[502].Clear;
xyyGraph1[503].Clear;
xyyGraph1[504].Clear;
xyyGraph1[505].Clear;
end;

procedure TValProm.Button25Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TValProm.Button27Click(Sender: TObject);
begin
if Button27.Caption='Enable BitMap' then
 begin
 Image1.Enabled:=True;
 Button27.Caption:='Disable BitMap'
 end
else if Button27.Caption='Disable BitMap' then
 begin
 Image1.Enabled:=False;
 Button27.Caption:='Enable BitMap'
 end;

end;

procedure TValProm.Button28Click(Sender: TObject);
begin
if Button28.Caption='View BitMap' then
 begin
 Image1.Visible:=True;
 Button28.Caption:='Hide BitMap'
 end
else if Button28.Caption='Hide BitMap' then
 begin
 Image1.Visible:=False;
 Button28.Caption:='View BitMap'
 end;

end;

procedure TValProm.Button26Click(Sender: TObject);
var
BitMap: TBitMap;
Rect: TRect;

begin
OpenDialog1.FilterIndex:=4;

BitMap:=TBitMap.Create;

Rect.Left:=0;
Rect.Right:=256;
Rect.Top:=0;
Rect.Bottom:=256;

if OpenDialog1.Execute then
 begin
  // ABRIR FICHERO
  BitMap.LoadfromFile(OpenDialog1.Filename);
  Image1.Canvas.StretchDraw(Rect,BitMap);
  end;
end;

procedure TValProm.Button29Click(Sender: TObject);
var
   F,FFF: TFileStream;
   Ext : string;
  blqname,blqname_s : string ;
  b_offset,Skip: Integer;
  k: Integer;

begin
if Button29.Caption='WORKING PUSH TO STOP' then
 begin
 Button29.Caption:='Erase N points from end';
 exit;
 end;

Skip:=SpinEdit5.Value;

if OpenFichero.Execute then
begin

  F:=TFileStream.Create(Openfichero.Filename,fmOpenRead) ;
  Ext:=UpperCase(ExtractFileExt(Openfichero.Filename)) ;
  F.Seek(0,soFromBeginning) ;
  Label2.Caption:=ExtractFileName(Openfichero.Filename);

if Ext = '.BLQ' then
begin
  FFF:=TFileStream.Create(ExtractFileDir(Openfichero.Filename)+'/erase.blq',fmCreate) ;
  FFF.Seek(0,soFromBeginning) ;

F.Destroy;
FFF.Destroy;

  blqname:=Openfichero.Filename;
  blqname_s:=ExtractFileDir(Openfichero.Filename)+'/erase.blq';
  InfoForm.Mensaje.Caption:='Loading BLQ...' ;
  InfoForm.Show ;
  InfoForm.Refresh ;
  b.SelectBlockFile(blqname) ;
  InfoForm.Close ;

  Button29.Caption:='WORKING PUSH TO STOP';

  for k:= 0 to Skip do
      begin
         if (frac(k/100)<0.01) then
          begin
          Application.ProcessMessages;
          Label56.Caption:=InttoStr(k);
          end;
         b_offset:=b.GetEntryOffset(k) ;
         LoadDataSetFromBlock(blqname,b_offset,DS) ;
         WriteDataSetinBlock(blqname_s,DS,False);
      end;

end;
  Button29.Caption:='Erase N points from end';
end;

end;

procedure TValProm.Button30Click(Sender: TObject);
var
   j,k,l: Longint;
//   F: TFileStream;
//   h: TIMGheader;
   //h: TIMG_Cab;

  FName,DirName,FileNumber : string ;
  NRows,blqPos: Integer;
  N_puntos,Linea: Integer;
  integ: Array[0..1024,0..1024] of Single;
  integral,interv: Single;
  SearchinStr: string;
  ChkBox2Chkd: Boolean;

begin

 if (checkbox2.checked) then N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/2))
  else N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/4));
  //N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/4));
  if (FixPtNrc.Checked) then N_puntos:=StrtoInt(FixPtNr.Text);
  Label6.Caption:=InttoStr(N_puntos);

  ChkBox2Chkd:=checkbox2.checked;

  NRows:=StrtoInt(Points.Caption);

  for k:=0 to N_puntos-1 do
     begin
     NroLinea.Caption:=InttoStr(k);
     Application.ProcessMessages;
// IDA Y VUELTA DE TODA UNA LINEA EN X

 if (ChkBox2Chkd) then Linea:=N_puntos-1 else Linea:=2*N_puntos-1;

     for l:=0 to Linea do
        begin
        Integral:=0;
        Interv:=b_xx_treat_tot[l,k,1]-b_xx_treat_tot[l,k,2];

        for j:=0 to NRows-1 do
          Integral:=Integral+b_yy_treat_tot[l,k,j];
        Integ[l,k]:=Integral*Interv;
        end; // for de l
    end;  // for de k

 if (checkbox5.checked) then
 begin
 if(SaveIMGFile.checked) then
        begin
        h.identif:=$00333333;
        h.version:=$00010000;
        h.day:=1;
        h.month:=1;
        h.year:=2002;
        h.moment:=MiMoment/60/60;  // in hours of the day
        h.time:=MiTime/60;      // in minutes

        if (RadioGroup2.ItemIndex=0) then begin
        SetLength(SearchinStr,12);
        SearchinStr:=Copy(MiPosXY[0,0],(Pos('X:',MiPosXY[0,0]))+2,10);
        if (SearchinStr[1]='-') then
           SearchinStr:=Copy(MiPosXY[0,0],(Pos('X:',MiPosXY[0,0]))+2,11);
        h.xstart:=StrtoFloat(SearchinStr)/2;
        SearchinStr:=Copy(MiPosXY[N_Puntos-1,N_Puntos],(Pos('X:',
            MiPosXY[N_Puntos-1,N_Puntos-1]))+2,10);
        if (SearchinStr[1]='-') then
            SearchinStr:=Copy(MiPosXY[N_Puntos-1,N_Puntos],(Pos('X:',
            MiPosXY[N_Puntos-1,N_Puntos-1]))+2,11);
         h.xend:=StrtoFloat(SearchinStr)/2;
        SearchinStr:=Copy(MiPosXY[0,0],(Pos('Y:',MiPosXY[0,0]))+2,10);
        if (SearchinStr[1]='-') then
           SearchinStr:=Copy(MiPosXY[0,0],(Pos('Y:',MiPosXY[0,0]))+2,11);
        h.ystart:=StrtoFloat(SearchinStr)/2;
        SearchinStr:=Copy(MiPosXY[N_Puntos-1,N_Puntos-1],(Pos('Y:',
            MiPosXY[N_Puntos-1,N_Puntos-1]))+2,10);
        if (SearchinStr[1]='-') then
           SearchinStr:=Copy(MiPosXY[N_Puntos-1,N_Puntos-1],(Pos('Y:',
            MiPosXY[N_Puntos-1,N_Puntos-1]))+2,11);
        h.yend:=StrtoFloat(SearchinStr)/2;
        end
        else
        begin
        h.xstart:=StrtoFloat(Edit3.Text)*1e-8;
        h.xend:=StrtoFloat(Edit4.Text)*1e-8;;
        h.ystart:=StrtoFloat(Edit5.Text)*1e-8;;
        h.yend:=StrtoFloat(Edit6.Text)*1e-8;;
        end;
        h.xn:=N_Puntos;
        h.yn:=N_Puntos;
 // Ida
        for k:=0 to N_Puntos-1 do
         begin
         for l:=0 to N_Puntos-1 do DatatoPlotinFile[l,k]:=Integ[l,k];
         end;
        DirName:=Label50.Caption;
        FName:=Label49.Caption;
        BlqPos:=Pos('.',FName);
        if BlqPos>0 then SetLength(FName,BlqPos);

        FileNumber:=InttoStr(SpinEdit3.Value);
        if Length(FileNumber)=1 then FileNumber:='0'+'0'+FileNumber
        else if Length(FileNumber)=2 then FileNumber:='0'+FileNumber
        else if Length(FileNumber)>3 then SetLength(FileNumber,3);

        //NombreFichero:=

        Label51.Caption:=DirName+'\'+FName+'i_integ'+FileNumber+'_'
        +Promaround_.Text+
        '.stp';
        Button20Click(nil);
 // vuelta
         for k:=0 to N_Puntos-1 do
         begin
         for l:=2*N_Puntos-1 downto N_Puntos do DatatoPlotinFile[l,k]:=integ[l,k];
         end;
        end; // Save IMG File
        Label51.Caption:=DirName+'\'+FName+'v_integ'+FileNumber+'_'+Promaround_.Text+'.stp';
        Button20Click(nil);
end // end of save Img File YES
else
begin
         for k:=0 to N_Puntos-1 do
         begin
         for l:=2*N_Puntos-1 downto N_Puntos do DatatoPlotinFile[l,k]:=integ[l,k];
         end;
end; // end of save Img File NO

SizeofImgNumber:=N_Puntos;

Button5Click(nil);

end;

procedure TValProm.Button31Click(Sender: TObject);
var
   F,FFF: TFileStream;
   Ext : string;
  blqname,blqname_s,Fname : string ;
  index1,npointimag,npointfile: Integer;
  nfile,offset1: Integer;
  k,k1,skip: Integer;
  blqPos: Integer;

begin
 if Button31.Caption='WORKING' then
 begin
 Button31.Caption:='Split a file';
 exit;
 end;

 npointimag:=StrToInt(Edit12.Text);
 npointfile:=(4*npointimag*npointimag);
 nfile:=StrToInt(Edit13.Text);
 index1:=0;

 if OpenFichero.Execute then
begin
  for k1:=1 to nfile do
    begin
  F:=TFileStream.Create(Openfichero.Filename,fmOpenRead) ;
  Ext:=UpperCase(ExtractFileExt(Openfichero.Filename)) ;
  F.Seek(0,soFromBeginning) ;
  Label2.Caption:=ExtractFileName(Openfichero.Filename);
  FName:=ExtractFileName(Openfichero.Filename);
  BlqPos:=Pos('.',FName);
  if BlqPos>0 then SetLength(FName,BlqPos-1);

   index1:=index1+1;

  Button31.Caption:='Push to stop';

if Ext = '.BLQ' then
begin

//   for k1:=1 to nfile do
//    begin
    Label60.Caption:=Fname+'_'+IntToStr(index1)+'.blq';
     FFF:=TFileStream.Create(ExtractFileDir(Openfichero.Filename)+'/'+Label60.Caption,fmCreate) ;
     FFF.Seek(0,soFromBeginning) ;

     F.Destroy;
     FFF.Destroy;

     blqname:=Openfichero.Filename;
     blqname_s:=ExtractFileDir(Openfichero.Filename)+'/'+Label60.Caption;
     InfoForm.Mensaje.Caption:='Loading BLQ...' ;
     InfoForm.Show ;
     InfoForm.Refresh ;
     b.SelectBlockFile(blqname);
     InfoForm.Close ;
//     index1:=index1+1;

      for k:=0 to npointfile-1 do
      begin
         skip:=(k1-1)*npointfile;
         offset1:=b.GetEntryOffset(k+Skip) ;

         LoadDataSetFromBlock(blqname,offset1,DS) ;
         WriteDataSetinBlock(blqname_s,DS,False);
      end;

    end;
  end;
  end;
    Button31.Caption:='Split a file';
end;

procedure Triangulation(l,k:integer; m_cola3:array of TPart; var m_con:array of TConnection);
var
//   Ext : string;
//   i,j,l,k,n,o,p,PosFin,PosFinFin,SizeHead: Longint;
     i,j,o,p:Longint;
     alpha, beta: extended;
//   WsxmComment: Array [0..5000] of Char;
//   AmpZ: Array [0..10] of Char;
//   AmplZ: Single;
//   Encuentra: Boolean;
//   s, s1, s2: string;
//   sl: TStringList;
     Pr,Pl:TPoint;
//   slRow:array of string;
//   m:array of array of string;
//   m1:array of array of extended;
//   m2:array of TPoint;
//   m_con: array of TConnection;
     m_cola, m_cola2:array of TPart;
     m_sort_left,m_sort_right:array[0..4223] of TAngle;
//   line, col, linecount, colcount, lines: integer;
//   a,b1,b2,c:boolean;
     a, b1,b2,c,br,bl:boolean;
//   ch: char;
//   Bitmap: TBitmap;
  function CheckDistance(ax,ay,bx,by,cx,cy,tx,ty:integer):integer;
  // This function investigates if T(tx,ty) is inside the circle defined by
  // A(ax,ay), B(bx,by), C(cx,cy). The result is true when T is not inside the circle.
  var radius,middlex,middley,d,u,v:extended;
      b:integer;
//      c:TCircle;
  begin
    result:=2;
    b:=0;
    d:=ax*by+bx*cy+cx*ay-ax*cy-bx*ay-cx*by;
    u:=(by-cy)*(Power(ax,2)+Power(ay,2))+(cy-ay)*(Power(bx,2)+Power(by,2))+(ay-by)*(Power(cx,2)+Power(cy,2));
    v:=(cx-bx)*(Power(ax,2)+Power(ay,2))+(ax-cx)*(Power(bx,2)+Power(by,2))+(bx-ax)*(Power(cx,2)+Power(cy,2));
    if d<>0 then
    begin
      middlex:=0.5*u/d;
      middley:=0.5*v/d;
//    middley:=(Power(ax,2)+Power(ay,2)-Power(cx,2)-Power(cy,2)-(ax-cx)/(ax-bx)*(Power(ay,2)+Power(ax,2)-Power(bx,2)-Power(by,2)))/(2*(ay-cy+(ax-cx)/(ax-bx)*(by-ay)));
//    middlex:=((Power(ay,2)+Power(ax,2)-Power(by,2)-Power(bx,2))/2.0+middley*(by-ay))/(ax-bx);
      radius:=sqrt(Power(ax-middlex,2)+Power(ay-middley,2));
      if ((Power(tx-middlex,2)+Power(ty-middley,2))>Power(radius,2)) or
         (abs(Power(tx-middlex,2)+Power(ty-middley,2)-Power(radius,2))<1E-6) then b:=1;
      if (tx=0.0) and (ty=0.0) then result:=1 else result:=b;
    end;
  end;
  function absvec2(a,b:integer):extended;
  begin
    result:=sqrt(Power(a,2)+Power(b,2))
  end;
  function scalarproduct2(ax,ay,bx,by:integer):integer;
  begin
    result:=ax*bx+ay*by;
  end;
  function angbetvec2(ax,ay,bx,by:integer):extended;
  var a,b,c,d,e:extended;
  begin
    a:=scalarproduct2(ax,ay,bx,by);
    b:=absvec2(ax,ay);
    c:=absvec2(bx,by);
    if b*c<>0.0
    then
    begin
      e:=a/(b*c);
      if (round(e)=1) and (abs(frac(e))<1E-9)
      then d:=0
      else
        if (round(e)=-1) and (abs(frac(e))<1E-9)
        then d:=Pi
        else d:=arccos(e);
      if ax*by-ay*bx>0 then result:=d else result:=2*Pi-d;
    end
    else result:=Pi/2
  end;
  function Cut(ax,ay,bx,by,cx,cy,dx,dy:integer):boolean;
  // True if AB cuts CD
  var m1, m2, xs, ys:extended;
      a: boolean;
      min1, min2, max1, max2:integer;
  begin
    a:=false;
    min1:=0;
    max1:=0;
    if ax<bx then
    begin
      min1:=ax;
      max1:=bx;
    end
    else
      if bx<ax then
      begin
        min1:=bx;
        max1:=ax;
      end
      else
      begin
        if ay<by then
        begin
          min1:=ay;
          max1:=by;
        end
        else
        begin
          min1:=by;
          max1:=ay;
        end;
        if cy<dy then
        begin
          min2:=cy;
          max2:=dy;
        end
        else
        begin
          min2:=dy;
          max2:=cy;
        end;
        if cx=dx
        then
        begin
          if ax=cx
          then
            if min1<min2
            then
              if max1>min2 then a:=true else a:=false
            else
              if max2>min1 then a:=true else a:=false
          else a:=false;
        end
        else
        begin
          if cx<dx
          then
          begin
            min2:=cx;
            max2:=dx
          end
          else
          begin
            min2:=dx;
            max2:=cx;
          end;
          m1:=(cy-dy)/(cx-dx);
          m2:=cy-m1*cx;
          ys:=m1*ax+m2;
          if ((ys>min1) and (ys<max1)) and ((ax>min2) and (ax<max2))
          then
            if ((abs(ys-min1))>1E-9) and ((abs(max1-ys))>1E-9) and
               ((abs(ax-min2))>1E-9) and ((abs(max2-ax))>1E-9)
            then a:=true else a:=false
          else a:=false;
        end;
      end;
    if cx<dx then
    begin
      min2:=cx;
      max2:=dx;
    end
    else
    begin
      min2:=dx;
      max2:=cx;
    end;
    if dx=cx
    then
      if (ax<>bx)
      then
      begin
        m1:=(by-ay)/(bx-ax);
        if cy<dy
        then
        begin
          min1:=cy;
          max1:=dy;
        end
        else
        begin
          min1:=dy;
          max1:=cy;
        end;
        ys:=ay+m1*(cx-ax);
        if (ys>min1) and (ys<max1) then
          if (abs(ys-min1)>1E-9) and (abs(max1-ys)>1E-9) then a:=true else a:=false;
      end
      else
    else
    begin
      if bx<>ax then
      begin
        m1:=(by-ay)/(bx-ax);
        m2:=(dy-cy)/(dx-cx);
        if m1=m2
        then
        begin
          if ax<bx
          then
          begin
            min1:=ax;
            max1:=bx;
          end
          else
          begin
            min1:=bx;
            max1:=ax;
          end;
          if cx<dx
          then
          begin
            min2:=cx;
            max2:=dx;
          end
          else
          begin
            min2:=dx;
            max2:=cx;
          end;
          if cy=ay+m1*(cx-ax)
          then
            if min1<min2
            then
              if max1>min2 then a:=true else a:=false
            else
              if max2>min1 then a:=true else a:=false
          else a:=false
        end
        else
        begin
          xs:=(cy-ay+m1*ax-m2*cx)/(m1-m2);
          if (((xs>min1) and (xs<max1)) and ((xs>min2) and (xs<max2)))
          then
            if (abs(xs-min1)>1E-9) and (abs(max1-xs)>1E-9) and
               (abs(xs-min2)>1E-9) and (abs(max2-xs)>1E-9)
            then a:=true
            else a:=false;
        end;
      end;
    end;
    Cut:=a;
  end;
  procedure SearchBaseLine;
  var i,j,n,m:integer;
  begin
    o:=0;
    for i:=0 to length(m_cola[1].num)-1 do
    begin
      for j:=0 to length(m_cola[1].num)-1 do
        if m_cola[1].num[j].y>=o then o:=m_cola[1].num[j].y;
            // o has maximum y
      // at first the right part m_cola[1]
      for j:=0 to length(m_cola[1].num)-1 do
      begin
        b1:=true;
        if i<>0 then
          for n:=0 to length(m_cola[1].num)-1 do   // exist value?
            if (j=m_sort_right[n].i) and (m_sort_right[n].alpha=1) then b1:=false;
          // m_sort_right[n].alpha=1 means, that there is a value in m_sort_right[n]
        if (m_cola[1].num[j].y<=o) and (b1) then   // smaller value
        begin
          o:=m_cola[1].num[j].y; // new value is lower than old value
          a:=true;
          if i=0 then   // first value --> write at first position
          begin
            m_sort_right[i].i:=j;
            m_sort_right[i].alpha:=1;
          end
          else          // not the first value
          begin
            for n:=0 to i-1 do  // for all values: the same like the new one? --> a false
              if (m_cola[1].num[j].y=m_cola[1].num[m_sort_right[n].i].y) and
                 (m_cola[1].num[j].x=m_cola[1].num[m_sort_right[n].i].x)
              then a:=false;
            if a then           // new value don't exist in m_sort_right --> write new value
            begin
              m_sort_right[i].i:=j;
              m_sort_right[i].alpha:=1;  // only for the difference to 0
            end;
          end;
        end;
      end;
      o:=0; // looking for next candidate --> starting with o=0
    end;
    o:=0;
    // the same with the left part m_cola[0]
    for i:=0 to length(m_cola[0].num)-1 do
    begin
      for j:=0 to length(m_cola[0].num)-1 do
        if m_cola[0].num[j].y>=o then o:=m_cola[0].num[j].y;
            // o has maximum y
      for j:=0 to length(m_cola[0].num)-1 do
      begin
        b1:=true;
        if i<>0 then
          for n:=0 to length(m_cola[0].num)-1 do
            if (j=m_sort_left[n].i) and (m_sort_left[n].alpha=1) then b1:=false;
        if (m_cola[0].num[j].y<=o) and (b1) then
        begin
          o:=m_cola[0].num[j].y;
          a:=true;
          if i=0 then
          begin
            m_sort_left[i].i:=j;
            m_sort_left[i].alpha:=1;
          end
          else
          begin
            for n:=0 to i-1 do
              if (m_cola[0].num[j].y=m_cola[0].num[m_sort_left[n].i].y) and
                 (m_cola[0].num[j].x=m_cola[0].num[m_sort_left[n].i].x)
              then a:=false;
            if a then
            begin
              m_sort_left[i].i:=j;
              m_sort_left[i].alpha:=1;
            end;
          end;
        end;
      end;
      o:=0;
    end;
    a:=true;
    // looking for a candidate for the base line in the left part
    // in the right part: point with lowest y
    for n:=0 to length(m_cola[0].num)-1 do
      for m:=0 to length(m_cola[1].num)-1 do  // for all points in the right part
        if a then                             // point wasn´t found
        begin
          // cuts the baseline a line with two other points in the left part
          for i:=0 to length(m_cola[0].num)-1 do     // for all combinations
            for j:=i+1 to length(m_cola[0].num)-1 do //  of pairs in the left part
              if (not((m_cola[0].num[m_sort_left[n].i].x=m_cola[0].num[i].x) and
                      (m_cola[0].num[m_sort_left[n].i].y=m_cola[0].num[i].y))) and
                 (not((m_cola[0].num[m_sort_left[n].i].x=m_cola[0].num[j].x) and
                      (m_cola[0].num[m_sort_left[n].i].y=m_cola[0].num[j].y)))
              then
              begin
                if Cut(m_cola[0].num[m_sort_left[n].i].x,m_cola[0].num[m_sort_left[n].i].y,
                       m_cola[1].num[m_sort_right[m].i].x,m_cola[1].num[m_sort_right[m].i].y,
                       m_cola[0].num[i].x,m_cola[0].num[i].y,
                       m_cola[0].num[j].x,m_cola[0].num[j].y)
                then a:=false;
              end;
          for i:=0 to length(m_cola[1].num)-1 do     // for all combinations
            for j:=i+1 to length(m_cola[1].num)-1 do //  of pairs in the right part
              if (not((m_cola[0].num[m_sort_left[n].i].x=m_cola[1].num[i].x) and
                      (m_cola[0].num[m_sort_left[n].i].y=m_cola[1].num[i].y))) and
                 (not((m_cola[0].num[m_sort_left[n].i].x=m_cola[1].num[j].x) and
                      (m_cola[0].num[m_sort_left[n].i].y=m_cola[1].num[j].y)))
              then
              begin
                if Cut(m_cola[0].num[m_sort_left[n].i].x,m_cola[0].num[m_sort_left[n].i].y,
                       m_cola[1].num[m_sort_right[m].i].x,m_cola[1].num[m_sort_right[m].i].y,
                       m_cola[1].num[i].x,m_cola[1].num[i].y,
                       m_cola[1].num[j].x,m_cola[1].num[j].y)
                then a:=false;
              end;
          if a then   // no cut --> write the values
          begin
            m_con[k].P1:=m_cola[0].num[m_sort_left[n].i];
            m_con[k].P2:=m_cola[1].num[m_sort_right[m].i];
            a:=false;
          end
          else a:=true;
        end;
  end;
  procedure CandidateSearch;
  var i,j,n:integer;
  begin
      beta:=Pi; // angle for camparison
      for i:=0 to length(m_sort_right)-1 do   // delete all values
      begin
        m_sort_right[i].alpha:=0.0;
        m_sort_right[i].i:=0;
      end;
      for i:=0 to length(m_sort_left)-1 do
      begin
        m_sort_left[i].alpha:=0.0;
        m_sort_left[i].i:=0;
      end;
      // at first the part on the right side
      for i:=0 to length(m_cola[1].num)-1 do  // for all parts
      begin
        alpha := angbetvec2(m_cola[1].num[i].x-m_con[k].P2.x,m_cola[1].num[i].y-m_con[k].P2.y,
                            m_con[k].P1.x-m_con[k].P2.x,m_con[k].P1.y-m_con[k].P2.y);   // calculate the angle
        if (alpha<beta) and ((m_cola[1].num[i].x<>m_con[k].P2.x) or (m_cola[1].num[i].y<>m_con[k].P2.y)) then
        // only this angles are orientated to the left part and it is not the point on the baseline
        begin
          a:=false;
          if (m_sort_right[0].alpha=0.0) then //or b2 then // don´t exist a point --> write at the first position
          begin
            m_sort_right[0].alpha:=alpha;
            m_sort_right[0].i:=i;
          end
          else        // exist a point
          begin
            o:=length(m_sort_right)-1;
            b1:=true;
            for j:=length(m_sort_right)-1 downto 0 do
              if (m_sort_right[j].alpha=0.0) and (b1) then o:=o-1 else b1:=false; // o has the number of existing points
            for j:=0 to o do
            begin
              if not(a) then
                if (alpha<m_sort_right[j].alpha) and (m_sort_right[j].alpha<>0.0) then // when angle is smaller
                begin
                  for n:=o downto j do
                  begin     // transfer all of the following angles to the next position
                    m_sort_right[n+1].alpha:=m_sort_right[n].alpha;
                    m_sort_right[n+1].i:=m_sort_right[n].i;
                  end;
                  m_sort_right[j].alpha:=alpha;   // write the angle at position j
                  m_sort_right[j].i:=i;
                  a:=true;
                end
                else
                  if (m_sort_right[j+1].alpha=0.0) or b2 then // write behind the last angle
                  begin
                    m_sort_right[j+1].alpha:=alpha;
                    m_sort_right[j+1].i:=i;
                    a:=true;
                  end;
            end;
          end;
        end;
      end;
      // the same with the left part
      for i:=0 to length(m_cola[0].num)-1 do
      begin
        alpha := angbetvec2(m_con[k].P2.x-m_con[k].P1.x,m_con[k].P2.y-m_con[k].P1.y,
                            m_cola[0].num[i].x-m_con[k].P1.x,m_cola[0].num[i].y-m_con[k].P1.y);
        if (alpha<beta) and ((m_cola[0].num[i].x<>m_con[k].P1.x) or (m_cola[0].num[i].y<>m_con[k].P1.y)) then
        // only this angles are orientated to the left part and it is not the point on the baseline
        begin
          a:=false;
          if m_sort_left[0].alpha=0.0 then
          begin
            m_sort_left[0].alpha:=alpha;
            m_sort_left[0].i:=i;
          end
          else
          begin
            o:=length(m_sort_left)-1;
            b1:=true;
            for j:=length(m_sort_left)-1 downto 0 do
              if (m_sort_left[j].alpha=0.0) and (b1) then o:=o-1 else b1:=false;
            for j:=0 to o do
            begin
              if not(a) then
                if (alpha<m_sort_left[j].alpha) and (m_sort_left[j].alpha<>0.0) then
                begin
                  for n:=o downto j do
                  begin     // transfer to the next position
                    m_sort_left[n+1].alpha:=m_sort_left[n].alpha;
                    m_sort_left[n+1].i:=m_sort_left[n].i;    // position +1
                  end;
                  m_sort_left[j].alpha:=alpha;
                  m_sort_left[j].i:=i;
                  a:=true;
                end
                else
                  if m_sort_left[j+1].alpha=0.0 then
                  begin
                    m_sort_left[j+1].alpha:=alpha;
                    m_sort_left[j+1].i:=i;
                    a:=true;
                  end;
            end;
          end;
        end;
      end;
      a:=false;
      o:=length(m_sort_right)-1;
      b1:=true;
      // exist candidates in m_sort_right --> a will be true
      for j:=length(m_sort_right)-1 downto 0 do
        if (m_sort_right[j].alpha=0.0) and (b1) then o:=o-1 else b1:=false;
      for i:=0 to o do
        if m_sort_right[i].alpha<>0.0 then a:=true; // not empty?
      o:=length(m_sort_left)-1;
      b1:=true;
      for j:=length(m_sort_left)-1 downto 0 do
        if (m_sort_left[j].alpha=0.0) and (b1) then o:=o-1 else b1:=false;
      for i:=0 to o do
        if m_sort_left[i].alpha<>0.0 then a:=true; // not empty?
      if a then  // exist a candidate in one of the two parts?
      begin
        Pr.x:=0;
        Pr.y:=0;
        b1:=true;
        o:=length(m_sort_right)-1;
        for j:=length(m_sort_right)-1 downto 0 do
          if (m_sort_right[j].alpha=0.0) and (b1) then o:=o-1 else b1:=false;
        // o with the numbers of non-zero values
        if o=-1 then // exist no value in the right part?
        begin
          Pr.x:=m_con[k].P2.x;//m_cola[1].num[0].x;
          Pr.y:=m_con[k].P2.y;//m_cola[1].num[0].y;
        end
        else
        if o=0 then // exist no value in the right part?
        begin
          Pr.x:=m_cola[1].num[m_sort_right[0].i].x;
          Pr.y:=m_cola[1].num[m_sort_right[0].i].y;
        end
        else
          for i:=0 to o do // for all values
            if not(b1) then
            begin
              for j:=0 to length(m_cola[1].num)-1 do // for all other values
                if not((m_cola[1].num[m_sort_right[i].i].x=m_con[k].P1.x) and
                       (m_cola[1].num[m_sort_right[i].i].y=m_con[k].P1.y)) and
                   not((m_cola[1].num[m_sort_right[i].i].x=m_con[k].P2.x) and
                       (m_cola[1].num[m_sort_right[i].i].y=m_con[k].P2.y)) and
                   not((m_cola[1].num[j].x=m_con[k].P1.x) and
                       (m_cola[1].num[j].y=m_con[k].P1.y)) and
                   not((m_cola[1].num[j].x=m_con[k].P2.x) and
                       (m_cola[1].num[j].y=m_con[k].P2.y)) and // not the same like the baseline
                   not((m_cola[1].num[m_sort_right[i].i].x=m_cola[1].num[j].x) and
                       (m_cola[1].num[m_sort_right[i].i].y=m_cola[1].num[j].y))
                then
                begin
                  if CheckDistance(m_con[k].P1.x,m_con[k].P1.y,
                                   m_con[k].P2.x,m_con[k].P2.y,
                                   m_cola[1].num[m_sort_right[i].i].x,m_cola[1].num[m_sort_right[i].i].y,
                                   m_cola[1].num[j].x,m_cola[1].num[j].y)=0
                  then b1:=true;   // point is inside the circle
                end
                else
                  if ((m_cola[1].num[m_sort_right[i].i].x=m_con[k].P1.x) and
                      (m_cola[1].num[m_sort_right[i].i].y=m_con[k].P1.y)) or
                     ((m_cola[1].num[m_sort_right[i].i].x=m_con[k].P2.x) and
                      (m_cola[1].num[m_sort_right[i].i].y=m_con[k].P2.y)) // point is not the baseline
                  then b1:=true;
//              p:=length(m_sort_left)-1;
              b2:=true;
              // for all points in the right part
//              for j:=o downto 0 do
//                if (m_sort_left[j].alpha=0.0) and (b2) then p:=p-1 else b2:=false;

              p:=length(m_sort_left)-1;
              while p>=0 do
                if m_sort_left[p].alpha=0.0 then dec(p) else break;

              for n:=0 to p do
                if not((m_cola[1].num[m_sort_right[i].i].x=m_con[k].P1.x) and
                       (m_cola[1].num[m_sort_right[i].i].y=m_con[k].P1.y)) and
                   not((m_cola[1].num[m_sort_right[i].i].x=m_con[k].P2.x) and
                       (m_cola[1].num[m_sort_right[i].i].y=m_con[k].P2.y)) and
                   not((m_cola[0].num[n].x=m_con[k].P1.x) and
                       (m_cola[0].num[n].y=m_con[k].P1.y)) and
                   not((m_cola[0].num[n].x=m_con[k].P2.x) and
                       (m_cola[0].num[n].y=m_con[k].P2.y))
                then
                begin
                  if CheckDistance(m_con[k].P1.x,m_con[k].P1.y,
                                   m_con[k].P2.x,m_con[k].P2.y,
                                   m_cola[1].num[m_sort_right[i].i].x,m_cola[1].num[m_sort_right[i].i].y,
                                   m_cola[0].num[n].x,m_cola[0].num[n].y)=0
                  then b1:=true;
                end;
              if not(b1) then // Delaunay condition works --> the candidate of the right side is found
              begin
                Pr.x:=m_cola[1].num[m_sort_right[i].i].x;
                Pr.y:=m_cola[1].num[m_sort_right[i].i].y;
                b1:=true;
              end
              else b1:=false;
            end;
        if (Pr.x=0) and (Pr.y=0) then br:=false; // The point (0,0) can´t be the candidate of the right part
        // the same with the left side
        Pl.x:=0;
        Pl.y:=0;
        b1:=true;
        o:=length(m_sort_left)-1;
        for j:=length(m_sort_left)-1 downto 0 do
          if (m_sort_left[j].alpha=0.0) and (b1) then o:=o-1 else b1:=false;
        b1:=false;
        if o=-1 then
        begin
          Pl.x:=m_con[k].P1.x;
          Pl.y:=m_con[k].P1.y;
        end
        else
        if o=0 then
        begin
          Pl.x:=m_cola[0].num[m_sort_left[0].i].x;
          Pl.y:=m_cola[0].num[m_sort_left[0].i].y;
        end
        else
          for i:=0 to o do
          begin
            if not(b1) then //and (j<>(o+1)) do
            begin
              for j:=0 to length(m_cola[0].num)-1 do
                if not((m_cola[0].num[m_sort_left[i].i].x=m_con[k].P1.x) and
                       (m_cola[0].num[m_sort_left[i].i].y=m_con[k].P1.y)) and
                   not((m_cola[0].num[m_sort_left[i].i].x=m_con[k].P2.x) and
                       (m_cola[0].num[m_sort_left[i].i].y=m_con[k].P2.y)) and
                   not((m_cola[0].num[j].x=m_con[k].P1.x) and
                       (m_cola[0].num[j].y=m_con[k].P1.y)) and
                   not((m_cola[0].num[j].x=m_con[k].P2.x) and
                       (m_cola[0].num[j].y=m_con[k].P2.y)) and
                   not((m_cola[0].num[m_sort_left[i].i].x=m_cola[0].num[j].x) and
                       (m_cola[0].num[m_sort_left[i].i].y=m_cola[0].num[j].y))
                then
                begin
                  if CheckDistance(m_con[k].P1.x,m_con[k].P1.y,
                                   m_con[k].P2.x,m_con[k].P2.y,
                                   m_cola[0].num[m_sort_left[i].i].x,m_cola[0].num[m_sort_left[i].i].y,
                                   m_cola[0].num[j].x,m_cola[0].num[j].y)=0
                  then b1:=true  // b when point inside the cirle
                end
                else
                  if ((m_cola[0].num[m_sort_left[i].i].x=m_con[k].P1.x) and
                      (m_cola[0].num[m_sort_left[i].i].y=m_con[k].P1.y)) or
                     ((m_cola[0].num[m_sort_left[i].i].x=m_con[k].P2.x) and
                      (m_cola[0].num[m_sort_left[i].i].y=m_con[k].P2.y))
                  then b1:=true;
              b2:=true;
  //            p:=length(m_sort_right)-1;
  //            for j:=length(m_sort_right)-1 downto 0 do
  //              if (m_sort_right[j].alpha=0.0) and (b2) then p:=p-1 else b2:=false;

              p:=length(m_sort_right)-1;
              while p>=0 do
                if m_sort_right[p].alpha=0.0 then dec(p) else break;
              for n:=0 to p do
                if not((m_cola[0].num[m_sort_left[i].i].x=m_con[k].P1.x) and
                       (m_cola[0].num[m_sort_left[i].i].y=m_con[k].P1.y)) and
                   not((m_cola[0].num[m_sort_left[i].i].x=m_con[k].P2.x) and
                       (m_cola[0].num[m_sort_left[i].i].y=m_con[k].P2.y)) and
                   not((m_cola[1].num[n].x=m_con[k].P1.x) and
                       (m_cola[1].num[n].y=m_con[k].P1.y)) and
                   not((m_cola[1].num[n].x=m_con[k].P2.x) and
                       (m_cola[1].num[n].y=m_con[k].P2.y))
                then
                begin
                  if CheckDistance(m_con[k].P1.x,m_con[k].P1.y,
                                   m_con[k].P2.x,m_con[k].P2.y,
                                   m_cola[0].num[m_sort_left[i].i].x,m_cola[0].num[m_sort_left[i].i].y,
                                   m_cola[1].num[n].x,m_cola[1].num[n].y)=0
                  then b1:=true  // b when point inside the cirle
                end;
              if not(b1) then   // when all other points outside the circle
              begin
                Pl.x:=m_cola[0].num[m_sort_left[i].i].x;
                Pl.y:=m_cola[0].num[m_sort_left[i].i].y;
                b1:=true;
              end
              else b1:=false;
            end;
          end;
      if (Pl.x=0) and (Pl.y=0) then bl:=false;
      end;
  end;
  procedure NewBaseline;
  var i,j,n:integer;
  begin
      if not(((Pr.x=m_con[k].P2.x) and (Pr.y=m_con[k].P2.y)) or
             ((Pl.x=m_con[k].P1.x) and (Pl.y=m_con[k].P1.y)))
             // points aren´t the same like in the baseline
      then
      begin
        if (CheckDistance(m_con[k].P1.x,m_con[k].P1.y,
                          m_con[k].P2.x,m_con[k].P2.y,
                          Pr.x,Pr.y,Pl.x,Pl.y)=0) or (not(br))
        then // left point is the right one (or both --> than choose the left one)
          if bl
          then
          begin
            m_con[k+1].P1.x:=Pl.x;
            m_con[k+1].P1.y:=Pl.y;
            m_con[k+1].P2:=m_con[k].P2;
          end
          else
          begin
            if br
            then
            begin
              m_con[k+1].P2.x:=Pr.x;
              m_con[k+1].P2.y:=Pr.y;
              m_con[k+1].P1:=m_con[k].P1;
            end
            else c:=true;
          end
        else
        begin
          if (CheckDistance(m_con[k].P1.x,m_con[k].P1.y,
                            m_con[k].P2.x,m_con[k].P2.y,
                            Pl.x,Pl.y,Pr.x,Pr.y)=0) or (not(bl))
          then // right point is the right one
            if br
            then
            begin
              m_con[k+1].P2.x:=Pr.x;
              m_con[k+1].P2.y:=Pr.y;
              m_con[k+1].P1:=m_con[k].P1;
            end
            else
          else // no difference between the right and the left candidate --> choose left one
            if bl
            then
            begin
              m_con[k+1].P1.x:=Pl.x;
              m_con[k+1].P1.y:=Pl.y;
              m_con[k+1].P2:=m_con[k].P2;
            end;
        end;
        k:=k+1;   // one connection more
        b2:=true;
      end
      else
      begin
        if (Pr.x=m_con[k].P2.x) and (Pr.y=m_con[k].P2.y) // right candidate on the baseline?
        then
        begin
          if (Pl.x=m_con[k].P1.x) and (Pl.y=m_con[k].P1.y) // left candidate on the baseline
          then c:=true  // triangulation finished
          else
          begin
            if bl then
            begin
              m_con[k+1].P1.x:=Pl.x;        // write the left part
              m_con[k+1].P1.y:=Pl.y;
              m_con[k+1].P2:=m_con[k].P2;
            end
            else c:=true;
          end
        end
        else
          if (Pl.x=m_con[k].P1.x) and (Pl.y=m_con[k].P1.y)
          then
          begin           // write the right part
            if br then
            begin
              m_con[k+1].P2.x:=Pr.x;
              m_con[k+1].P2.y:=Pr.y;
              m_con[k+1].P1:=m_con[k].P1;
            end
            else c:=true;
          end;
        k:=k+1;   // one connection more
        b2:=true;
      end;
    n:=0;
    for i:=0 to k-1 do
      if Cut(m_con[i].P1.x,m_con[i].P1.y,m_con[i].P2.x,m_con[i].P2.y,
             m_con[k].P1.x,m_con[k].P1.y,m_con[k].P2.x,m_con[k].P2.y)
      then
      begin
        if ((m_con[i].P1.x<>m_con[k].P1.x) or (m_con[i].P1.y<>m_con[k].P1.y)) and
           ((m_con[i].P2.x<>m_con[k].P2.x) or (m_con[i].P2.y<>m_con[k].P2.y))
        then
        begin
          for j:=i to k-1 do
            with m_con[j] do
            begin
              P1.x:=m_con[j+1].P1.x;
              P1.y:=m_con[j+1].P1.y;
              P2.x:=m_con[j+1].P2.x;
              P2.y:=m_con[j+1].P2.y;
            end;
          with m_con[k] do
          begin
            P1.x:=0;
            P1.y:=0;
            P2.x:=0;
            P2.y:=0;
          end;
          dec(k);
        end;
      end;
  end;
begin
  SetLength(m_cola, length(m_cola3));
  for i:=0 to length(m_cola3)-1 do m_cola[i]:=m_cola3[i];
  m_cola2:=nil;
  while l>1 do
  begin
    //-----------------Search base line--------------------
    SearchBaseLine;
    c:=false;
    b2:=false;  // true after the first baseline
    while not(c) do // there are parts left
    begin
      br:=true; bl:=true;
      // ----------- Looking for candidates for the next baseline -------------
      CandidateSearch;
      // new baseline
      NewBaseline;
    end;
    // ------ change the number y constitution of the parts
    m_cola2:=m_cola;  // copy
    Setlength(m_cola, length(m_cola)-1);  // length - 1 (because two parts are connected now)
    i:=length(m_cola[0].num)+length(m_cola2[1].num); // new length of the bigger new part (m_cola[0])
    if length(m_cola)>1 then Setlength(m_cola[0].num, i); // when there are more than one part, set the new length
    for i:=1 to length(m_cola)-1 do Setlength(m_cola[i].num, length(m_cola2[i+1].num)); // set the length of the other parts
    for i:=0 to length(m_cola2[0].num)-1 do // set the values of the older first part
      m_cola[0].num[i]:=m_cola2[0].num[i];
    for j:=length(m_cola2[0].num) to length(m_cola[0].num)-1 do // set the values of the older second part at the end of the new first part
      m_cola[0].num[j]:=m_cola2[1].num[j-length(m_cola2[0].num)];
    for i:=1 to length(m_cola)-1 do  // set the values of all of the other parts
      for j:=0 to length(m_cola[i].num)-1 do
        m_cola[i].num[j]:=m_cola2[i+1].num[j];
    l:=l-1;        // number of parts - 1
  end;
  Finalize(m_cola2);
  Finalize(m_cola);
end;

function lese_zeile(const s:string; var x,y,z:extended):boolean;
  var   k    : integer;
        s1,s2: string;
  begin
    result:=FALSE; s1:=s;
    k:=pos(#9,s1); if k = 0 then exit;
    s2:=copy(s1,1,k-1); s1:=copy(s1,k+1,length(s1)-k);
    if not TextToFloat(PChar(s2),x,fvExtended) then exit;
    k:=pos(#9,s1); if k = 0 then exit;
    s2:=copy(s1,1,k-1); s1:=copy(s1,k+1,length(s1)-k);
    if not TextToFloat(PChar(s2),y,fvExtended) then exit;
    if not TextToFloat(PChar(s1),z,fvExtended) then exit;
    result:=TRUE;
    end;


procedure TValProm.NeighborButtonClick(Sender: TObject);
var
   Ext : string;
   i,j,l,k,n,o,p,q,amp,PosFin,PosFinFin,SizeHead: Longint;
   WsxmComment: Array [0..5000] of Char;
   AmpZ: Array [0..10] of Char;
   AmplZ: Single;
   Encuentra: Boolean;
   s, s1, s2: string;
   sl: TStringList;
   slRow:array of string;
//   m:array of array of string;
   m1:array of array of extended;
   m11:array of array of byte;
   m2,m3:array of TPoint;
   m_con: array of TConnection;
   m_cola:array of TPart;
   m_point:array of TPoint;
   m_neighbor:array of TNeighbor;
   line, col, linecount, colcount, lines: integer;
   ch: char;
   Bitmap: TBitmap;
   ex,ey,ez: extended;
   ok: boolean;
   g:textfile;
  function ChangePosFin(s1,s2,s3:string; j:integer; WsxmComment:array of char):integer;
  var i,k:integer;
  begin
    k:=PosFin;
    for i:=0 to SizeHead-1 do
      if (WsxmComment[i]=s1) and (WsxmComment[i+1]=s2) and (WsxmComment[i+2]=s3)
      then k:=i+j;
    ChangePosFin:=k;
  end;
  function determinante3x3(ax,ay,az,bx,by,bz,cx,cy,cz:integer):integer;
  begin
    result:=ax*by*cz+ay*bz*cx+az*bx*cy-ax*bz*cy-ay*bx*cz-az*by*cx;
  end;
  function Cut3Points(ax,ay,bx,by,cx,cy:integer):integer;
  var m,n:extended;
      d:extended;
      i:integer;
      a:boolean;
  begin
    a:=false;
    d:=sqrt(Power(ax-bx,2)+Power(ay-by,2));
    i:=1;
    if sqrt(Power(bx-cx,2)+Power(by-cy,2))>d
    then
    begin
      d:=sqrt(Power(bx-cx,2)+Power(by-cy,2));
      i:=2;
    end;
    if sqrt(Power(cx-ax,2)+Power(cy-ay,2))>d
    then i:=3;//d:=sqrt(Power(cx-ax,2)+Power(cy-ay,2));
    if (ax=bx) and (ax=cx)
    then a:=true
    else
      if ax=bx
      then a:=false
      else
      begin
        m:=(by-ay)/(bx-ax);
        n:=ay-m*ax;
        if abs(cy-m*cx-n)<1E-9 then a:=true else a:=false;
      end;
    if a then result:=i else result:=-1;
  end;
begin
  Button5Click(Sender);//Canvas.FillRect(Rect(0,0,PaintBox2.Width,PaintBox2.Height));
  FExist:=true;
  Ext:=UpperCase(ExtractFileExt(Label49.Caption));
  if Ext <> '.STP' then
  begin
    Button23Click(Sender);
    Ext:=UpperCase(ExtractFileExt(Label49.Caption));
  end;
  if not(FExist) then exit;
  F:=TFileStream.Create(Label49.Caption,fmOpenRead);
  if Ext = '.STP' then
  begin
    F.ReadBuffer(WsxmComment,Sizeof(WsxmComment));
    for i:=0 to 5000 do
      if (WsxmComment[i]='n') and (WsxmComment[i+1]='d') and (WsxmComment[i+2]=']')
      then SizeHead:=i+5;
    F.Seek(0,soFromBeginning) ;
    WsxmComment:='';
    F.ReadBuffer(WsxmComment,SizeHead);

    RichEdit1.Text:='';
    Form2.RichEdit1.Text:='';
    for l:=0 to SizeHead-1 do
    begin
      RichEdit1.Text:=RichEdit1.Text+WsxmComment[l];
      Form2.RichEdit1.Text:=RichEdit1.Text+WsxmComment[l];
    end;
    PosFin:=ChangePosFin('n','s',':',4,WsxmComment);

    // Number of points
    Label17.Caption:='';
    for i:=0 to 2 do
    begin
      if WsxmComment[PosFin+i]='-' then Label17.Caption:=''; // borra todo antes del -
      Label17.Caption:=Label17.Caption+WsxmComment[PosFin+i];
    end;

    h.yn:=StrtoInt(Label17.Caption);
    PosFin:=ChangePosFin('X',' ','s',18,WsxmComment);

    Label42.Caption:='';
    for i:=1 to 5  do
    begin
      if WsxmComment[PosFin+i]='-' then Label42.Caption:='';
      Label42.Caption:=Label42.Caption+WsxmComment[PosFin+i];
    end;
    h.xstart:=StrtoInt(Label42.Caption)*1e-10;
    PosFin:=ChangePosFin('Y',' ','s',18,WsxmComment);

    Label43.Caption:='';
    for i:=1 to 5 do
    begin
      if WsxmComment[PosFin+i]='-' then Label43.Caption:='';
      Label43.Caption:=Label43.Caption+WsxmComment[PosFin+i];
    end;
    h.ystart:=StrtoInt(Label43.Caption)*1e-10;

    PosFin:=ChangePosFin('X',' ','A',12,WsxmComment);
    Label44.Caption:='';
    for i:=1 to 4 do
    begin
      if WsxmComment[PosFin+i]='-' then Label44.Caption:='';
      Label44.Caption:=Label44.Caption+WsxmComment[PosFin+i];
    end;
    h.xend:=StrtoInt(Label44.Caption)*1e-10+h.xstart;

    PosFin:=ChangePosFin('Y',' ','A',12,WsxmComment);
    Label45.Caption:='';
    for i:=1 to 4 do
    begin
      if WsxmComment[PosFin+i]='-' then Label45.Caption:='';
      Label45.Caption:=Label45.Caption+WsxmComment[PosFin+i];
    end;
    h.yend:=StrtoInt(Label45.Caption)*1e-10+h.ystart;

    SizeofImgNumber:=h.yn;
  end;

  for l:=0 to h.yn-1 do
  begin
    for k:=0 to h.yn-1 do F.Read(DataWsxmtoPlotinFile[k,l],2);
  end;
  PosFin:=ChangePosFin('d','e',':',3,WsxmComment);
  encuentra:=True;
  PosFinFin:=PosFin;
  for i:=PosFin to SizeHead-1 do
  begin
    if ((WsxmComment[i]='Å') or (WsxmComment[i]='P')) and encuentra
    then
    begin
      PosFinFin:=i;
      encuentra:=False;
    end;
  end;

  for i:=0 to 10 do AmpZ[i]:=' ';
  for i:=0 to (PosFinFin-PosFin-1) do AmpZ[i]:=WsxmComment[PosFin+i];

  AmplZ:=StrtoFloat(AmpZ)*1e-10;

  for l:=0 to h.yn-1 do
  begin
    for k:=0 to h.yn-1 do
      DatatoPlotinFile[k,l]:=DataWsxmtoPlotinFile[k,l]*AmplZ/32767;
  end;

  F.Destroy;
  s:=ChangeFileExt(Label49.Caption,'.txt');

  sl := TStringList.Create;
  ch := #9; //TAB
  lines:=0;
  try
    sl.LoadFromFile(s) ;
    ok:=(sl.count > 4);
    if ok then begin   // Test Dateiformat
      ok:=(trim(sl[0]) = 'WSxM file copyright Nanotec Electronica');
      if not ok then messagedlg('Wrong file format',mterror,[mbok],0); end;
    if ok then begin
      for i:=0 to 3 do sl[i]:='';
      i:=0; while i < sl.count do begin   // überflüssige Zeilen löschen
        sl[i]:=trim(sl[i]);
        if (sl[i] = '') or (copy(sl[i],1,1) = ';') then sl.Delete(i) else inc(i); end;
      ok:=(sl.count > 1);
      if ok then ok:=(frac(sqrt(sl.count)) = 0);  // Test Quadratzahl
      if not ok then messagedlg('Wrong line count',mterror,[mbok],0); end;
    if ok then begin
      k:=round(sqrt(sl.count)); setlength(m1,k,k); lines:=k; setlength(m11,k,k);
      ex:=0; ey:=0; ez:=0; n:=0;
      for i:=0 to k-1 do begin
        for j:=0 to k-1 do begin
          ok:=lese_zeile(sl[n],ex,ey,ez);

          if ok then begin m1[k-j-1,i]:=ez/1E10; inc(n); end
                else break;

          end;
        if not ok then break; end;
      if not ok
        then messagedlg('Format error in line '+inttostr(n+4),mterror,[mbok],0);
      end;
  finally
    sl.Free;
  end;

  if not ok then exit;

//  SetLength(m1,lines);
  Bitmap:=TBitmap.Create;
  l:=0;
  amp := round(PaintBox2.Height/64);
  try
    o:=TrackBar3.Position;
    for i:=0 to lines-1 do
      for j:=0 to lines-1 do
      begin
        m11[i,j]:=0;
        if m1[i,j]<o/10 then
        begin
          inc(l);
          m11[i,j]:=1;
        end;
      end;

    SetLength(m2,l);
    k:=0;
    for i:=0 to lines-1 do
      for j:=0 to lines-1 do
        if m1[i,j]<o/10 then
        begin
          with m2[k] do
          begin
            x:=i;
            y:=j;
            k:=k+1;
          end;
        end;
    SetLength(m3, length(m2));
    i:=sw_suche(m2, m3, TrackBar4.Position);
    m3:=copy(m3,0,i);
    SetLength(m2,length(m3));
    m2:=m3;
    SetLength(m_con,l*l);
    p:=length(m2);
    l:=p div 3;
    k:=l;
    if p mod 3 > 0 then
    begin
      inc(l);
      if p mod 3 = 1 then dec(k);
    end;
    SetLength(m_cola,l);
    o:=0;
    for i:=0 to k-1 do
    begin
      SetLength(m_cola[i].num,3);
      for j:=0 to 2 do
        m_cola[i].num[j]:=m2[o+j];
      inc(o,3);
    end;
    if k<>-1
    then
      for i:=k to l-1 do
      begin
        SetLength(m_cola[i].num,2);
        for j:=0 to 1 do
          m_cola[i].num[j]:=m2[o+j];
        inc(o,2);
      end
    else
    begin
      SetLength(m_cola[i].num,1);
      m_cola[i].num[0]:=m2[o];
      inc(o,1);
    end;
// m2 sortiert nach erster und dann nach zweiter Koordinate

//Seperations in parts:
// Setting connections inside the parts:
    k:=0; // counts the numbers of connections
    for i:=0 to l-1 do
    begin
      for j:=0 to length(m_cola[i].num)-1 do
        if length(m_cola[i].num)=3 then // part with 3 parts
        begin
          m_con[k].P1:=m_cola[i].num[j]; // start point
          case j of                      // end points
           0: m_con[k].P2:=m_cola[i].num[1];
           1: m_con[k].P2:=m_cola[i].num[2];
           2: m_con[k].P2:=m_cola[i].num[0];
          end;
          k:=k+1;                        // 1 connection more
        end
        else   // part with 2 points
          if j=0 then  // 2points, but only one new connection
          begin
            m_con[k].P1:=m_cola[i].num[0];
            m_con[k].P2:=m_cola[i].num[1];
            k:=k+1;                       // 1 connection more
          end;
      if length(m_cola[i].num)=3 then
      begin
        n:=Cut3Points(m_cola[i].num[0].x,m_cola[i].num[0].y,
                      m_cola[i].num[1].x,m_cola[i].num[1].y,
                      m_cola[i].num[2].x,m_cola[i].num[2].y);
        case n of
          1 : begin
                dec(k);
                m_con[k-2]:=m_con[k-1];
                m_con[k-1]:=m_con[k];
                m_con[k].P1.x:=0;
                m_con[k].P1.y:=0;
                m_con[k].P2.x:=0;
                m_con[k].P2.y:=0;
              end;
          2 : begin
                dec(k);
                m_con[k-1]:=m_con[k];
                m_con[k].P1.x:=0;
                m_con[k].P1.y:=0;
                m_con[k].P2.x:=0;
                m_con[k].P2.y:=0;
              end;
          3 : begin
                dec(k);
                m_con[k].P1.x:=0;
                m_con[k].P1.y:=0;
                m_con[k].P2.x:=0;
                m_con[k].P2.y:=0;
              end;
         end;
      end;
      end;

//Triangulation:
    if k>0 then Triangulation(l,k, m_cola, m_con);
    i:=0;
    for j:=0 to length(m_cola)-1 do i:=i+length(m_cola[j].num);
    SetLength(m_point, i);
    SetLength(m_neighbor, i);
    i:=0;
    for j:=0 to length(m_cola)-1 do
      for n:=0 to length(m_cola[j].num)-1 do
      begin
        m_point[i]:=m_cola[j].num[n];
        i:=i+1;
      end;
    for j:=0 to length(m_point)-1 do
    begin
      m_neighbor[j].P1.x:=m_point[j].x;
      m_neighbor[j].P1.y:=m_point[j].y;
      p:=0;
      o:=0;
      for n:=0 to length(m_con)-1 do
      begin
        if ((m_con[n].P1.x=m_point[j].x) and (m_con[n].P1.y=m_point[j].y)) or
           ((m_con[n].P2.x=m_point[j].x) and (m_con[n].P2.y=m_point[j].y))
        then o:=o+1;
        SetLength(m_neighbor[j].num, o);
        if ((m_con[n].P1.x=m_point[j].x) and (m_con[n].P1.y=m_point[j].y))
        then
        begin
          m_neighbor[j].num[p].x:=m_con[n].P2.x;
          m_neighbor[j].num[p].y:=m_con[n].P2.y;
          p:=p+1;
        end
        else
          if ((m_con[n].P2.x=m_point[j].x) and (m_con[n].P2.y=m_point[j].y))
          then
          begin
            m_neighbor[j].num[p].x:=m_con[n].P1.x;
            m_neighbor[j].num[p].y:=m_con[n].P1.y;
            p:=p+1;
          end
      end;
      m_neighbor[j].a:=p;
    end;
    for i:=length(m_con)-1 downto 0 do
      if (m_con[i].P1.x<>0.0) or (m_con[i].P1.y<>0.0) or
         (m_con[i].P2.x<>0.0) or (m_con[i].P2.y<>0.0)
      then
        break;
    for j:=0 to i do
    begin
      PaintBox2.Canvas.MoveTo(m_con[j].P1.x*amp,m_con[j].P1.y*amp);
      PaintBox2.Canvas.LineTo(m_con[j].P2.x*amp,m_con[j].P2.y*amp);
    end;
    q:=i;
    n:=7;
    p:=4;
    for i:=0 to length(m_point)-1 do
    begin
      o:=0;
      for j:=0 to q do
        if ((m_con[j].P1.x=m_Point[i].x) and (m_con[j].P1.y=m_point[i].y)) or
           ((m_con[j].P2.x=m_Point[i].x) and (m_con[j].P2.y=m_point[i].y))
        then inc(o);
      PaintBox2.Canvas.Ellipse(m_point[i].x*amp-n,m_point[i].y*amp-n,m_point[i].x*amp+n,m_point[i].y*amp+n);
      PaintBox2.Canvas.TextOut(m_point[i].x*amp-p,m_point[i].y*amp-p,IntToStr(o));
    end;
    s:=ExtractFileName(Label49.Caption);
    if ExtractFileExt(Label49.Caption)<>''
    then s:=copy(ExtractFileName(Label49.Caption),0,length(ExtractFileName(Label49.Caption))-4);
    s:=appl_exepath+s+'.dat';
    AssignFile(g,s);
    rewrite(g);
    closefile(g);
    if text_openfile(s,g,2)
    then
    begin
      text_writeln(g, 'x'#9'y'#9'numero de los vecinos'#9'vecinos');
      for i:=0 to length(m_point)-1 do
      begin
        o:=0;
        for j:=0 to length(m_con)-1 do
          if ((m_con[j].P1.x=m_Point[i].x) and (m_con[j].P1.y=m_point[i].y)) or
             ((m_con[j].P2.x=m_Point[i].x) and (m_con[j].P2.y=m_point[i].y))
          then inc(o);
        s:=IntToStr(m_point[i].x);
        s1:=IntToStr(m_point[i].y);
        s2:=IntToStr(o);
        text_write(g, s+#9+s1+#9+s2+#9);
        for j:=0 to length(m_con)-1 do
          if ((m_con[j].P1.x=m_Point[i].x) and (m_con[j].P1.y=m_point[i].y))
          then text_write(g, '('+IntToStr(m_con[j].P2.x)+','+IntToStr(m_con[j].P2.y)+')')
          else
            if ((m_con[j].P2.x=m_Point[i].x) and (m_con[j].P2.y=m_point[i].y))
            then text_write(g, '('+IntToStr(m_con[j].P1.x)+','+IntToStr(m_con[j].P1.y)+')');
        text_writeln(g,'');
      end;
      text_closefile(g);
    end;

  finally
    Bitmap.Free;
    SetLength(m_cola,0);
    SetLength(m_con,0);
  end;
end;

initialization
  Decimalseparator:='.';
finalization

end.
