unit EliashCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, xyyGraph, ComCtrls, Tabnotbk, AuxGraph, Spin;

type
  TEliashberg = class(TForm)
    EliashPara: TTabbedNotebook;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EDelta0: TEdit;
    ECentro: TEdit;
    EAncho: TEdit;
    ECoulomb: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ECalc: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EVmin: TEdit;
    EVMax: TEdit;
    EVPaso: TEdit;
    Label13: TLabel;
    EDeltaImag: TEdit;
    ECalcLor: TButton;
    Label14: TLabel;
    Label15: TLabel;
    EwqMax: TEdit;
    EwqPasos: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    EwpMax: TEdit;
    EwpPasos: TEdit;
    ECalcN: TButton;
    Label20: TLabel;
    Ewcorte: TEdit;
    Label21: TLabel;
    ECentro2: TEdit;
    EAncho2: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Busy: TLabel;
    Count: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    fcortew0: TEdit;
    Iter: TSpinEdit;
    Label28: TLabel;
    Alto_1: TEdit;
    Alto2l: TLabel;
    Alto_2: TEdit;
    MinSqr: TEdit;
    Label29: TLabel;
    Alphasqa: TEdit;
    Label30: TLabel;
    CalN_E: TCheckBox;
    procedure ECalcLorClick(Sender: TObject);
    procedure EDelGraphClick(Sender: TObject);
    procedure ECalcClick(Sender: TObject);
    procedure ECalcNClick(Sender: TObject);
    procedure StopClick(Sender: TObject);
  private
    { Private declarations }
    function Lorentz(x: Extended; Centro: Extended;Ancho: Extended;
    Alto: Extended): Extended;
    function AlphasqF(x: Extended): Extended;

  public
    { Public declarations }
  end;

var
  Eliashberg: TEliashberg;
  Lorentz: Array [0..10000] of Extended;
  ReXi: Array [0..10000] of Extended;
  ImXi: Array [0..10000] of Extended;
  RePhi: Array [0..10000] of Extended;
  ImPhi: Array [0..10000] of Extended;
  ResReal: Array [0..10000] of Extended;
  ResIm: Array [0..10000] of Extended;
  N_E: Array [0..10000] of Extended;
  MiStop: Boolean;
  Centro,Ancho,Alto1,Centro2,Ancho2,Alto2,alphasq: Extended;

implementation


{$R *.DFM}

procedure TEliashberg.ECalcLorClick(Sender: TObject);
var
 i: LongInt;
 x,y: Double;

begin

Centro:=StrtoFloat(ECentro.Text);
Ancho:=StrtoFloat (EAncho.Text);
Alto1:=StrtoFloat (Alto_1.Text);
Centro2:=StrtoFloat(ECentro2.Text);
Ancho2:=StrtoFloat (EAncho2.Text);
Alto2:=StrtoFloat (Alto_2.Text);


Alphasq:=StrtoFloat (Alphasqa.Text);

for i:=1 to 30000 do
begin
 x:=i/3000*Centro;
 y:=AlphasqF(x);
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(x,y);
end;

end;

procedure TEliashberg.EDelGraphClick(Sender: TObject);
begin
//  EliashGraphRe[1].Clear;
//    EliashGraphIm[1].Clear;
end;

procedure TEliashberg.ECalcClick(Sender: TObject);

var

w,wp,wq,d,Delta,Maxwp,Minwp,Maxwq,Minwq,Minw,Maxw: Extended;
l,k,i,j,Nropasoswq,Nropasoswp,Nropasosw :LongInt;
Integralwq,Integralwp: Extended;
pasow, FCow0Var: Extended;
mu,minsqrt: Extended;
Iterat: Integer;

begin
MiStop:=False;

Maxwq:=StrtoFloat(EwqMax.Text);
Minwq:=0;
Nropasoswq:=StrtoInt(EwqPasos.Text);
d:=StrtoFloat(EDeltaImag.Text);
Delta:=StrtoFloat(EDelta0.Text);

