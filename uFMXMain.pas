unit uFMXMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.Edit
  , uObserver
  , uTickTockTimer
  , uFactory;

type
  TFormFMXMain = class(TForm, IVMObserver)
    EditClock: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  public
    procedure UpdateObserver(const Sender: TObject);
  end;

var
  FormFMXMain: TFormFMXMain;

implementation

{$R *.fmx}

procedure TFormFMXMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  gClockTimer.Detach(self);
end;

procedure TFormFMXMain.FormCreate(Sender: TObject);
begin
  gClockTimer.Attach(self);
end;

procedure TFormFMXMain.UpdateObserver(const Sender: TObject);
begin
  if Sender is TClockTimer then
    EditClock.Text := (gClockTimer as TClockTimer).Time;
end;

initialization
  System.ReportMemoryLeaksOnShutdown := True;
  gClockTimer := TFactoryClass.CreateClockTimer;

finalization
  gClockTimer := nil;

end.
