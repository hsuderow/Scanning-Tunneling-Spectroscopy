unit BCSFit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, xyyGraph, StdCtrls, ComCtrls, Tabnotbk, Spin, EliashCode,
  blqLoader,var_gbl,blqDataSet, Math;

type
  TForm1 = class(TForm)
    Parameters: TTabbedNotebook;
    Delta: TLabel;
    ValDelta: TEdit;
    Calc: TButton;
    Accuracy: TLabel;
    Steps: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    MaxVolt: TEdit;
    Label3: TLabel;
    SmearType: TRadioGroup;
    Label4: TLabel;
    RoundGauss: TEdit;
    TempChoice: TRadioGroup;
    Temp: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    SupLimit: TEdit;
    D_steps: TSpinEdit;
    Label7: TLabel;
    Panel1: TPanel;
    Button1: TButton;
    LabelN: TLabel;
    Delta_2: TEdit;
    Label8: TLabel;
    Round_2: TEdit;
    SecondGap: TCheckBox;
    Label9: TLabel;
    GapRatio: TEdit;
    Label10: TLabel;
    PlotDist: TButton;
    OpenDialog1: TOpenDialog;
    DistrOpenFile: TButton;
    ArbDistr: TCheckBox;
    Edit1: TEdit;
    Button2: TButton;
    CalISS: TButton;
    Sprime: TCheckBox;
    SPrimeVal: TEdit;
    SpinSplitting: TCheckBox;
    Delta_H: TEdit;
    Label11: TLabel;
    SpinRatio: TEdit;
    Label12: TLabel;
    ValGamma: TEdit;
    Label13: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label14: TLabel;
    Label15: TLabel;
    Button6: TButton;
    Button7: TButton;
    CheckBox1: TCheckBox;
    Button8: TButton;
    Panel2: TPanel;
    Label16: TLabel;
    Edit2: TEdit;
    Label17: TLabel;
    Edit3: TEdit;
    Label18: TLabel;
    Edit4: TEdit;
    Button9: TButton;
    Label19: TLabel;
    Edit5: TEdit;
    Label20: TLabel;
    Edit6: TEdit;
    Label21: TLabel;
    Edit7: TEdit;
    Label22: TLabel;
    Edit8: TEdit;
    Button10: TButton;
    Label23: TLabel;
    Edit9: TEdit;
    Label24: TLabel;
    Button11: TButton;
    Label25: TLabel;
    Edit10: TEdit;
    Label26: TLabel;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    OpenDialog2: TOpenDialog;
    procedure CalcClick(Sender: TObject);
    procedure DelGrphClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DistrOpenFileClick(Sender: TObject);
    procedure SecondGapClick(Sender: TObject);
    procedure PlotDistClick(Sender: TObject);
    procedure CalISSClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    

  private
    { Private declarations }
  public
    { Public declarations }
  function MyInterpola(x: Extended): Extended;
  function MyInterpola_2(x: Extended): Extended;
  function Angle(X, Y: Extended): Extended;
  end;

var
  Form1: TForm1;
  E,V,Tempr,DeltaM,DeltaM2: Double;
  N_E,Smear_E,ResBefTemp_E,ResAftTemp_E,ResTotal,ResTotal2,Distr,Distr1,Distr2,
  Integ: Array[0..10000] of double;
  Fich_Interp_X,Fich_Interp_Y: Array[0..10000] of double;
  Fich_Interp_Size: Integer;
  Fich_Interp_X_2,Fich_Interp_Y_2: Array[0..10000] of double;
  Fich_Interp_Size_2: Integer;
  CurvaADerivar: vcurva;
  CurvaDerivada: vcurva;
  MatrixOfVortices_X: Array[1..10000] of double;
  MatrixOfVortices_Y: Array[1..10000] of double;
  MatrixOfVortices_Size: Integer;
  Fi6_r: Array[1..10000] of double;
  Fi6_i: Array[1..10000] of double;
  NProxVec: Array[1..10000] of integer;
  tri_1: Array[1..10000] of integer;
  tri_2: Array[1..10000] of integer;
  tri_3: Array[1..10000] of integer;
  Triangulation_Size: Integer;
  Distances_1:Array[0..100000] of double;
  Distances_2:Array[0..100000] of double;
  Corr_ang:Array[0..100000] of double;
  Corr_ang1:Array[0..100000] of double;
  Ndist: Array[1..10000] of integer;
  Histo_Distances_1: Array[0..1000] of integer;
  Histo_Distances_2: Array[0..1000] of integer;
  Angles_1:Array[0..10000] of double;
  Angles_2:Array[0..10000] of double;
  Bragg_1: Array[0..100000] of double;

implementation

uses AuxGraph, MiLee;


{$R *.DFM}

procedure TForm1.CalcClick(Sender: TObject);
var
        i,j,k,Max,S_Max: LongInt;
        V_Max,D,delta,H,G: Double;
        RoundG,RoundG2,RatioG,RatioH: Double;

begin
AuxGraph1.Show;
if StrtoFloat(maxVolt.Text)<StrtoFloat(ValDelta.Text) then
maxVolt.Text:= ValDelta.Text;

Max:=10*Steps.Value;
V_Max:=StrtoFloat(MaxVolt.Text);
G:=StrtoFloat(ValGamma.Text);
D:=StrtoFloat(ValDelta.Text);
RoundG:=StrtoFloat(RoundGauss.Text);
Tempr:=StrtoFloat(Temp.Text)*0.086;
DeltaM:=StrtoFloat(SupLimit.Text);
S_Max:=100*D_steps.Value;
DeltaM2:=StrtoFloat(Delta_2.Text);
RoundG2:=StrtoFloat(Round_2.Text);
RatioG:=StrtoFloat(GapRatio.Text);
RatioH:=StrtoFloat(SpinRatio.Text);
H:=StrtoFloat(Delta_H.Text);

