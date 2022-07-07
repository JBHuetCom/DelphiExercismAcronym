unit uAcronym;

interface

  function abbreviate(const AValue : string) : string;

implementation

  uses
    System.SysUtils, System.StrUtils;

  function abbreviate(const AValue : string) : string;
    var
      Acronym : string;
      IsFirstChar, PrecededByApostroph : boolean;
    begin
      acronym := '';
      IsFirstChar := True;
      PrecededByApostroph := False;
      for var i : integer := Low(AValue) to High(AValue) do
        begin
          if i > (Low(AValue) + 1 ) then
            PrecededByApostroph := ('''' = AValue[i-1]);
          if (LowerCase(AValue[i]) >= 'a') AND (LowerCase(AValue[i]) <= 'z') then
            begin
            if IsFirstChar AND not PrecededByApostroph then
              begin
                acronym := acronym + UpperCase(AValue[i]);
                IsFirstChar := False;
              end;
            end
          else
            IsFirstChar := True;
        end;
      Result := acronym;
    end;

end.
