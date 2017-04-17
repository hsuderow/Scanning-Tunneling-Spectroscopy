unit MiLee_old;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  var_gbl, StdCtrls, ExtCtrls, xyyGraph, blqLoader,blqDataSet, Info, Spin,
  ComCtrls, Tabnotbk ;


type
  TValProm = class(TForm)
    Button1: TButton;
    OpenFichero: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button3: TButton;
    TabbedNotebook1: TTabbedNotebook;
    xyyGraph1: TxyyGraph;
    xyyGraph2: TxyyGraph;
    xyyGraphCorner: TxyyGraph;
    DiffAjust: TxyyGraph;
    xyyGraph4: TxyyGraph;
    DelGrpah: TButton;
    PlotXYZ0: TCheckBox;
    PlotXYZCorner: TCheckBox;
    PlotDifference: TCheckBox;
    Plottout: TCheckBox;
    Button2: TButton;
    ColorDialog1: TColorDialog;
    ReadAsciiSaveImg: TButton;
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
    Label1: TLabel;
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
    procedure Button1Click(Sender: TObject);
    procedure DelGrpahClick(Sender: TObject);
    procedure DerivaRectas (vin:vcurva; var vout:vcurva);
    procedure ReadAsciiSaveImgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure xyyGraph4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ValProm: TValProm;
   b : TblqLoader ;
   DS : TblqDataSet ;


implementation

uses Graphiccs;

     {$R *.DFM}

var
  MiFichero: FILE;
  //Data: Array[1..4028] of Integer;
  MiCabecera: TBLK_cab;
  MisDatos: Array [0..2048] of single;
  MisDatosX: Array [0..2048] of single;
  MiX: Array[1..128,1..128] of single;
  MiY: Array[1..128,1..128] of single;
  MiZ0: Array[1..300,1..300] of single;
  MiZCorner: Array[1..128,1..128] of single;
  MiZDiff: Array[1..128,1..128] of single;
  MiXp: Array[1..128,1..128] of single;
  MiYp: Array[1..128,1..128] of single;
  MiZ0p: Array[1..128,1..128] of single;
  MiZCornerp: Array[1..128,1..128] of single;
  MiZDiffp: Array[1..128,1..128] of single;
  MyGraphNr: Integer;
  MiPosXY: Array[0..128,0..128] of string;


procedure TValProm.Button1Click(Sender: TObject);
var
  b_xx: Array[0..10000] of Extended;
  b_yy: Array[0..10000] of Extended;
  CurvaADerivar: vcurva;
  CurvaDerivada: vcurva;
   NumRead,i: Integer;
   Buf : Double;
   j,k,kk,ll,l,m,MiPos,cont,conta2,MiLinesNr,MiDataNr: Integer;
   Ff: TextFile;
   F: TFileStream;
   Ext,MiFile : string;
   w : smallint ;
   Prom: Double;
   h: TIMGheader;
   //h: TIMG_Cab;
   ValorCortadeb,ValorCortaenc,ValorAjusta: Double;
   Skipfirstblqs: Integer;

  blqname : string ;
  b_offset: Integer;
  N_puntos,ii: Integer;
  b_z0: Array[0..256,0..256] of Single;
  b_zcorner: Array[0..256,0..256] of Single;
  b_difference: Array[0..256,0..256] of Single;
  ww: Single;
  begin

if OpenFichero.Execute then
begin
//j:=1;

  // ABRIR FICHERO
  F:=TFileStream.Create(Openfichero.Filename,fmOpenRead) ;
  Ext:=UpperCase(ExtractFileExt(Openfichero.Filename)) ;
  F.Seek(0,soFromBeginning) ;
  Label2.Caption:=ExtractFileName(Openfichero.Filename);
Button1.Caption:='Working';

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
    k:=0;

   PointNr.Caption:=InttoStr(b.Count-Skipfirstblqs);
   end
  else  PointNr.Caption:=InttoStr(b.Count);



  N_puntos:=Round(sqrt(StrtoInt(PointNr.Caption)/4));


  Label6.Caption:=InttoStr(N_puntos);


  for k:=0 to N_puntos-1 do
     begin
     NroLinea.Caption:=InttoStr(k);
     Application.ProcessMessages;
