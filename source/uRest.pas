unit uRest;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.Rtti,
  FMX.Controls.Presentation, FMX.StdCtrls, System.JSON, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent,
  System.JSON.Types,System.JSON.Writers, System.Threading, System.Generics.Collections;


const
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
      url = 'https://www.blangkon.net/API/SampleLoadImg/APIImg.php?key=apiapi&act=';
  {$ELSE}
      //url = 'http://localhost/appru/API/SampleLoadImg/APIImg.php?key=apiapi&act=';
      url = 'https://www.blangkon.net/API/SampleLoadImg/APIImg.php?key=apiapi&act=';
  {$ENDIF}

type
  TStringArray = array of array of String;

function fnParseJSON(Cli : TRESTClient; Req : TRESTRequest; Resp :TRESTResponse;act : string):TStringArray;
function fnParseJSONbg(Cli : TRESTClient; Req : TRESTRequest; Resp :TRESTResponse;act : string):TStringArray;
function fnGetJSON(netHTTP : TNetHTTPClient; act : String):TStringArray;

var
  stat : String;

implementation

uses uFunc;

function fnParseJSON(Cli : TRESTClient; Req : TRESTRequest; Resp :TRESTResponse;act : string):TStringArray;
var
  JSONString : String;
  jDataArray : TJSONArray;
  jDataObject : TJSONObject;
  value : String;
  index : String;
  kol, bar, i, obj : integer;

  statE : String;
begin
  try
    try
      Cli.Disconnect;
      Cli.BaseURL := url + act;
      Req.Execute;
      statE := 'JSONSTring';
      JSONString := Resp.JSONText;

      jDataArray:= TJSONObject.ParseJSONValue(JSONString) as TJSONArray;
      jDataObject := TJSONObject(jDataArray.Get(0));

      kol := Pred(jDataObject.Size);
      bar := Pred(jDataArray.Size);

      SetLength(Result, kol + 1, bar + 1);
      for i:= 0 to Pred(jDataArray.Size) do
      begin
        jDataObject := TJSONObject(jDataArray.Get(i));
        for obj := 0 to Pred(jDataObject.Size) do
        begin
          index := jDataObject.Pairs[obj].JsonString.ToString;
          value := jDataObject.Pairs[obj].JsonValue.ToString;

          Result[obj, i] := fnReplaceStr(value, '"','');
        end;
      end;
    except
      SetLength(Result, 1, 1);
      Result[0,0] := 'null';
    end;
  finally
    begin
      try
      {$IF DEFINED(IOS) or DEFINED(ANDROID)}
        jDataArray.DisposeOf;
        jDataArray := Nil;
      {$ELSE}
        FreeAndNil(jDataArray); //Jika Error Hapus ini
      {$ENDIF}
      except

      end;
    end;
  end;
end;

function fnParseJSONbg(Cli : TRESTClient; Req : TRESTRequest; Resp :TRESTResponse;act : string):TStringArray;
var
  JSONStringbg : String;
  jDataArraybg : TJSONArray;
  jDataObjectbg : TJSONObject;
  valuebg : String;
  indexbg : String;
  kolbg, barbg, i, obj : integer;

  statEbg : String;
begin
  try
    try
      Cli.Disconnect;
      Cli.BaseURL := url + act;
      Req.Execute;
      statEbg := 'JSONSTring';
      JSONStringbg := Resp.JSONText;

      jDataArraybg:= TJSONObject.ParseJSONValue(JSONStringbg) as TJSONArray;
      jDataObjectbg := TJSONObject(jDataArraybg.Get(0));

      kolbg := Pred(jDataObjectbg.Size);
      barbg := Pred(jDataArraybg.Size);

      SetLength(Result, kolbg + 1, barbg + 1);
      for i:= 0 to Pred(jDataArraybg.Size) do
      begin
        jDataObjectbg := TJSONObject(jDataArraybg.Get(i));
        for obj := 0 to Pred(jDataObjectbg.Size) do
        begin
          indexbg := jDataObjectbg.Pairs[obj].JSONString.ToString;
          valuebg := jDataObjectbg.Pairs[obj].JsonValue.ToString;
          Result[obj, i] := fnReplaceStr(valuebg, '"','');
        end;
      end;
    except
      SetLength(Result, 1, 1);
      Result[0,0] := 'null';
    end;
  finally
    begin
      try
      {$IF DEFINED(IOS) or DEFINED(ANDROID)}
        jDataArraybg.DisposeOf;
        jDataArraybg := Nil;
      {$ELSE}
        FreeAndNil(jDataArraybg); //Jika Error Hapus ini
      {$ENDIF}
      except

      end;
    end;
  end;
end;

function fnGetJSON(netHTTP : TNetHTTPClient; act : String):TStringArray;
var
  strjsn : string;
  httpresult : IHTTPResponse ;
  jDataObject: TJSONObject;
  jDataArray : TJSONArray;
  value : String;
  index : String;
  kol, bar, i, obj : integer;
begin
  netHTTP.ConnectionTimeout := 58000;
  netHTTP.ResponseTimeout := 58000;

  try
    httpresult := netHTTP.get(url + act);

    strjsn := httpresult.ContentAsString();

    jDataArray:= TJSONObject.ParseJSONValue(strjsn) as TJSONArray;
    jDataObject := TJSONObject(jDataArray.Get(0));

    try
      kol := Pred(jDataObject.Size);
      bar := Pred(jDataArray.Size);

      SetLength(Result, kol + 1, bar + 1);
      for i:= 0 to Pred(jDataArray.Size) do
      begin
        jDataObject := TJSONObject(jDataArray.Get(i));
        for obj := 0 to Pred(jDataObject.Size) do
        begin
          index := jDataObject.Pairs[obj].JsonString.ToString;
          value := jDataObject.Pairs[obj].JsonValue.ToString;

          Result[obj, i] := fnReplaceStr(value, '"','');
        end;
      end;
    finally
      jDataArray.DisposeOf;
      jDataArray := nil;
    end;
  except
    SetLength(Result, 1, 1);
    Result[0,0] := 'null';
  end;
end;

end.