Centro:=StrtoFloat(ECentro.Text);
Ancho:=StrtoFloat (EAncho.Text);
Alto1:=StrtoFloat (Alto_1.Text);
Centro2:=StrtoFloat(ECentro2.Text);
Ancho2:=StrtoFloat (EAncho2.Text);
Alto2:=StrtoFloat (Alto_2.Text);

Alphasq:=StrtoFloat (Alphasqa.Text);


minsqrt:=StrtoFloat (MinSqr.Text);

Minwp:=Delta;
Maxwp:=StrtoFloat(EwpMax.Text);
Nropasoswp:=StrtoInt(EwpPasos.Text);

Minw:= StrtoFloat(EVmin.Text);
Maxw:= StrtoFloat(EVmax.Text);
pasow:=StrtoFloat(EVPaso.Text);
Nropasosw:=Round((Maxw-Minw)/pasow);
Iterat:=Iter.Value;

FCow0Var:=StrtoFloat(fcortew0.Text);

for k:=0 to  Nropasosw  do
begin
w:=Minw+k/Nropasosw*Maxw;
ResReal[k]:=Delta;
ResIm[k]:=0;

if w>FCow0Var then ResReal[k]:=0;
end;

Busy.Caption:='Busy';

for l:=1 to Iterat do
begin

Count.Caption:=InttoStr(l);

Application.ProcessMessages;

for k:=0 to  Nropasosw  do
begin
w:=Minw+k/Nropasosw*Maxw;

Integralwp:=0;
for i:=0 to  Nropasoswp do
begin
        wp:=Minwp+i/Nropasoswp*Maxwp;
        if ((wp*wp-ResReal[k]*ResReal[k]-ResIm[k]*resIm[k])>minsqrt) then
        begin
         Integralwq:=0;
         for j:=0 to  Nropasoswq do
         begin
          wq:=Minwq+j/Nropasoswq*Maxwq;
          Integralwq:=Integralwq+
            (AlphasqF(wq)) *
            (-2*w*((wp+wq)*(wp+wq)-w*w-d*d)/
            (((wp+wq)*(wp+wq)-w*w)*((wp+wq)*(wp+wq)-w*w)
            +d*d*(d*d+2*((wp+wq)*(wp+wq)+w*w))));
          end;
        Integralwq:=Integralwq/Nropasoswq*Maxwq;
        Integralwp:=Integralwp+
        Integralwq*wp
        /sqrt(wp*wp-ResReal[k]*ResReal[k]-ResIm[k]*resIm[k]);
        end;
end;
Integralwp:=Integralwp/Nropasoswp*Maxwp;
ReXi[k]:=Integralwp;
 // fin real Xi
 // inicio imaginario Xi

Integralwp:=0;
for i:=0 to  Nropasoswp do
begin
        wp:=Minwp+i/Nropasoswp*Maxwp;
        if ((wp*wp-ResReal[k]*ResReal[k]-ResIm[k]*resIm[k])>minsqrt) then
        begin
         Integralwq:=0;
         for j:=0 to  Nropasoswq do
         begin
          wq:=Minwq+j/Nropasoswq*Maxwq;
          Integralwq:=Integralwq+
            (AlphasqF(wq)) *
            (-4*w*(wp+wq)*d/
            (((wp+wq)*(wp+wq)-w*w)*((wp+wq)*(wp+wq)-w*w)
            +d*d*(d*d+2*((wp+wq)*(wp+wq)+w*w))));
          end;
        Integralwq:=Integralwq/Nropasoswq*Maxwq;
        Integralwp:=Integralwp+
        Integralwq*wp
        /sqrt(wp*wp-ResReal[k]*ResReal[k]-ResIm[k]*resIm[k]);
        end;
