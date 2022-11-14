unit ModelAcao;

interface

uses
  Model.Interfaces;
   type
      TModelAcao = class(TInterfacedObject,iAcao)
         private
         FAcao : integer;
         FOperacao : string;
         FValor : Currency;
         FSaldo : Currency;
         procedure setAcao(value: integer);
         function getAcao: integer;
         function setValor(value: string):boolean;
         function getValor: currency;
         function getDescAcao(Value:integer):string;
         procedure setOperacao(value: integer);
         function getOperacao: string;
         function Calcular (_AOperacao: string; _Avalor,_ASaldo: currency): string;
         function ContemSaldoPOperacao(_Avalor, _ASaldo: currency): boolean;
         public
            constructor Create;
            destructor Destroy;override;
            class function New : iAcao;

         const descDep = 'Depositou';
               descSac = 'Sacou';
               descDev = 'Devolveu';

      end;
implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TModelAcao }

procedure TModelAcao.setAcao(value: integer);
begin
   FAcao := value;
   setOperacao(value);
end;

procedure TModelAcao.setOperacao(value: integer);
begin
   case value of
      0,2 : FOperacao := '+' ;
      1 :   FOperacao := '-' ;
   end;
end;

function TModelAcao.Calcular(_AOperacao: string; _Avalor,_ASaldo: currency): string;
begin
   if _AOperacao = '+' then
         Result := CurrToStr(_Asaldo + _AValor)
   else begin
      if ContemSaldoPOperacao(_Avalor,_ASaldo) then
         Result := CurrToStr(_Asaldo - _AValor)
      else
         Result := CurrToStr(_Asaldo);
   end;
end;

function TModelAcao.ContemSaldoPOperacao(_Avalor,_ASaldo: currency):boolean;
begin
   if _Asaldo >= _AValor then
      Result := true
   else begin
      Result :=false;
      ShowMessage('Valor da operação é maior que o saldo disponível.');
   end;
end;

constructor TModelAcao.Create;
begin

end;

destructor TModelAcao.Destroy;
begin
  inherited;
end;

function TModelAcao.getAcao:integer;
begin
   Result := FAcao;
end;

function TModelAcao.getDescAcao(Value: integer): string;
begin
   case value of
      0: result := descDep;
      1: result := descSac;
      2: result := descDev;
   end;
end;

function TModelAcao.getOperacao: string;
begin
   result := FOperacao;
end;

function TModelAcao.getValor: currency;
begin
   Result := FValor;
end;

function TModelAcao.setValor(value: string):boolean;
begin
   Result := False;
   if not Value.IsEmpty then begin
      value := StringReplace(Value,'.',',',[rfReplaceAll]);
      try
         StrToCurr(value);
      except
         ShowMessage('Insira apenas números!');
         Exit;
      end;
      FValor:= StrToCurr(value);
   end;
   Result := True;
end;

class function TModelAcao.New: iAcao;
begin
   Result := Self.Create;
end;

end.