if (ArbDistr.Checked) then
begin
for i:=1 to Max do begin
E:=i/Max*V_Max;
Smear_E[i]:=0;
for j:=0 to S_Max do
        begin
                delta:=DeltaM/S_Max*j;
                if (E>delta) then N_E[i]:=E/sqrt(E*E-delta*delta)
                else
                N_E[i]:=0;
                Smear_E[i]:=Smear_E[i]+N_E[i]*MyInterpola(delta);
         end;
end;
          for i:=0 to Max do begin
                if (MyInterpola(0)>0) then  Smear_E[i]:=Smear_E[i]
                +S_Max*DeltaM*MyInterpola(0)/10;
                ///S_Max*DeltaM/2.5066;
                ResBefTemp_E[i]:=Smear_E[i] ;
                end;


end
{else if SmearType.ItemIndex=0 then
begin
        for i:=1 to Max do
        begin
        E:=i/Max*V_Max;

        if (SecondGap.Checked=False) then
         begin
          if (E<=D) then N_E[i]:=0
          else N_E[i]:=E/sqrt(E*E-D*D);
         end
        else
         begin
           if (E<=D) then N_E[i]:=0
           else if(E<=DeltaM2) then N_E[i]:=(1-Ratio)*E/sqrt(E*E-D*D)
          else
            N_E[i]:=(1-Ratio)*E/sqrt(E*E-D*D)+Ratio*E/sqrt(E*E-DeltaM2*DeltaM2);

         end

        end;

for i:=1 to Max do ResBefTemp_E[i]:=N_E[i] ;
end   }
else if SmearType.ItemIndex=0 then
begin
        for i:=1 to Max do
        begin
        E:=i/Max*V_Max;

        if (SecondGap.Checked=False)and(SpinSplitting.Checked=False) then
         begin
          //if (E<=D)then N_E[i]:=0
          if (E<=D) and (G=0) then N_E[i]:=0
        //else N_E[i]:=E/sqrt(E*E-D*D);
          else N_E[i]:=sqrt(E*E+G*G)/sqrt(sqrt((E*E-G*G-D*D)*(E*E-G*G-D*D)+(2*G*E)*(2*G*E)));
         end
        else if (SecondGap.Checked=True) and (SpinSplitting.Checked=False)then
         begin
         {sin gamma: if (D<DeltaM2) and (E<=D) then N_E[i]:=0
         else if(D<DeltaM2) and(E<=DeltaM2) then N_E[i]:=(1-RatioG)*E/sqrt(E*E-D*D)
         else if (D>DeltaM2) and (E<=DeltaM2) then N_E[i]:=0
         else if(D>DeltaM2) and (E<=D) then N_E[i]:=RatioG*E/sqrt(E*E-DeltaM2*DeltaM2)
         else
             N_E[i]:=(1-RatioG)*E/sqrt(E*E-D*D)+RatioG*E/sqrt(E*E-DeltaM2*DeltaM2);
         end }
         //con gamma
         if (G=0) and (D<DeltaM2) and (E<=D) then N_E[i]:=0
         else if (D<DeltaM2) and (E<=DeltaM2)
           then N_E[i]:=(1-RatioG)*sqrt(E*E+G*G)/sqrt(sqrt((E*E-G*G-D*D)*(E*E-G*G-D*D)+(2*G*E)*(2*G*E)))
         else if (G=0) and (D>DeltaM2) and (E<=DeltaM2) then N_E[i]:=0
         else if (D>DeltaM2) and (E<=D) then N_E[i]:=RatioG*sqrt(E*E+G*G)/sqrt(sqrt((E*E-G*G-DeltaM2*DeltaM2)*(E*E-G*G-DeltaM2*DeltaM2)+(2*G*E)*(2*G*E)))
         else
             N_E[i]:=(1-RatioG)*sqrt(E*E+G*G)/sqrt(sqrt((E*E-G*G-D*D)*(E*E-G*G-D*D)+(2*G*E)*(2*G*E)))
             +RatioG*sqrt(E*E+G*G)/sqrt(sqrt((E*E-G*G-DeltaM2*DeltaM2)*(E*E-G*G-DeltaM2*DeltaM2)+(2*G*E)*(2*G*E)));
         end

        else if (SpinSplitting.Checked=True) and (SecondGap.Checked=False)then
          begin
           if (H=0) and (G=0)  and (E<=D) then N_E[i]:=0
           else if (G=0) and(E<=D-H) then N_E[i]:=0
           else if (G=0) and (E<=D+H) {and (E>=D-H) }then N_E[i]:=(1-RatioH)*E/sqrt((E+H)*(E+H)-D*D)
           else if (G=0) and(E>=D+H) then N_E[i]:=RatioH*E/sqrt((E-H)*(E-H)-D*D)
          else if  (G=0) then  N_E[i]:=(1-RatioH)*(E/sqrt((E+H)*(E+H)-D*D))+RatioH*(E/sqrt((E-H)*(E-H)-D*D))

         else N_E[i]:=(1-RatioH)*(sqrt(E*E+G*G)/sqrt(sqrt(((E+H)*(E+H)-G*G-D*D)*((E+H)*(E+H)-G*G-D*D)+(2*G*(E+H))*(2*G*(E+H)))))
          +RatioH*(sqrt(E*E+G*G)/sqrt(sqrt(((E-H)*(E-H)-G*G-D*D)*((E-H)*(E-H)-G*G-D*D)+(2*G*(E-H))*(2*G*(E-H)))));
          end

        end;

