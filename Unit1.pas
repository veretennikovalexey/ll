unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Math;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    function RATE( periods: Byte;  payment: Integer;  present: Integer ): Extended ;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  periods: Byte;
  payment: Integer;
  present: Integer;

  aa: Extended;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  periods := 60;      // количество месяцев
  payment := -45235;   // ежемесячная выплата, рублей
  present := 1417500; // приведённая стоимость, рублей ( другими словами, это деньги сегодня )

  aa := RATE( periods, payment, present );

  ShowMessage( FloatToStr( aa ) );
end;

function TForm1.RATE(periods: Byte; payment: Integer; present: Integer): Extended ;
const
   epsMax  = 1e-10 ;   // Set maximum epsilon for end of iteration
   iterMax = 10    ;   // Set maximum number of iterations
   guess   = 0.01  ;
var
  y0, y1, y, f: Extended ;
  x0, x1, rate : Extended ;
  i : Byte;
begin
  y  := 0;
  y0 := 0;
  y1 := 0;
  x0 := 0;
  x1 := 0;
  f  := 0;
  i  := 0;

  rate := guess;

  if abs( rate ) < epsMax then
    y := present * ( 1 + periods * rate ) + payment * periods
  else
    begin
      f := exp( periods * ln( 1 + rate ) );
      y := present * f + payment * ( 1 / rate ) * ( f - 1 );
    end;

  y0 := present + payment * periods;
  y1 := present * f + payment * ( 1 / rate ) * ( f - 1 );

  i := 0;
  x0 := 0;
  x1 := rate;

  while ( ( abs( y0 - y1 ) > epsMax ) and ( i < iterMax ) ) do
  begin
    rate := ( y1 * x0 - y0 * x1 ) / ( y1 - y0 );
    x0 := x1;
    x1 := rate;
    if ( abs( rate ) < epsMax ) then
      y := present * ( 1 + periods * rate ) + payment * periods
    else
      begin
        f := exp( periods * ln( 1 + rate ) );
        y := present * f + payment * ( 1 / rate ) * ( f - 1 );
      end;
    y0 := y1;
    y1 := y;
    i := i + 1;
  end;
  //return rate;

  result := rate;
end;

end.
