unit uObservable;

interface

uses
  uObserver;

type
  IVMObservable = interface(IInterface)
  ['{9C7B982E-F429-4E49-8CD4-32E6FA6CA77C}']
    procedure Attach(aObserver: IVMObserver);
    procedure Detach(aObserver: IVMObserver);
    procedure NotifyObservers;
  end;

implementation

end.