// IDA Y VUELTA DE TODA UNA LINEA EN X
     for l:=0 to 2*N_puntos-1 do
        begin
         NroDato.Caption:=InttoStr(l);
         Application.ProcessMessages;
         /// Lee pares si toca
         if ((Tomacurvas.Itemindex=0) or (Tomacurvas.Itemindex=2)) then
          begin
           b_offset:=b.GetEntryOffset(k*2*2*N_Puntos+2*l) ;
           LoadDataSetFromBlock(blqname,b_offset,DS) ;
           Points.Caption:=InttoStr(DS.nrows);
           MiPosXY[k,l]:=Ds.Comment;
           ii:=0;
            for i:=0 to DS.nrows do
              begin
               b_yy[i]:=DS[1].Value[i];
               b_xx[i]:=DS[0].Value[i];
              end;
          end;
         // lee tambien impares
         if (Tomacurvas.Itemindex=1) then
           begin
            b_offset:=b.GetEntryOffset(k*2*2*N_Puntos+(2*l+1)) ;
            LoadDataSetFromBlock(blqname,b_offset,DS) ;
            Points.Caption:=InttoStr(DS.nrows);
            MiPosXY[k,l]:=Ds.Comment;

               for i:=0 to DS.nrows-1 do
                begin
                 b_yy[i]:=DS[1].Value[i];  // menos porque ida y vuelta
                 b_xx[i]:=DS[0].Value[i];  // menos porque ida y vuelta
                end;
         // Lee pares y promedia si hay que hacerlo
            if (Tomacurvas.Itemindex=2) then
              begin
               b_offset:=b.GetEntryOffset(2*2*k*N_Puntos+2*l) ;
               LoadDataSetFromBlock(blqname,b_offset,DS) ;
               Points.Caption:=InttoStr(DS.nrows);

               for i:=0 to DS.nrows-1 do
                begin
                 b_yy[i]:=(DS[1].Value[i]-b_yy[i])/2;  // menos porque ida y vuelta
                 b_xx[i]:=(DS[0].Value[i]-b_xx[i])/2;  // menos porque ida y vuelta
                end;
              end;
           end;
           for i:=0 to DS.nrows-1 do
            begin
             b_yy[i]:=1e9*b_yy[i];  // nA
             b_xx[i]:=1e3*b_xx[i];  // mV
            end;


         // terminado de leer la curva
         // Corrige Offset
         if (CorrigeOffset.Checked) then
           begin
           for i:=0 to DS.nrows-1 do
            begin
              b_xx[i]:=b_xx[i]-StrtoFloat(Offset.Text);
            end;
           end;
        // YA TIENE LOS DATOS DE UN PUNTO EN b
        //  AHORA A DERIVAR !
        if (Deriva.checked) then
         begin
          CurvaADerivar.n:=DS.Nrows;
          for i:=1 to DS.nrows do
                begin
                CurvaADerivar.x[i]:=b_xx[i-1];
                CurvaADerivar.y[i]:=b_yy[i-1];
                end;
          DerivaRectas(CurvaAderivar,CurvaDerivada);
          for i:=1 to DS.nrows do
                begin
                Application.ProcessMessages;
                b_xx[i]:=CurvaDerivada.x[i];
                b_yy[i]:=CurvaDerivada.y[i];
                end;
         end;
         // YA tengo la derivada
         // Pinto las treinta primeras
         if ((l<40) and (k<1)) then
           begin
             xyyGraph1[l].Color:=clBlack+30000*l;
             for i:=1 to DS.nrows do
              begin
               xyyGraph1[l].Addpoint(b_xx[i],b_yy[i]);
              end;
           end;
         // CALCULO PROMEDIO ALREDEDOR DE CERO
        prom:=0;
        cont:=0;
         for j:=1 to DS.nrows do
          begin
         if (Abs(b_xx[j])<StrtoFloat(PromAround0.Text))  then
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
         for j:=1 to DS.nrows do
            begin
             if (Abs(b_xx[j])>StrtoFloat(PromBegin.Text))
                and (Abs(b_xx[j])<StrtoFloat(PromEnd.Text)) then
                begin
                Prom:=Prom+b_yy[j];
                cont:=cont+1;
                end;
            end;  // for j
          if (cont<=0) then cont:=1;
          b_zcorner[k,l]:=Prom/cont;

         // DIFERENCIA
          b_difference[k,l]:=(b_zcorner[k,l]-b_z0[k,l])/b_zcorner[k,l];

     end; // for de l
    end;  // for de k

     if(PlotXYZ0.checked) then
       for k:=0 to N_Puntos-1 do
       begin
         begin
          for l:=0 to 2*N_puntos-1 do
          xyyGraph2[MyGraphNr].Addpoint(l+k*2*N_Puntos,b_zcorner[k,l]);
         end;
       end;
     if(PlotXYZCorner.checked) then
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
  if (ValorCortadeb<-100) or (ValorCortadeb>100) then ValorCortadeb:=-2;
  ValorCortaenc:=StrtoFloat(CortaEncimade.Text);
  if (ValorCortaenc<-100) or (ValorCortaenc>100) then ValorCortaenc:=2;
  ValorAjusta:=StrtoFloat(AjustaA.Text);
  if (ValorAjusta<-10) or (ValorAjusta>10) then ValorAjusta:=0;

       for k:=0 to N_Puntos-1 do
         begin
          for l:=0 to 2*N_puntos-1 do
            begin
            if (b_difference[k,l]<ValorCortadeb) or (b_difference[k,l]>ValorCortaenc) then
                begin
                 if (l=0)
                        then
                          begin
                          if ((b_difference[k,l+1]>ValorCortadeb) and
                                (b_difference[k,l+1]<ValorCortaenc)) then
                                 b_difference[k,l]:=b_difference[k,l+1]
                                else b_difference[k,l+1]:=ValorAjusta;
                          end
                 else b_difference[k,l]:=b_difference[k,l-1];
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
        h.moment:=1;
        h.time:=1;
        h.xstart:=0;
        h.xend:=1;
        h.ystart:=0;
        h.yend:=1;
        h.xn:=N_Puntos;
        h.yn:=N_Puntos;

        F.WriteBuffer(h,Sizeof(h));

        for k:=0 to N_Puntos-1 do
         begin
         for l:=0 to N_Puntos-1 do F.Write(b_difference[k,l],4);
         end;
        F.Destroy;

        MiFile:=SaveDialog1.Filename + 'i'+'.txt';
        AssignFile(Ff,MiFile);
        Rewrite(Ff);
        for k:=0 to N_Puntos-1 do
         begin
         for l:=0 to N_Puntos-1 do
          Writeln(Ff,'Comment ',MiPosXY[k,l],'line ',k,' pt ',l,' res ',b_difference[k,l]);
         end;
        CloseFile(Ff);


        MiFile:=SaveDialog1.Filename+ 'v' + '.img';
        F:=TFileStream.Create(MiFile,fmCreate) ;
        F.WriteBuffer(h,Sizeof(h));

        for k:=0 to N_Puntos-1 do
         begin
         for l:=2*N_Puntos-1 downto N_Puntos do F.Write(b_difference[k,l],4);
         end;
        F.Destroy;

        MiFile:=SaveDialog1.Filename + 'v'+'.txt';
        AssignFile(Ff,MiFile);
        Rewrite(Ff);
        for k:=0 to N_Puntos-1 do
         begin
         for l:=2*N_Puntos-1 downto N_Puntos do
          Writeln(Ff,'Comment ',MiPosXY[k,l],'line ',k,' pt ',l,' res ',b_difference[k,l+N_Puntos]);
         end;
        CloseFile(Ff);

        end;  // savedialog1 execute
        end; // Save IMG File