end;
Integralwp:=Integralwp/Nropasoswp*Maxwp;
ImXi[k]:=Integralwp;
 // fin imaginario Xi

Maxwp:=StrtoFloat(Ewcorte.Text);
mu:=StrtoFloat(ECoulomb.Text);

 // inicio real Phi
Integralwp:=0;
for i:=0 to  Nropasoswp do
begin
        wp:=Minwp+i/Nropasoswp*Maxwp;
        if ((wp*wp-ResReal[k]*ResReal[k]-ResIm[k]*ResIm[k])>minsqrt) then
        begin
         Integralwq:=0;
         for j:=0 to  Nropasoswq do
         begin
          wq:=Minwq+j/Nropasoswq*Maxwq;
          Integralwq:=Integralwq+
            (AlphasqF(wq)) *
            (2*(wp+wq)*((wp+wq)*(wp+wq)-w*w+d*d)/
            (((wp+wq)*(wp+wq)-w*w)*((wp+wq)*(wp+wq)-w*w)
            +d*d*(d*d+2*((wp+wq)*(wp+wq)+w*w))));
          end;
        Integralwq:=Integralwq/Nropasoswq*Maxwq;
        Integralwp:=Integralwp+
        (Integralwq-mu)*
        ResReal[k]/sqrt(wp*wp-ResReal[k]*ResReal[k]-ResIm[k]*ResIm[k]);
        end
        else
         if ((-wp*wp+ResReal[k]*ResReal[k]+ResIm[k]*ResIm[k])>minsqrt) then
        begin
         Integralwq:=0;
         for j:=0 to  Nropasoswq do
         begin
          wq:=Minwq+j/Nropasoswq*Maxwq;
          Integralwq:=Integralwq+
            (AlphasqF(wq)) *
            (2*(wp+wq)*((wp+wq)*(wp+wq)-w*w+d*d)/
            (((wp+wq)*(wp+wq)-w*w)*((wp+wq)*(wp+wq)-w*w)
            +d*d*(d*d+2*((wp+wq)*(wp+wq)+w*w))));
          end;
        Integralwq:=Integralwq/Nropasoswq*Maxwq;
        Integralwp:=Integralwp+
        (Integralwq-mu)*
        ResIm[k]/sqrt(-wp*wp+ResReal[k]*ResReal[k]+ResIm[k]*ResIm[k]);
        end;
end;
Integralwp:=Integralwp/Nropasoswp*Maxwp;
RePhi[k]:=Integralwp;
 // fin real Phi


 // inicio Im Phi
Integralwp:=0;
for i:=0 to  Nropasoswp do
begin
        wp:=Minwp+i/Nropasoswp*Maxwp;
        if ((wp*wp-ResReal[k]*ResReal[k]-ResIm[k]*ResIm[k])>minsqrt) then
        begin
         Integralwq:=0;
         for j:=0 to  Nropasoswq do
         begin
          wq:=Minwq+j/Nropasoswq*Maxwq;
          Integralwq:=Integralwq+
            (AlphasqF(wq)) *
            (2*d*((wp+wq)*(wp+wq)+w*w+d*d)/
            (((wp+wq)*(wp+wq)-w*w)*((wp+wq)*(wp+wq)-w*w)
            +d*d*(d*d+2*((wp+wq)*(wp+wq)+w*w))));
          end;
        Integralwq:=Integralwq/Nropasoswq*Maxwq;
        Integralwp:=Integralwp+
        (Integralwq-mu)*
        ResReal[k]/sqrt(wp*wp-ResReal[k]*ResReal[k]-ResIm[k]*ResIm[k]);
        end
        else
         if ((-wp*wp+ResReal[k]*ResReal[k]+ResIm[k]*ResIm[k])>minsqrt) then
        begin
         Integralwq:=0;
         for j:=0 to  Nropasoswq do
         begin
          wq:=Minwq+j/Nropasoswq*Maxwq;
          Integralwq:=Integralwq+
            (AlphasqF(wq)) *
            (2*d*((wp+wq)*(wp+wq)+w*w+d*d)/
            (((wp+wq)*(wp+wq)-w*w)*((wp+wq)*(wp+wq)-w*w)
            +d*d*(d*d+2*((wp+wq)*(wp+wq)+w*w))));
          end;
        Integralwq:=Integralwq/Nropasoswq*Maxwq;
        Integralwp:=Integralwp+
        (Integralwq-mu)*
        ResIm[k]/sqrt(-wp*wp+ResReal[k]*ResReal[k]+ResIm[k]*ResIm[k]);
        end;


