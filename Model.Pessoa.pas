unit Model.Pessoa;

interface

uses
   Model.Interfaces, View.Principal;

   type
      TModelPessoa = Class(TInterfacedObject, iPessoa)
      private
         FNome : String;
         FId : integer;
         function setNome (Value:string): Boolean;
         procedure setId(value: integer);
         function getNome:string;
         function getId:Integer;
         function ApenasLetras(value: string): Boolean;
      public
         constructor Create;
         destructor Destroy;override;
         class function New : iPessoa;
   end;
implementation

uses
  Vcl.Dialogs;

constructor TModelPessoa.Create;
begin

end;

destructor TModelPessoa.Destroy;
begin
   inherited;
end;

function TModelPessoa.getId: Integer;
begin
   Result := FId;
end;

function TModelPessoa.getNome: string;
begin
   Result := FNome;
end;

procedure TModelPessoa.setId(value: integer);
begin

end;

class function TModelPessoa.New: iPessoa;
begin
   Result := Self.Create;
end;

function TModelPessoa.setNome(Value:string):Boolean;
begin
   Result := false;
   if not ApenasLetras(Value) then begin
      ShowMessage('Insira apenas letras!');
      Exit;
   end;
   FNome  := Value;
   Result := true;
end;

function TModelPessoa.ApenasLetras(value : string) : Boolean;
begin
  for var I := 1 to Length(value) do
    if (value[I] in ['0'..'9']) then begin
      Result := False;
      Exit;
    end;
  Result := True;
end;

end.
