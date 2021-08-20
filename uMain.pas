unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls
  , uObserver
  , uTickTockTimer
  , uFactory;

type
  TFormMain = class(TForm, IVMObserver)
    pnlClock: TPanel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  public
    procedure UpdateObserver(const Sender: TObject);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

{ TForm1 }

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  gClockTimer.Detach(self);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  gClockTimer.Attach(self);
end;

procedure TFormMain.UpdateObserver(const Sender: TObject);
begin
  if Sender is TClockTimer then
    pnlClock.Caption := (gClockTimer as TClockTimer).Time;
end;

initialization
  System.ReportMemoryLeaksOnShutdown := True;
  gClockTimer := TFactoryClass.CreateClockTimer;

finalization
  gClockTimer := nil;

end.