Button1.Caption:='GO';


{
// BEGIN EXT = BLK
if Ext = '.BLK' then
begin   // 1
  for k:=1 to MaxImgDatos do
      begin  // 2
      for l:=1 to MaxImgDatos do  MiZDiffp[l,k]:=0;
      end;   // 1
  k:=0;
  l:=1;
  mipos:=0;      // leo donde no debo !!! creo que hay que bajar la pos
  while (F.Position<F.Size) do // inicio bucla con k y l
  begin      //2
  k:=k+1; // nro de dato !
  NroDato.Caption:=InttoStr(k);
  Application.ProcessMessages;
  F.Read(MiCabecera,SizeOf(TBlK_cab)) ;
  if ((MiCabecera.samp>0) and (MiCabecera.samp<2050)) then
  begin     //3
  if(k=1) then PointNr.Caption:=InttoStr(MiCabecera.samp);

  MiX[l,k]:=MiCabecera.Rx;

  MiY[l,k]:=MiCabecera.Ry;///13/StrtoFloat(CalXY.Text);
  if(k>3) then begin
  if (MiY[l,k]<>MiY[l,k-1]) then
     begin    //4
     l:=l+1; // ha terminado una linea
     NroLinea.Caption:=InttoStr(l);
     Datanr.Caption:=InttoStr(k-1);
     Application.ProcessMessages;
     k:=1;   // pongo dato a UNO !
     // Hay que volver a tomarlo !!
     MiX[l,k]:=MiCabecera.Rx;

     MiY[l,k]:=MiCabecera.Ry;///13/StrtoFloat(CalXY.Text);
     end;      //3
   end;       //2
            for i:=1 to MiCabecera.samp do begin  // 3
                 F.Read(w,2);
                 MisDatos[i]:=w;
                 MisDatosX[i]:=(MiCabecera.vini+(MiCabecera.vppr/MiCabecera.samp)*i);
            // Corrige Offset
                 if (CorrigeOffset.Checked) then
                        MisDatosX[i]:=MisDatosX[i]-StrtoFloat(Offset.Text);
                 end;     //2
  Prom:=0;
  cont:=0;
  // Derivamos
  if (Deriva.checked) then
        begin   //3
        CurvaADerivar.n:=MiCabecera.samp;
        for i:=1 to MiCabecera.samp do
                begin   //4
         CurvaADerivar.x[i]:=MisDatosX[i];
         CurvaADerivar.y[i]:=MisDatos[i];
                end;    //3
        DerivaRectas(CurvaAderivar,CurvaDerivada);
        for i:=1 to MiCabecera.samp do
                begin   //4
         Application.ProcessMessages;
         MisDatosX[i]:=CurvaDerivada.x[i];
         //MisDatos[i]:=-Round(CurvaDerivada.y[i]);
         MisDatos[i]:=-CurvaDerivada.y[i];
         MiCabecera.samp:=CurvaDerivada.n;
                end;    //3
        end;       //2
  for j:=1 to MiCabecera.samp do
  begin        //3
  if (Abs(MisDatosX[j])<StrtoFloat(PromAround0.Text))  then
     begin     //4
      Prom:=Prom+MisDatos[j];
     cont:=cont+1;
     end;      //3
  end;// Prom a cero //2
  if (cont<=0) then cont:=1;
  MiZ0[l,k]:=Prom/cont;

  if (PlotXYZCorner.checked) then
  begin     //3
  cont:=0;    // contador de promedios
  Prom:=0;
  for m:=1 to MiCabecera.samp do
  begin     //4
  if ((Abs(MisDatosX[m])>StrtoFloat(PromBegin.Text))
                and (Abs(MisDatosX[m])<StrtoFloat(PromEnd.Text))) then
                begin  //5
                Prom:=Prom+MisDatos[m];
                cont:=cont+1;
                end   //4
  //else cont:=1;
  end;  // PromZCorner   //3
  if (cont<=0) then cont:=1;
  MiZCorner[l,k]:=Prom/cont;
  end; //PlotZ Corner checked  //2

  if (PlotDifference.checked) then
  begin    //3
   if(MiZCorner[l,k]<>0) then MiZDiff[l,k]:=(MiZCorner[l,k]-MiZ0[l,k])/MiZCorner[l,k]  // lo pongo en
   //dato, linea: x,y

   else MiZDiff[l,k]:=0;
   //if (MiZDiff[l,k]>5) then MiZDiff[l,k]:=0;      luego extrapolo para corregir errores
  end; // Plotdiff checked  //2



  if ((Plottout.checked) and (k<15) and (l<2)) then
        // solo trazamos las cuatro primeras curvas de la primera linea
  begin        //3
    //xxyGraph1[k].HoldUpdates:=True;
    for j:=1 to MiCabecera.samp do xyyGraph1[k].AddPoint(MisDatosX[j],MisDatos[j]);
    //xyGraph1[k].HoldUpdates:=False;
  end;  // Plottout checked    //2

  end; // end if mi cabecera.samp >2000 or <0    //1
  end;     // while     //1

  // IF EXT =BLK !!!!!!!!!!!!!!

  F.Destroy ;
  LinesNr.Caption:=InttoStr(l);
  MiLinesNr:=0;
  if (l>0) and (l<1000) then MiLinesNr:=l;
    // miro cuantos puntos por linea y promedio sobre MIZ0, MiZDiff y MiZCorner


  //conta2:=0;
  for ll:=1 to (l) do
  begin
       for kk:=2 to k do
       begin
       if ((MiX[ll,kk]=MiX[ll,kk-1]) and (MiX[ll,kk]<>0) and (MiX[ll,kk-1]<>0)) then
          begin
          //Application.ProcessMessages;
            MiXp[ll,Round(kk/2)]:=MiX[ll,kk];         // promedios
              MiYp[ll,Round(kk/2)]:=MiY[ll,kk];
               MiZ0p[ll,Round(kk/2)]:=(MiZ0[ll,kk]+MiZ0[ll,kk-1])/2;
                MiZDiffp[ll,Round(kk/2)]:=(MiZDiff[ll,kk]+MiZDiff[ll,kk-1])/2;
                 //MiZDiffp[l,Round(k/2)]:=Round(k/2);
                 // El primer punto es el mas oscurom y luego empieza
                 // mas brillante
                  MiZCornerp[ll,Round(kk/2)]:=(MiZCorner[ll,kk]+MiZCorner[ll,kk-1])/2;
          end;   // if equal x
       end;    // count kk
  end;  // count ll
  DataNr.Caption:=InttoStr(Round(k/2));
  MiDataNr:=0;
  if(Round(k/2)>0) and (Round(k/2)<1000) then MiDataNr:=Round(k/2);
  //end;
  //l:=0;
  //k:=0;

  if(PlotXYZ0.checked) then
  begin
  //xyGraph2[1].HoldUpdates:=True;
  for l:=1 to MiLinesNr do
        begin
        for k:=1 to MiDataNr do
        xyyGraph2[1].Addpoint(l*MiLinesNr+k,MiZ0p[l,k]);
        end;

  //xyGraph2[1].HoldUpdates:=False;
  end; //PlotXYZ0.checked

  if(PlotXYZCorner.checked) then
  begin
  //xyGraphCorner[1].HoldUpdates:=True;
  //ll:=1;
  for ll:=1 to MiLinesNr do
        begin
        for kk:=1 to MiDataNr do
        xyyGraphCorner[k].Addpoint(ll*MiLinesNr+kk,MiZCornerp[ll,kk]);
        end;

  //xyGraphCorner[1].HoldUpdates:=False;
  end;   //PlotXYZCorner.checked

  if(PlotDifference.checked) then
  begin
  //xyGraph4[1].HoldUpdates:=True;
  for l:=1 to MiLinesNr do
        begin
        for k:=1 to MiDataNr do
        xyyGraph4[1].Addpoint(l*MiLinesNr+k,MiZDiffp[l,k]);
        end;

    //xyGraph4[1].HoldUpdates:=False;
  end;   // PlotDifference.checked

  ValorCortadeb:=StrtoFloat(CortaDebajode.Text);
  if (ValorCortadeb<-100) or (ValorCortadeb>100) then ValorCortadeb:=-2;
  ValorCortaenc:=StrtoFloat(CortaEncimade.Text);
  if (ValorCortaenc<-100) or (ValorCortaenc>100) then ValorCortaenc:=2;

for l:=1 to MiLinesNr do
        begin
        kk:=1;
        while (kk<=MiDataNr) do
        //for kk:=1 to MiDataNr do
         begin
         //Application.ProcessMessages;
         if (MiZDiffp[l,kk]<ValorCortadeb) or (MiZDiffp[l,kk]>ValorCortaenc) then
                begin
                 if (kk=1) //and (MiZDiffp[l,kk+1]>=ValorCortadeb)
                        then
                          begin
                          if ((MiZDiffp[l,kk+1]>ValorCortadeb) and
                                (MiZDiffp[l,kk+1]<ValorCortaenc)) then
                                 MiZDiffp[l,kk]:=MiZDiffp[l,kk+1]
                                else MiZDiffp[l,kk]:=0;
                          end
                 else if (kk=MiDataNr) //and (MiZDiffp[l,kk-1]>=ValorCortadeb)
                        then
                        begin
                        if ((MiZDiffp[l,kk-1]>ValorCortadeb) and
                             (MiZDiffp[l,kk-1]<ValorCortaenc))
                              then
                                MiZDiffp[l,kk]:=MiZDiffp[l,kk-1]
                                else MiZDiffp[l,kk]:=0;
                        end
                 else if ((MiZDiffp[l,kk+1]>ValorCortadeb)
                                and
                                (MiZDiffp[l,kk+1]<ValorCortaenc)) // porque el otro siempre esta bien
                        then
                        MiZDiffp[l,kk]:=(MiZDiffp[l,kk-1]+MiZDiffp[l,kk+1])/2
                 else  MiZDiffp[l,kk]:=0
                end; // Si esta fuera de rango
          kk:=kk+1;
          end;
        end;

 if(PlotDifference.checked) then
  begin
  //xyGraph5[1].HoldUpdates:=True;
  for l:=1 to MiLinesNr do
        begin
        for k:=1 to MiDataNr do
        xyyGraph5[1].Addpoint(l*MiLinesNr+k,MiZDiffp[l,k]);
        end;

    //xyGraph5[1].HoldUpdates:=False;
  end;   // PlotDifference.checked


 SaveDialog1.FilterIndex:=1;
if SaveDialog1.Execute then
    begin
    MiFile:=SaveDialog1.Filename + '.txt';
    AssignFile(Ff,MiFile);
    Rewrite(Ff);
  for l:=1 to (StrtoInt(LinesNr.Caption)) do
        begin
        for k:=1 to (StrtoInt(DataNr.Caption)) do
         Writeln(Ff,MiXp[l,k],' ',MiYp[l,k],' ',MiZ0p[l,k],' ',MiZCornerp[l,k],' ',MiZDiffp[l,k]);
        end;


    CloseFile(Ff);
    end;  //SaveDialog1.Execute

 if(SaveIMGFile.checked) then
        begin
        SaveDialog1.FilterIndex:=2;
        if SaveDialog1.Execute then
        begin
        MiFile:=SaveDialog1.Filename+ '.img';
        F:=TFileStream.Create(MiFile,fmCreate) ;
        h.identif:=$00333333;
        h.version:=$00010000;
        h.day:=1;
        h.month:=1;
        h.year:=1999;
        h.moment:=1;
        h.time:=1;
        h.xstart:=0;
        h.xend:=1;
        h.ystart:=0;
        h.yend:=1;
        h.xn:=64;
        h.yn:=64;

        F.WriteBuffer(h,Sizeof(h));
        for l:=1 to 64 do
         begin
         for k:=1 to 64 do F.Write(MiZDiffp[l,k],4);
         end;
        F.Destroy;
        end;  // savedialog1 execute
        end; // Save IMG File
end;     // if ext blk
}end;


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
          RRS: single;

