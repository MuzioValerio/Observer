unit uFactory;

interface

uses
  uTickTockTimer;

type
  TFactoryClass = class
  public
    class function CreateClockTimer: IClockTimer;
  end;

var
  gClockTimer: IClockTimer;

implementation

{ TFactoryClass }

class function TFactoryClass.CreateClockTimer: IClockTimer;
begin
  Result := TClockTimer.Create;
end;

end.
