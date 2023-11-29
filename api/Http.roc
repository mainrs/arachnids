interface Http
    exposes [
        Error,
        Request,
        Response,
        Header,
        Method,
        Body,

        bytesBody,
        jsonBody,
        stringBody,
        send,
    ]
    imports [
        Effect,
        InternalHttp,
        InternalTask,
        Task.{ Task },

        json.Core.{ json },
    ]

Error : InternalHttp.Error
Request : InternalHttp.Request
Response : InternalHttp.Response
Header : InternalHttp.Header
Method : InternalHttp.Method

## A request body.
Body : InternalHttp.Body

bytesBody : [MimeType Str], List U8 -> Body
bytesBody = Body

jsonBody : a -> Body where a implements Encoding
jsonBody = \x ->
    Body (MimeType "application/json") (json (Encode.toBytes x))

stringBody : [MimeType Str], Str -> Body
stringBody = \mimeType, str ->
    Body mimeType (Str.toUtf8 str)

handleStringResponse : Response -> Result Str Error
handleStringResponse = \response ->
    when response is
        BadRequest err -> Err (BadRequest err)
        NetworkError -> Err NetworkError
        BadStatus metadata _ -> Err (BadStatus metadata.statusCode)
        GoodStatus _ bodyBytes ->
            Str.fromUtf8 bodyBytes
            |> Result.mapErr
                \BadUtf8 _ pos ->
                    position = Num.toStr pos
                    BadBody "Invalid UTF-8 at byte offset \(position)"

send : Request -> Task Str Error
send = \req ->
    Effect.sendRequest (Box.box req)
    |> Effect.map handleStringResponse
    |> InternalTask.fromEffect
