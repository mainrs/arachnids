interface InternalHttp
    exposes [
        Error,
        Metadata,
        Request,
        Response,

        Method,
        Header,
        Body,
    ]
    imports []

Request : {
    url: Str,
    method: Method,
    headers: List Header,
    body: Body,
}

Response : [
    NetworkError,
    BadRequest Str,
    BadStatus Metadata (List U8),
    GoodStatus Metadata (List U8),
]

Metadata : {
    url : Str,
    statusCode: U16,
    statusText : Str,
    headers: List Header,
}

Method : [Get, Post]
Header : [Header Str Str]

Body : [
    EmptyBody,
    Body [MimeType Str] (List U8),
]

Error : [
    BadBody Str,
    BadRequest Str,
    BadStatus U16,
    NetworkError,
]