end;
Integralwp:=Integralwp/Nropasoswp*Maxwp;
ImPhi[k]:=Integralwp;
 // fin Im Phi

ResReal[k]:=    (
                RePhi[k]*(1-ReXi[k]/w)-
                ImPhi[k]*ImXi[k]/w
                )/
                (
                (1-ReXi[k]/w)*(1-ReXi[k]/w)
                +ImXi[k]*ImXi[k]/w/w
                );

AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value+2*(l-1)].Addpoint(w,ResReal[k]);


ResIm[k]:=    (
                ImPhi[k]*(1-ReXi[k]/w)+
                RePhi[k]*ImXi[k]/w
                )/
                (
                (1-ReXi[k]/w)*(1-ReXi[k]/w)
                +ImXi[k]*ImXi[k]/w/w
                );

AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value+1+2*(l-1)].Addpoint(w,ResIm[k]);
Application.ProcessMessages;

end; // end of for de w

if(CalN_E.Checked) then begin

for k:=0 to  Nropasosw  do
begin
w:=Minw+k/Nropasosw*Maxw;

if ((w*w-ResReal[k]*ResReal[k]-ResIm[k]*ResIm[k])>0)   then
N_E[k]:=w/sqrt(w*w-ResReal[k]*ResReal[k]-ResIm[k]*ResIm[k])
else  N_E[k]:=0;
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value+1+2*(l-1)].Addpoint(w,N_E[k]);
end;
Application.ProcessMessages;

end;



end; // end of repeated iterations : counter is l

Busy.Caption:='Not Busy';

end;

procedure TEliashberg.ECalcNClick(Sender: TObject);
var
 i: LongInt;
 x,y,Delta: Extended;

begin

Delta:=StrtoFloat(EDelta0.Text);

for i:=1 to 10000 do
begin
 x:=i/3000*Delta;
 if (x>Delta) then
 y:=x/(sqrt(x*x-Delta*Delta))
 else y:=0;
AuxGraph1.GenGraph[AuxGraph1.ActiveCurveNr.Value].Addpoint(x,y);

end;

end;

function TEliashberg.Lorentz (x,Centro,Ancho,Alto: Extended): Extended;

begin
Lorentz:=Ancho*Ancho*Alto*(1/(4*(x-Centro)*(x-Centro)+Ancho*Ancho)
-1/(3*Ancho*3*Ancho+Ancho*Ancho));
end;

function TEliashberg.AlphasqF(x: Extended): Extended;
begin

AlphasqF:= alphasq*(2*Lorentz(x,Centro,Ancho,Alto1)
                        +Lorentz(x,Centro2,Ancho2,Alto2));
{AlphasqF:= alphasq*(2*
Ancho*Ancho*Alto1*(1/(4*(x-Centro)*(x-Centro)+Ancho*Ancho)
-1/(3*Ancho*3*Ancho+Ancho*Ancho))
+Ancho2*Ancho2*Alto2*(1/(4*(x-Centro2)*(x-Centro2)+Ancho2*Ancho2)
-1/(3*Ancho2*3*Ancho2+Ancho2*Ancho2)));
}


end;


procedure TEliashberg.StopClick(Sender: TObject);
begin
Mistop:=True;

end;

end.