begin
pderi:=StrtoInt(PDeriva.Text);
RRS:=0;
m:=vin.n;
//tot0:=vout.n;
if pderi=0 then begin
     FOR I:=1 TO M-1 do begin
        vout.x[i]:=0.5*(vin.x[i]+vin.x[i+1]);
        if (vin.x[i]-vin.x[i+1])<>0 then vout.y[i]:=(vin.y[i]-vin.y[i+1])/(vin.x[i]-vin.x[i+1]);
        end;
        vout.x[M]:=vout.x[m-1];vout.y[m]:=vout.y[m-1];
        tot0:=m;
end else begin
     FOR I:=1 TO M do begin
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
   F: TFileStream;
   Ext,MiFile : string;
   k,l,MiLinesNr,MiDataNr: Integer;

begin
if ((StrtoInt(LinesNr.Caption)>0) and (StrtoInt(DataNr.Caption)>0)) then
begin
MiLinesNr:= StrtoInt(LinesNr.Caption);
MiDataNr:=StrtoInt(DataNr.Caption);
if OpenFichero.Execute then
    begin
    MiFile:=OpenFichero.Filename;
    AssignFile(Ff,MiFile);
    Reset(Ff);
  for l:=1 to (MiLinesNr) do
        begin
        for k:=1 to (MiDataNr) do
         Readln(Ff,MiXp[l,k],MiYp[l,k],MiZ0p[l,k],MiZCornerp[l,k],MiZDiffp[l,k]);
        end;


    CloseFile(Ff);
    end;  //SaveDialog1.Execute

if(PlotDifference.checked) then
  begin
  //xyGraph5[1].HoldUpdates:=True;
  for l:=1 to MiLinesNr do
        begin
        for k:=1 to MiDataNr do
        DiffAjust[1].Addpoint(l*MiLinesNr+k,MiZDiffp[l,k]);
        end;

    //xyGraph5[1].HoldUpdates:=False;
  end;   // PlotDifference.checked


end;  // If LinesNr.Caption

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

procedure TValProm.xyyGraph4Click(Sender: TObject);
var
i: integer;

begin
for i:=1 to 100 do 
end;

end.

