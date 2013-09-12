unit UFuncoes;

interface

uses
  Windows, Forms, Messages, SysUtils, Classes, ExtCtrls, ShellApi, Printers,
  Graphics, IniFiles, PSApi, Winsock, WinSvc;

  function GetExeVersion(const FileName : TFileName) : String; overload;
  function GetExeVersion : String; overload;
  function GetVersion : String;
  function GetCopyright : String;
  function GetInternalName : String;
  function GetProductName : String;
  function GetFileDescription : String;
  function GetCompanyName : String;
  function GetContacts : String;

implementation

uses
  UInfoVersao, UConstantesDGE;

function GetExeVersion(const FileName : TFileName) : String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  Handle: Dword;
  Len: Longint;
  Data: Pchar;
  Buffer: Pointer;
  Tamanho: Dword;
  PFileName: Pchar;
begin
   PFileName := StrAlloc(Length(FileName) + 1);
   StrPcopy(PFileName, FileName);
   Len := GetFileVersionInfoSize(PFileName, Handle);
   Result := '';
   if (Len > 0) then
   begin
     Data := StrAlloc(Len + 1);
     if GetFileVersionInfo(PFileName, Handle, Len, Data) then
     begin
       VerQueryValue(Data, '\', Buffer, Tamanho);
       F := PFFI(Buffer);
       Result := Format('%d.%d.%d.%d ', [HiWord(F^.dwFileVersionMs),
                                         LoWord(F^.dwFileVersionMs),
                                         HiWord(F^.dwFileVersionLs),
                                         Loword(F^.dwFileVersionLs)]);
     end;
     StrDispose(Data)
   end;
   StrDispose(PFileName);
end;

Function GetExeVersion : String;
type
   PFFI = ^vs_FixedFileInfo;
var
   F       : PFFI;
   Handle  : Dword;
   Len     : Longint;
   Data    : Pchar;
   Buffer  : Pointer;
   Tamanho : Dword;
   Parquivo: Pchar;
   Arquivo : String;
begin
   Arquivo  := ParamStr(0);
   Parquivo := StrAlloc(Length(Arquivo) + 1);
   StrPcopy(Parquivo, Arquivo);
   Len := GetFileVersionInfoSize(Parquivo, Handle);
   Result := '';
   if Len > 0 then
   begin
      Data:=StrAlloc(Len+1);
      if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
      begin
         VerQueryValue(Data, '',Buffer,Tamanho);
         F := PFFI(Buffer);
         Result := Format('%d.%d.%d.%d',
                          [HiWord(F^.dwFileVersionMs),
                           LoWord(F^.dwFileVersionMs),
                           HiWord(F^.dwFileVersionLs),
                           Loword(F^.dwFileVersionLs)]
                         );
      end;
      StrDispose(Data);
   end;
   StrDispose(Parquivo);
end;

function GetVersion : String;
begin
  {$IFDEF DGE}
  Result := VERSION_NUMBER;
  {$ELSE}
  Result := TInfoVersao.GetInstance().getPropertyValue(ivFILE_VERSION);
  {$ENDIF}
end;

function GetCopyright : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivLEGAL_COPYRIGHT);
end;

function GetInternalName : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivINTERNAL_NAME);
end;

function GetProductName : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivPRODUCT_NAME);
end;

function GetFileDescription : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivFILE_DESCRIPTION);
end;

function GetCompanyName : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivCOMPANY_NAME);
end;

function GetContacts : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivCONTACTS);
end;

end.