for i:=1 to Max do ResBefTemp_E[i]:=N_E[i] ;
end
else if SmearType.ItemIndex=1 then
begin
        for i:=1 to Max do
        begin
        E:=i/Max*V_Max;
        Smear_E[i]:=0;

        if (SecondGap.Checked=False) then
         begin

          for j:=1 to S_Max do
                begin
                delta:=DeltaM/S_Max*j;
                if (E>delta) then N_E[i]:=E/sqrt(E*E-delta*delta)
                else N_E[i]:=0;
                Smear_E[i]:=
                Smear_E[i]+N_E[i]*exp(-(delta-D)*(delta-D)/RoundG/RoundG/2)
                  /RoundG;
                end;
         end
        else
         begin
          for j:=1 to S_Max do
                begin
                delta:=DeltaM/S_Max*j;
                if (E>delta) then N_E[i]:=E/sqrt(E*E-delta*delta)
                else N_E[i]:=0;
                Smear_E[i]:=
                Smear_E[i]+N_E[i]*
                  ((1-RatioG)*exp(-(delta-D)*(delta-D)/RoundG/RoundG/2)/RoundG+
                  RatioG*exp(-(delta-DeltaM2)*(delta-DeltaM2)/RoundG2/RoundG2/2)/
                  RoundG2);
                end;
         end;
        end;
          for i:=1 to Max do begin
                Smear_E[i]:=Smear_E[i]/S_Max*DeltaM/2.5066;
                ResBefTemp_E[i]:=Smear_E[i] ;
                end;
end
else if SmearType.ItemIndex=2 then
begin
        for i:=1 to Max do
        begin
        E:=i/Max*V_Max;
        Smear_E[i]:=0;

        if (SecondGap.Checked=False) then
         begin

          for j:=1 to S_Max do
                begin
                delta:=DeltaM/S_Max*j;
                if (E>delta) then N_E[i]:=E/sqrt(E*E-delta*delta)
                else N_E[i]:=0;
                Distr[i]:=(D*D-(delta-D)*(delta-D)*D*D/RoundG/RoundG)/D/D;
                if Distr[i]<0 then Distr[i]:=0;
                Smear_E[i]:=
                Smear_E[i]+N_E[i]*Distr[i];
                end;
         end
        else
         begin
          for j:=1 to S_Max do
                begin
                delta:=DeltaM/S_Max*j;
                if (E>delta) then N_E[i]:=E/sqrt(E*E-delta*delta)
                else N_E[i]:=0;
                Distr1[i]:=(1-RatioG)*(D*D-(delta-D)*(delta-D)*D*D/RoundG/RoundG)/D/D;
                if Distr1[i]<0 then Distr1[i]:=0;
                Distr2[i]:=RatioG*(DeltaM2*DeltaM2-(delta-DeltaM2)*(delta-DeltaM2)*DeltaM2*DeltaM2
                        /RoundG2/RoundG2)/DeltaM2/DeltaM2;
                if Distr2[i]<0 then Distr2[i]:=0;
                Distr[i]:=Distr1[i]+Distr2[i];

                Smear_E[i]:=
                Smear_E[i]+N_E[i]*Distr[i];
                end;
         end;
        end;
          for i:=1 to Max do begin
                Smear_E[i]:=Smear_E[i]/S_Max*DeltaM/2.5066;
                ResBefTemp_E[i]:=Smear_E[i] ;
                end;
end;


for i:=1 to Max do ResTotal[i]:=ResBefTemp_E[abs(i-Max)]/ResBefTemp_E[Max-50];
for i:=0 to Max-1 do ResTotal[i+Max]:=ResBefTemp_E[i+1]/ResBefTemp_E[Max-50];

if TempChoice.ItemIndex=1 then
begin
        for i:=1 to 2*Max do
        begin
        V:=(i-Max)/Max*V_Max;
        ResAftTemp_E[i]:=0;
        for j:=1 to 2*Max do
                begin
                E:=(j-Max)/Max*V_Max;
                ResAftTemp_E[i]:=
                ResAftTemp_E[i]+ResTotal[j]*exp((E-V)/Tempr)
                /(1+exp((E-V)/Tempr))
                /(1+exp((E-V)/Tempr))/Tempr;
                end;
        end;
for k:=1 to 2*Max do ResAftTemp_E[k]:=ResAftTemp_E[k]/Max*V_Max;
end
else for i:=1 to 2*Max do ResAftTemp_E[i]:=ResTotal[i];



for i:=1 to 2*Max do begin
E:=(i-Max)/Max*V_Max;
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(E,ResAftTemp_E[i]) ;
end;
end;

procedure TForm1.DelGrphClick(Sender: TObject);
begin
//for i:=1 to GraphNumber do xyyGraph1[i].Clear;
//GraphNumber:=0;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//GraphNumber:=0;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Eliashberg.Show;
AuxGraph1.Show;
end;

procedure TForm1.DistrOpenFileClick(Sender: TObject);
var
F: TextFile;
s,s1,s2: string;
i,conta: Integer;

