program VCLObserver;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FormMain},
  uObserver in 'common\uObserver.pas',
  uTickTockTimer in 'common\uTickTockTimer.pas',
  uObservable in 'common\uObservable.pas',
  uFactory in 'common\uFactory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
