unit Model.Interfaces;

interface
  type
    iPessoa = interface
      ['{BA64006F-DC7F-4DD1-980B-5C732E99D38F}']
         function setNome (Value:string): Boolean;
         procedure setId(value: integer);
         function getNome:string;
         function getId:Integer;
         function ApenasLetras(value: string): Boolean;
    end;
    iAcao = interface
       ['{15D51ED7-4C14-4A3B-AB1D-A8366202366F}']
         procedure setAcao(value: integer);
         function getAcao: integer;
         function setValor(value: string):boolean;
         function getValor: currency;
         function getDescAcao(Value:integer):string;
         procedure setOperacao(value: integer);
         function getOperacao: string;
         function Calcular (_AOperacao: string; _Avalor,_ASaldo: currency): string;
         function ContemSaldoPOperacao(_Avalor, _ASaldo: currency): boolean;
    end;
implementation

end.
