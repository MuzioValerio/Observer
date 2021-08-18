unit uFMXMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.Edit
  , uObserver
  , uTickTockTimer;

type
  TFormFMXMain = class(TForm, IVMObserver)
    EditClock: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  strict private
    FClockTimer: IClockTimer;
  public
    procedure UpdateObserver(const Sender: TObject);
  end;

var
  FormFMXMain: TFormFMXMain;

implementation

{$R *.fmx}

procedure TFormFMXMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FClockTimer.Detach(self);
  FClockTimer := nil;
end;

procedure TFormFMXMain.FormCreate(Sender: TObject);
begin
  FClockTimer := ClockTimer;
  FClockTimer.Attach(self);
end;

procedure TFormFMXMain.UpdateObserver(const Sender: TObject);
begin
  if Sender is TClockTimer then
    EditClock.Text := (FClockTimer as TClockTimer).Time;
end;

end.