begin
if OpenDialog1.Execute then
begin
 AssignFile(F, OpenDialog1.FileName);
 Label14.Caption:=ExtractFileName(OpenDialog1.FileName);

 Reset(F);
 conta:=0;
 while not SeekEof(F) do
 begin
   s1:='';
   s2:='';
   Readln(F,s);
   if (Pos(#9,s)>0) then
   begin
   for i:=1 to (Pos(#9,s)-1) do s1:=s1+s[i];
   for i:=Pos(#9,s)+1 to Length(s) do s2:=s2+s[i];
   end;
   conta:=conta+1;
   Fich_Interp_X[conta]:=StrtoFloat(s1);
   Fich_Interp_Y[conta]:=StrtoFloat(s2);
   if (Fich_Interp_Y[conta]<0) then Fich_Interp_Y[conta]:=0;
   Fich_Interp_Size:=Conta;
   //AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint
   //(Fich_Interp_X[conta],Fich_Interp_Y[conta]) ;
 end;
 CloseFile(F);
end;
end;

procedure TForm1.SecondGapClick(Sender: TObject);
begin
if (SecondGap.Checked=False) then
 begin
        Round_2.Enabled:=False;
 end
else begin Round_2.Enabled:=True; end;
end;

procedure TForm1.PlotDistClick(Sender: TObject);
var
        i,Max,S_Max: LongInt;
        V_Max,D: Double;
        RoundG,RoundG2,RatioG: Double;

begin

AuxGraph1.Show;
if StrtoFloat(maxVolt.Text)<StrtoFloat(ValDelta.Text) then
maxVolt.Text:= ValDelta.Text;

Max:=10*Steps.Value;
V_Max:=StrtoFloat(MaxVolt.Text);
D:=StrtoFloat(ValDelta.Text);
RoundG:=StrtoFloat(RoundGauss.Text);
Tempr:=StrtoFloat(Temp.Text)*0.086;
DeltaM:=StrtoFloat(SupLimit.Text);
S_Max:=100*D_steps.Value;
DeltaM2:=StrtoFloat(Delta_2.Text);
RoundG2:=StrtoFloat(Round_2.Text);
RatioG:=StrtoFloat(GapRatio.Text);


if (ArbDistr.Checked) then
begin
for i:=0 to Max do begin
E:=i/Max*V_Max;
Distr[i]:=MyInterpola(E);
end;
end
else if Smeartype.ItemIndex=1 then
begin
        for i:=1 to Max do
        begin
        E:=i/Max*V_Max;

        if (SecondGap.Checked=False) then
         Distr[i]:=exp(-(E-D)*(E-D)/RoundG/RoundG/2)/RoundG
        else
         begin
                Distr[i]:=
                 ((1-RatioG)*exp(-(E-D)*(E-D)/RoundG/RoundG/2)/RoundG+
                 RatioG*exp(-(E-DeltaM2)*(E-DeltaM2)/RoundG2/RoundG2/2)/
                 RoundG2);

         end;
         end;

end
else if Smeartype.ItemIndex=2 then
begin
        if (SecondGap.Checked=False) then
        begin
        for i:=1 to Max do
        begin
        E:=i/Max*V_Max;
         Distr[i]:=(D*D-(E-D)*(E-D)*D*D/RoundG/RoundG)/D/D;
         if Distr[i]<0 then Distr[i]:=0;
         end;
        end
        else
        begin
        for i:=1 to Max do
        begin
        E:=i/Max*V_Max;
         Distr1[i]:=(1-RatioG)*(D*D-(E-D)*(E-D)*D*D/RoundG/RoundG)/D/D;
         if Distr1[i]<0 then Distr1[i]:=0;
         Distr2[i]:=RatioG*(DeltaM2*DeltaM2-(E-DeltaM2)*(E-DeltaM2)*DeltaM2*DeltaM2
                        /RoundG2/RoundG2)/DeltaM2/DeltaM2;
         if Distr2[i]<0 then Distr2[i]:=0;
         Distr[i]:=Distr1[i]+Distr2[i];
         end;
        end;
end;
AuxGraph1.ActiveCurveNr.Value:=AuxGraph1.ActiveCurveNr.Value+1;
for i:=0 to Max do begin
E:=i/Max*V_Max;
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(E,Distr[i]) ;
end;
end;

function TForm1.MyInterpola(x: Extended): Extended;
var
i: Integer;
b,a: Extended;

begin
i:=2;
while (i<=Fich_Interp_Size) do
begin
if (((x<=Fich_Interp_X[i-1]) and (x>=Fich_Interp_X[i])) or
    ((x>=Fich_Interp_X[i-1]) and (x<=Fich_Interp_X[i])))
 then
 begin
 b:= (Fich_Interp_Y[i]-Fich_Interp_Y[i-1])/(Fich_Interp_X[i]-Fich_Interp_X[i-1]);
 a:= Fich_Interp_Y[i]-b*Fich_Interp_X[i];
 MyInterpola:= a+b*x;
 end;
i:=i+1;
end;

end;

procedure TForm1.CalISSClick(Sender: TObject);
var
        i,j,Max,S_Max: LongInt;
        V_Max,D,deltasp: Double;
        RoundG,RoundG2,RatioG: Double;

begin
AuxGraph1.Show;
if StrtoFloat(maxVolt.Text)<StrtoFloat(ValDelta.Text) then
maxVolt.Text:= ValDelta.Text;

Max:=10*Steps.Value;
V_Max:=StrtoFloat(MaxVolt.Text);
D:=StrtoFloat(ValDelta.Text);
RoundG:=StrtoFloat(RoundGauss.Text);
Tempr:=StrtoFloat(Temp.Text)*0.086;
DeltaM:=StrtoFloat(SupLimit.Text);
S_Max:=100*D_steps.Value;
DeltaM2:=StrtoFloat(Delta_2.Text);
RoundG2:=StrtoFloat(Round_2.Text);
RatioG:=StrtoFloat(GapRatio.Text);
deltasp:=StrtoFloat(SPrimeVal.Text);

for i:=-Max to Max do
begin
V:=i/Max*V_Max;
Integ[i]:=0;
for j:=-(1*Max) to (1*Max) do
begin
if (j<0) then E:=j/Max*V_Max+0.0013
else E:=j/Max*V_Max-0.0013;

if SPrime.checked=False then
begin
 if ((abs(E)>D) and (abs(E+V)>D)) then Integ[i]:=Integ[i]+abs(E)/sqrt(E*E-D*D)*
  abs(E+V)/sqrt((E+V)*(E+V)-D*D)
        *(1/(1+exp(E/Tempr))-1/(1+exp((E+V)/Tempr)));
end
else
begin
 if ((abs(E)>D) and (abs(E+V)>deltasp)) then Integ[i]:=Integ[i]+abs(E)/sqrt(E*E-D*D)*
  abs(E+V)/sqrt((E+V)*(E+V)-deltasp*deltasp)
        *(1/(1+exp(E/Tempr))-1/(1+exp((E+V)/Tempr)));
end;

end;
end;

for i:=-Max to Max do begin
E:=i/Max*V_Max;
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(E,Integ[i]) ;
end;


end;


procedure TForm1.Button3Click(Sender: TObject);
var
        i,j,k,Max: LongInt;
        V_Max,Norm: Double;

begin
Parameters.Pageindex:=2;
//DistrOpenFileClick(nil);

Max:=10*Steps.Value;
V_Max:=StrtoFloat(MaxVolt.Text);
Tempr:=StrtoFloat(Temp.Text)*0.086;

if TempChoice.ItemIndex=0 then PlotDistClick(nil)
else
begin
for i:=1 to Max do begin
E:=i/Max*V_Max;
ResBefTemp_E[i]:=MyInterpola(E);
end;
for i:=1 to Max do ResTotal[i]:=ResBefTemp_E[abs(i-Max)]/ResBefTemp_E[Max-50];
for i:=0 to Max-1 do ResTotal[i+Max]:=ResBefTemp_E[i+1]/ResBefTemp_E[Max-50];
for i:=1 to 2*Max do
        begin
        V:=(i-Max)/Max*V_Max;
        ResAftTemp_E[i]:=0;
        for j:=1 to 2*Max do
                begin
                E:=(j-Max)/Max*V_Max;
                ResAftTemp_E[i]:=
                ResAftTemp_E[i]+ResTotal[j]*exp((E-V)/Tempr)
                /(1+exp((E-V)/Tempr))
                /(1+exp((E-V)/Tempr))/Tempr;
                end;
        end;
for k:=1 to 2*Max do ResAftTemp_E[k]:=ResAftTemp_E[k]/Max*V_Max;
Norm:=ResAftTemp_E[10];
for i:=1 to 2*Max do begin
 ResAftTemp_E[i]:=ResAftTemp_E[i]/Norm;
end;
AuxGraph1.ActiveCurveNr.Value:=AuxGraph1.ActiveCurveNr.Value+1;
for i:=1 to 2*Max do begin
E:=(i-Max)/Max*V_Max;
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(E,ResAftTemp_E[i]) ;
end;
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
        i,j,Max: LongInt;
        V_Max: Double;

begin
Parameters.Pageindex:=2;
//DistrOpenFileClick(nil);

Max:=10*Steps.Value;
V_Max:=StrtoFloat(MaxVolt.Text);
Tempr:=StrtoFloat(Temp.Text)*0.086;

for i:=-Max to Max do
begin
V:=i/Max*V_Max;
Integ[i]:=0;
for j:=-(1*Max) to (1*Max) do
begin
if (j<0) then E:=j/Max*V_Max+0.0013
else E:=j/Max*V_Max-0.0013;
Integ[i]:=Integ[i]+MyInterpola(abs(E))*MyInterpola(abs(E+V))
        *(1/(1+exp(E/Tempr))-1/(1+exp((E+V)/Tempr)));
end;
end;
AuxGraph1.ActiveCurveNr.Value:=AuxGraph1.ActiveCurveNr.Value+1;
for i:=-Max to Max do begin
E:=i/Max*V_Max;
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(E,Integ[i]) ;
end;

end;

procedure TForm1.Button5Click(Sender: TObject);
var
        i,j,Max: LongInt;
        V_Max,Norm: Double;

begin
Parameters.Pageindex:=2;
//DistrOpenFileClick(nil);
//D:=StrtoFloat(ValDelta.Text);

Max:=10*Steps.Value;
V_Max:=StrtoFloat(MaxVolt.Text);
Tempr:=StrtoFloat(Temp.Text)*0.086;

for i:=-Max to Max do
begin
V:=i/Max*V_Max;
Integ[i]:=0;
for j:=-(1*Max) to (1*Max) do
begin
if (j<0) then E:=j/Max*V_Max+0.0013
else E:=j/Max*V_Max-0.0013;

Integ[i]:=Integ[i]+MyInterpola(abs(E))
        *MyInterpola_2(abs(E+V))
        *(1/(1+exp(E/Tempr))-1/(1+exp((E+V)/Tempr)));
end;
end;

if CheckBox1.checked then
  begin
  CurvaADerivar.n:=Max+1;
  for i:=0 to Max do
  begin
  CurvaADerivar.x[i]:=i/Max*V_Max;
  CurvaADerivar.y[i]:=Integ[i];
  end;
  ValProm.DerivaRectas(CurvaAderivar,CurvaDerivada);
  for i:=0 to Max do
  begin
  Integ[i]:=CurvaDerivada.y[i];
  end;
  Norm:= Integ[Max-10];
  for i:=-Max to Max do
  begin
  Integ[i]:=Integ[abs(i)]/Norm;
  end;
  end;


AuxGraph1.ActiveCurveNr.Value:=AuxGraph1.ActiveCurveNr.Value+1;
for i:=-Max to Max do begin
E:=i/Max*V_Max;
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(E,Integ[i]) ;
end;

end;

procedure TForm1.Button6Click(Sender: TObject);

var
F: TextFile;
s,s1,s2: string;
i,conta: Integer;

begin
if OpenDialog1.Execute then
begin
 AssignFile(F, OpenDialog1.FileName);
 Label15.Caption:=ExtractFileName(OpenDialog1.FileName);

 Reset(F);
 conta:=0;
 while not SeekEof(F) do
 begin
   s1:='';
   s2:='';
   Readln(F,s);
   if (Pos(#9,s)>0) then
   begin
   for i:=1 to (Pos(#9,s)-1) do s1:=s1+s[i];
   for i:=Pos(#9,s)+1 to Length(s) do s2:=s2+s[i];
   end;
   conta:=conta+1;
   Fich_Interp_X_2[conta]:=StrtoFloat(s1);
   Fich_Interp_Y_2[conta]:=StrtoFloat(s2);
   if (Fich_Interp_Y_2[conta]<0) then Fich_Interp_Y_2[conta]:=0;
   Fich_Interp_Size_2:=Conta;
   //AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint
   //(Fich_Interp_X[conta],Fich_Interp_Y[conta]) ;
 end;
 CloseFile(F);
end;


end;

function TForm1.MyInterpola_2(x: Extended): Extended;
var
i: Integer;
b,a: Extended;

begin
i:=2;
while (i<=Fich_Interp_Size_2) do
begin
if (((x<=Fich_Interp_X_2[i-1]) and (x>=Fich_Interp_X_2[i])) or
    ((x>=Fich_Interp_X_2[i-1]) and (x<=Fich_Interp_X_2[i])))
 then
 begin
 b:= (Fich_Interp_Y_2[i]-Fich_Interp_Y_2[i-1])/(Fich_Interp_X_2[i]-Fich_Interp_X_2[i-1]);
 a:= Fich_Interp_Y_2[i]-b*Fich_Interp_X_2[i];
 MyInterpola_2:= a+b*x;
 end;
i:=i+1;
end;

end;



procedure TForm1.Button7Click(Sender: TObject);
var
        i,Max,S_Max: LongInt;
        V_Max,D: Double;
        RoundG,RoundG2,RatioG: Double;

begin

AuxGraph1.Show;
if StrtoFloat(maxVolt.Text)<StrtoFloat(ValDelta.Text) then
maxVolt.Text:= ValDelta.Text;

Max:=10*Steps.Value;
V_Max:=StrtoFloat(MaxVolt.Text);
D:=StrtoFloat(ValDelta.Text);
RoundG:=StrtoFloat(RoundGauss.Text);
Tempr:=StrtoFloat(Temp.Text)*0.086;
DeltaM:=StrtoFloat(SupLimit.Text);
S_Max:=100*D_steps.Value;
DeltaM2:=StrtoFloat(Delta_2.Text);
RoundG2:=StrtoFloat(Round_2.Text);
RatioG:=StrtoFloat(GapRatio.Text);


if (ArbDistr.Checked) then
begin
 for i:=0 to Max do
  begin
  E:=i/Max*V_Max;
  Distr[i]:=MyInterpola_2(E);
  end;
end;

AuxGraph1.ActiveCurveNr.Value:=AuxGraph1.ActiveCurveNr.Value+1;
for i:=0 to Max do begin
E:=i/Max*V_Max;
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(E,Distr[i]) ;
end;

end;

procedure TForm1.Button8Click(Sender: TObject);
var
        i,j,Max: LongInt;
        V_Max,Norm,D: Double;

begin
Parameters.Pageindex:=2;
//DistrOpenFileClick(nil);
//D:=StrtoFloat(ValDelta.Text);
D:=StrtoFloat(ValDelta.Text);

Max:=10*Steps.Value;
V_Max:=StrtoFloat(MaxVolt.Text);
Tempr:=StrtoFloat(Temp.Text)*0.086;

for i:=-Max to Max do
begin
V:=i/Max*V_Max;
Integ[i]:=0;
for j:=-(1*Max) to (1*Max) do
begin
if (j<0) then E:=j/Max*V_Max+0.0013
else E:=j/Max*V_Max-0.0013;

if (abs(E+V)>D) then Integ[i]:=Integ[i]+MyInterpola(abs(E))
        *abs(E+V)/sqrt((E+V)*(E+V)-D*D)
        *(1/(1+exp(E/Tempr))-1/(1+exp((E+V)/Tempr)))
else Integ[i]:=0;

end;
end;

if CheckBox1.checked then
  begin
  CurvaADerivar.n:=Max+1;
  for i:=0 to Max do
  begin
  CurvaADerivar.x[i]:=i/Max*V_Max;
  CurvaADerivar.y[i]:=Integ[i];
  end;
  ValProm.DerivaRectas(CurvaAderivar,CurvaDerivada);
  for i:=0 to Max do
  begin
  Integ[i]:=CurvaDerivada.y[i];
  end;
  Norm:= Integ[Max-10];
  for i:=-Max to Max do
  begin
  Integ[i]:=Integ[abs(i)]/Norm;
  end;
  end;


AuxGraph1.ActiveCurveNr.Value:=AuxGraph1.ActiveCurveNr.Value+1;
for i:=-Max to Max do begin
E:=i/Max*V_Max;
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(E,Integ[i]);
end;

end;

procedure TForm1.Button9Click(Sender: TObject);
var
Integ_D0,Integ_D1: Double;
i,j,k,l,Pasos: Integer;
Theta_0, Theta_K, Paso, Paso_theta, En_Max, Paso_En, Energia, RaizCuad: Double;

Energia_Integ_Paco: Array [0..1000] of double;
Result_Integ_Paco: Array[0..1000] of double;

begin
Integ_D0:=StrtoFloat(Edit3.Text);
Integ_D1:=StrtoFloat(Edit2.Text);
Theta_0:=StrtoFloat(Edit4.Text)/360*2*PI;
Pasos:=StrtoInt(Edit5.Text);
En_Max:=StrtoFloat(Edit6.Text);
Paso_En:=StrtoFloat(Edit7.Text);
Paso_theta:= StrtoFloat(Edit8.Text)/360*2*PI;

Energia:=0;
j:=0;

while (Theta_0<2*PI) do
begin
while (Energia<En_Max) do
begin
Energia:=Energia+Paso_En;
Energia_Integ_Paco[j]:=Energia;
Result_Integ_Paco[j]:=0;

for i:= 0 to Pasos do
 begin
  Theta_K:=2*PI*i/Pasos;
   RaizCuad:=Energia*Energia-
     (Integ_D0+Integ_D1*cos(6*theta_K))*(Integ_D0+Integ_D1*cos(6*Theta_K));
  if (RaizCuad > 0) then
  Result_Integ_Paco[j]:=Result_Integ_Paco[j]+
     (cos(2*(Theta_0-Theta_K))*cos(Theta_K)+sin(2*(Theta_0-Theta_K))*sin(Theta_K))
     *(cos(2*(Theta_0-Theta_K))*cos(Theta_K)+sin(2*(Theta_0-Theta_K))*sin(Theta_K))*
     Energia/sqrt(RaizCuad)* 2*PI/Pasos;
  //else Result_Integ_Paco[j]:=0;
 end;
if Result_Integ_Paco[j]>10 then Result_Integ_Paco[j]:=10;
j:=j+1;
end;
for i:=0 to j-1 do
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].
   Addpoint(Energia_Integ_Paco[i],Result_Integ_Paco[i]) ;

AuxGraph1.ActiveCurveNr.Value:=AuxGraph1.ActiveCurveNr.Value+1;
Application.ProcessMessages;
Theta_0:=Theta_0+Paso_theta;
end;

end;

procedure TForm1.Button10Click(Sender: TObject);
var
F: TextFile;
s,s1,s2: string;
conta,i: Integer;

begin

if OpenDialog1.Execute then
begin
 AssignFile(F, OpenDialog1.FileName);

 Reset(F);
 conta:=1;
 while not SeekEof(F) do
 begin
   s1:='';
   s2:='';
   Readln(F,s);
   if (Pos(#9,s)>0) then
   begin
   for i:=1 to (Pos(#9,s)-1) do s1:=s1+s[i];   // 32 is space
   for i:=Pos(#9,s)+1 to Length(s) do s2:=s2+s[i];
   MatrixOfVortices_X[conta]:=StrtoFloat(s1);
   MatrixOfVortices_Y[conta]:=StrtoFloat(s2);
   conta:=conta+1;
   MatrixOfVortices_Size:=Conta-1;
   end;
 end;
 CloseFile(F);
end;

end;

// Función ángulo de un vector respecto a la horizontal

function TForm1.Angle(X, Y: Extended): Extended;
var
a: Extended;

begin
a:=ArcTan2(Y, X);
if a<0 then a:=a+2*Pi;

Angle:=a;

end;


procedure TForm1.Button13Click(Sender: TObject);
var
i,j,k,SizeImgVort,contHisto,conta11: LongInt;
buf,deltaHisto,contpru,x1,x2,x3,y1,y2,y3: Real;


begin

   SizeImgVort:=StrtoInt(Edit9.Text);
   contHisto:=0;
   deltaHisto:=0.01;
   conta11:=0;


//Función de correlación orientacional (Lo hace bien menos en los bordes)
for i:=1 to MatrixOfVortices_Size do
begin
 for j:=1 to Triangulation_Size do
 begin
 x1:=MatrixOfVortices_X[tri_1[j]]-MatrixOfVortices_X[i];
 y1:=MatrixOfVortices_Y[tri_1[j]]-MatrixOfVortices_Y[i];
 x2:=MatrixOfVortices_X[tri_2[j]]-MatrixOfVortices_X[i];
 y2:=MatrixOfVortices_Y[tri_2[j]]-MatrixOfVortices_Y[i];
 x3:=MatrixOfVortices_X[tri_3[j]]-MatrixOfVortices_X[i];
 y3:=MatrixOfVortices_Y[tri_3[j]]-MatrixOfVortices_Y[i];
  if i=tri_1[j] then
  begin
  Fi6_r[i]:=Fi6_r[i]+Cos(6*Angle(x2,y2))+Cos(6*Angle(x3,y3));
  Fi6_i[i]:=Fi6_i[i]+Sin(6*Angle(x2,y2))+Sin(6*Angle(x3,y3));
  NProxVec[i]:=NProxVec[i]+2;
  end
  else
   begin
    if i=tri_2[j] then
     begin
     Fi6_r[i]:=Fi6_r[i]+Cos(6*Angle(x1,y1))+Cos(6*Angle(x3,y3));
     Fi6_i[i]:=Fi6_i[i]+Sin(6*Angle(x1,y1))+Sin(6*Angle(x3,y3));
     NProxVec[i]:=NProxVec[i]+2;
     end
    else
     begin
       if i=tri_3[j] then
       begin
       Fi6_r[i]:=Fi6_r[i]+Cos(6*Angle(x1,y1))+Cos(6*Angle(x2,y2));
       Fi6_i[i]:=Fi6_i[i]+Sin(6*Angle(x1,y1))+Sin(6*Angle(x2,y2));

 //      Fi6_r[i]:=Fi6_r[i]+Cos(6*Angle(MatrixOfVortices_X[tri_1[j]],MatrixOfVortices_Y[tri_1[j]]))
 //          +Cos(6*Angle(MatrixOfVortices_X[tri_2[j]],MatrixOfVortices_Y[tri_2[j]]));
 //      Fi6_i[i]:=Fi6_i[i]+Sin(6*Angle(MatrixOfVortices_X[tri_1[j]],MatrixOfVortices_Y[tri_1[j]]))
 //          +Sin(6*Angle(MatrixOfVortices_X[tri_2[j]],MatrixOfVortices_Y[tri_2[j]]));
       NProxVec[i]:=NProxVec[i]+2;
     end;
     end;
   end;
 end;
  NProxVec[i]:=Round(NProxVec[i]/2);
  Fi6_r[i]:=Fi6_r[i]/(2*NProxVec[i]);
  Fi6_i[i]:=Fi6_i[i]/(2*NProxVec[i]);

end;

//////////

   for i:=0 to 150 do
   begin
    Histo_Distances_2[i]:=0;
   end;


//CAMBIADO

   for i:=1 to MatrixOfVortices_Size-1 do
   begin
   for j:=i+1 to MatrixOfVortices_Size do
    begin
    if (i<>j) then
    begin
    Distances_2[conta11]:= sqrt(((MatrixOfVortices_X[j]-MatrixOfVortices_X[i])*
    (MatrixOfVortices_X[j]-MatrixOfVortices_X[i]))
    +((MatrixOfVortices_Y[j]-MatrixOfVortices_Y[i])*(MatrixOfVortices_Y[j]-MatrixOfVortices_Y[i])));

    Corr_ang1[conta11]:= Fi6_r[i]*Fi6_r[j]+Fi6_i[i]*Fi6_i[j];
//    Distances_2[conta11]:=abs(sqrt(MatrixOfVortices_X[i]*MatrixOfVortices_X[i]
//    +MatrixOfVortices_Y[i]*MatrixOfVortices_Y[i])-
//    sqrt(MatrixOfVortices_X[j]*MatrixOfVortices_X[j]+MatrixOfVortices_Y[j]*MatrixOfVortices_Y[j]));

// Poner el tamaño de la imagen en nm
    contpru:=Distances_2[conta11]/0.01;
    contHisto:=Round(contpru);
//    contHisto:=Round(Distances_2[i+j]);
    if contHisto>150 then contHisto:=150;
    Histo_Distances_2[contHisto]:=Histo_Distances_2[contHisto]+1;
    Corr_ang[contHisto]:=Corr_ang[contHisto]+Corr_ang1[conta11];

//    if ((abs(MatrixOfVortices_Y[i]-MatrixOfVortices_Y[j]))>0) then buf:=ArcTan(
//      (MatrixOfVortices_X[i]-MatrixOfVortices_X[j])/(MatrixOfVortices_Y[i]-MatrixOfVortices_Y[j]))
//      /2/PI*6
//      else buf:=1;
//     Angles_2[i+j]:=abs(buf-Round(buf))-1;

     conta11:=conta11+1;
    end;
    end;
   end;

   for i:=1 to MatrixOfVortices_Size-1 do
   begin
    //ThisPoint_X:=MatrixOfVortices_X[1];
    //ThisPoint_Y:=MatrixOfVortices_X[1];

    Bragg_1[i]:= sqrt(((MatrixOfVortices_X[i]-MatrixOfVortices_X[i])*
    (MatrixOfVortices_X[j]-MatrixOfVortices_X[i]))
    +((MatrixOfVortices_Y[j]-MatrixOfVortices_Y[i])*(MatrixOfVortices_Y[j]-MatrixOfVortices_Y[i])));
   end;

   for i:=0 to 150 do
   begin
   if Histo_Distances_2[i]>0 then
   begin
   Corr_ang[i]:=Corr_ang[i]/Histo_Distances_2[i];
   end;
   end;



end;

procedure TForm1.Button14Click(Sender: TObject);
var
i,MaxPts: Integer;
deltaHistograma: Real;

begin
MaxPts:=StrtoInt(Edit9.Text);
//for i:=0 to MaxPts do

for i:=0 to 150 do
begin
deltaHistograma:=i*0.01;
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(deltaHistograma,Histo_Distances_2[i]) ;
end;
//AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(i,Histo_Distances_2[i]) ;

end;

procedure TForm1.Button15Click(Sender: TObject);
var
i,MaxPts: Integer;

begin
MaxPts:=StrtoInt(Edit9.Text);
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].PlotLines:=False;

for i:=0 to MatrixOfVortices_Size*MatrixOfVortices_Size do
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(Distances_2[i],Angles_2[i]) ;


end;

procedure TForm1.Button18Click(Sender: TObject);

var
F: TextFile;
r,r1,rm,r2,r3: string;
contar,i: Integer;

begin

if OpenDialog2.Execute then
begin
 AssignFile(F, OpenDialog2.FileName);

 Reset(F);
 contar:=1;
 while not SeekEof(F) do
 begin
   r1:='';
   rm:='';
   r2:='';
   r3:='';
   Readln(F,r);
   if (Pos(#9,r)>0) then
   begin
   for i:=1 to (Pos(#9,r)-1) do r1:=r1+r[i];   // 32 is space
   for i:=Pos(#9,r)+1 to Length(r) do rm:=rm+r[i];
   if (Pos(#9,rm)>0) then
   for i:=1 to (Pos(#9,rm)-1) do r2:=r2+rm[i];   // 32 is space
   for i:=Pos(#9,rm)+1 to Length(r) do r3:=r3+rm[i];

   tri_1[contar]:=StrtoInt(r1);
   tri_2[contar]:=StrtoInt(r2);
   tri_3[contar]:=StrtoInt(r3);
   contar:=contar+1;
   Triangulation_Size:=Contar-1;
   end;
 end;
 CloseFile(F);
end;
end;

procedure TForm1.Button17Click(Sender: TObject);
var
i,MaxPts: Integer;
deltaHistograma: Real;

begin

for i:=0 to 150 do
begin
deltaHistograma:=i*0.01;
if Corr_ang[i]>0 then
begin
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(deltaHistograma,Corr_ang[i]) ;
end;
end;
end;
end.

