unit uTickTockTimer;

interface

uses
  System.Classes, System.SysUtils, FMX.Types
  , uObserver;

type
  IClockTimer = interface(IInterface)
  ['{5F05B7B7-9300-4559-9A1D-104CF343108E}']
    procedure Attach(aObserver: IVMObserver);
    procedure Detach(aObserver: IVMObserver);

    function GetTime: string;
    property Time: string read GetTime;
  end;

  TClockTimer = class(TInterfacedObject, IClockTimer)
  strict private
    FTimer: TTimer;
    FInternalTime: TDateTime;
    FLstObservers: IInterfaceList;
    procedure Tick(Sender: TObject);
    function GetTime: string;
  protected
    procedure NotifyObservers;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Attach(aObserver: IVMObserver);
    procedure Detach(aObserver: IVMObserver);
    procedure DetachAll;

    property Time: string read GetTime;
  end;

function ClockTimer: IClockTimer;

implementation

function ClockTimer: IClockTimer;
begin
  Result := TClockTimer.Create;
end;

constructor TClockTimer.Create;
begin
  inherited Create;
  FTimer := TTimer.Create(nil);
  FTimer.Interval := 1000;
  FTimer.OnTimer := Tick;
  FTimer.Enabled := True;

  FLstObservers := nil;
end;

destructor TClockTimer.Destroy;
begin
  FTimer.Enabled := False;
  FreeAndNil(FTimer);
  DetachAll;

  inherited Destroy;
end;

function TClockTimer.GetTime: string;
begin
  Result := FormatDateTime('dd/mm/yyyy hh:nn:ss', FInternalTime);
end;

procedure TClockTimer.NotifyObservers;
begin
  for var I := 0 to Pred(FLstObservers.Count) do
    IVMObserver(FLstObservers[I]).UpdateObserver(Self);
end;

procedure TClockTimer.Attach(aObserver: IVMObserver);
begin
  if FLstObservers = nil then
    FLstObservers := TInterfaceList.Create;
  if FLstObservers.IndexOf(aObserver) < 0 then
    FLstObservers.Add(aObserver);
end;

procedure TClockTimer.Tick(Sender: TObject);
begin
  FInternalTime := Now;
  NotifyObservers;
end;

procedure TClockTimer.Detach(aObserver: IVMObserver);
begin
  if FLstObservers <> nil then
  begin
    FLstObservers.Remove(AObserver);
    if FLstObservers.Count = 0 then
      FLstObservers := nil;
  end;
end;

procedure TClockTimer.DetachAll;
begin
  if FLstObservers <> nil then
  begin
    FLstObservers.Clear;
    FLstObservers := nil;
  end;
end;

end.
